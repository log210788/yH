# build_turns_json.ps1 for YH's Executive English Sanctuary
$ErrorActionPreference = 'Stop'

function Get-Seconds($t) {
    $p = $t.Split(':')
    if ($p.Count -eq 2) { return [int]$p[0]*60 + [int]$p[1] }
    if ($p.Count -eq 3) { return [int]$p[0]*3600 + [int]$p[1]*60 + [int]$p[2] }
    return 0
}

Write-Host "Loading configuration and transcript..."
$chaptersRaw = [System.IO.File]::ReadAllText("$PSScriptRoot\chapters.json", [System.Text.Encoding]::UTF8)
$chapters = $chaptersRaw | ConvertFrom-Json

$asrRaw = [System.IO.File]::ReadAllText("$PSScriptRoot\asr_replacements.json", [System.Text.Encoding]::UTF8)
$asrReplacements = $asrRaw | ConvertFrom-Json

$vocabTagsRaw = [System.IO.File]::ReadAllText("$PSScriptRoot\vocab_tags.json", [System.Text.Encoding]::UTF8)
$vocabTags = $vocabTagsRaw | ConvertFrom-Json

$rawLines = Get-Content "$PSScriptRoot\transcripts\lesson -starl.txt" -Encoding UTF8
$rawTurns = @()
$currentSpeaker = ''
$currentTime = ''
$currentText = @()

foreach ($line in $rawLines) {
    if ($line -match '^([^|]+)\s*\|\s*([0-9:]+)') {
        if ($currentSpeaker -ne '') {
            $rawTurns += [PSCustomObject]@{
                rawSpeaker = $currentSpeaker.Trim()
                time = $currentTime.Trim()
                sec = (Get-Seconds $currentTime.Trim())
                text = ($currentText -join ' ').Trim()
            }
        }
        $currentSpeaker = $matches[1]
        $currentTime = $matches[2]
        $currentText = @()
    } else {
        if ($line.Trim() -ne '') {
            $currentText += $line.Trim()
        }
    }
}
if ($currentSpeaker -ne '') {
    $rawTurns += [PSCustomObject]@{
        rawSpeaker = $currentSpeaker.Trim()
        time = $currentTime.Trim()
        sec = (Get-Seconds $currentTime.Trim())
        text = ($currentText -join ' ').Trim()
    }
}

Write-Host "Parsed $($rawTurns.Count) raw speaking turns from transcript."

# Track which chapters have been assigned
$assignedChaps = @{}
$finalTurns = @()

for ($i = 0; $i -lt $rawTurns.Count; $i++) {
    $t = $rawTurns[$i]
    $turnNum = $i + 1
    $turnId = "turn-$turnNum"
    
    $chapId = ''
    $chapTitle = ''

    # Check each chapter in order
    foreach ($ch in $chapters) {
        if (-not $assignedChaps.ContainsKey($ch.id) -and $t.sec -ge $ch.minSec) {
            $chapId = $ch.id
            $chapTitle = $ch.title
            $assignedChaps[$ch.id] = $true
            break
        }
    }

    $speaker = if ($t.rawSpeaker -eq 'louie') { 'Louie' } else { 'YH' }
    $text = $t.text

    # Apply ASR replacements
    foreach ($asr in $asrReplacements) {
        if ($text.Contains($asr.match)) {
            $text = $text.Replace($asr.match, $asr.replace)
        }
    }

    # Apply Vocab tagging
    foreach ($vt in $vocabTags) {
        $patt = [regex]::Escape($vt.p)
        $regexPattern = "(?i)(?<!data-vkey=[`"'][^`"']*)\b($patt)\b(?![^<]*>)"
        if ([regex]::IsMatch($text, $regexPattern)) {
            $replacement = "<span class=`"vocab-mark`" data-vkey=`"$($vt.k)`" onclick=`"inspectVocab('$($vt.k)')`">`$1</span>"
            $text = [regex]::Replace($text, $regexPattern, $replacement)
        }
    }

    $finalTurns += [PSCustomObject]@{
        id = $turnId
        chapterId = $chapId
        chapterTitle = $chapTitle
        speaker = $speaker
        time = $t.time
        html = $text
    }
}

Write-Host "Writing turns.json..."
$json = $finalTurns | ConvertTo-Json -Depth 5
[System.IO.File]::WriteAllText("$PSScriptRoot\turns.json", $json, [System.Text.Encoding]::UTF8)

$size = (Get-Item "$PSScriptRoot\turns.json").Length
Write-Host "SUCCESS! Generated turns.json ($size bytes, $($finalTurns.Count) turns)."
