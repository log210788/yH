# assemble_index_html.ps1 for YH's Executive English Sanctuary
$ErrorActionPreference = "Stop"

Write-Host "Reading base template and JSON files..."
$baseHtml = [System.IO.File]::ReadAllText("$PSScriptRoot\template_base.html", [System.Text.Encoding]::UTF8)

$turns = [System.IO.File]::ReadAllText("$PSScriptRoot\turns.json", [System.Text.Encoding]::UTF8)
$vocab = [System.IO.File]::ReadAllText("$PSScriptRoot\vocab.json", [System.Text.Encoding]::UTF8)
$strengths = [System.IO.File]::ReadAllText("$PSScriptRoot\strengths.json", [System.Text.Encoding]::UTF8)
$polishes = [System.IO.File]::ReadAllText("$PSScriptRoot\polishes.json", [System.Text.Encoding]::UTF8)
$fixes = [System.IO.File]::ReadAllText("$PSScriptRoot\fixes.json", [System.Text.Encoding]::UTF8)
$places = [System.IO.File]::ReadAllText("$PSScriptRoot\places.json", [System.Text.Encoding]::UTF8)
$quiz = [System.IO.File]::ReadAllText("$PSScriptRoot\quiz.json", [System.Text.Encoding]::UTF8)

Write-Host "Substituting placeholders..."
$finalHtml = $baseHtml.Replace("__TRANSCRIPT_TURNS__", $turns)
$finalHtml = $finalHtml.Replace("__VOCAB_DB__", $vocab)
$finalHtml = $finalHtml.Replace("__STUDENT_STRENGTHS__", $strengths)
$finalHtml = $finalHtml.Replace("__GENTLE_POLISHES__", $polishes)
$finalHtml = $finalHtml.Replace("__ASR_FIXES__", $fixes)
$finalHtml = $finalHtml.Replace("__CULTURAL_PLACES__", $places)
$finalHtml = $finalHtml.Replace("__QUIZ_QUESTIONS__", $quiz)

[System.IO.File]::WriteAllText("$PSScriptRoot\index.html", $finalHtml, [System.Text.Encoding]::UTF8)

$size = (Get-Item "$PSScriptRoot\index.html").Length
Write-Host "SUCCESS! Generated index.html ($size bytes)."
