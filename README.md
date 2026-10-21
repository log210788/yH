# 🍂 YH — Executive Business English Sanctuary & Coaching Suite
## Preply Executive Business Coaching | Student: YH | Tutor: Lewis O'Shea (Louie)

An executive English sanctuary, conversation transcript repository, and workplace communication portal designed for **YH** (Retail & E-commerce Executive) to build commanding professional fluency across 7 critical corporate interaction domains: **Meetings, Presentations, Teamwork, Negotiations, Managing Teams, Communicating with Clients, and Interviews**.

🌐 **Live Executive Sanctuary Web App:** [https://log210788.github.io/yH/](https://log210788.github.io/yH/)

---

## 🌟 Latest Lesson: October 21, 2026 — The STAR-L Executive Masterclass

### Core Strategic Focus
- **The STAR-L Framework:** Structuring executive narratives with high agency (Situation $\rightarrow$ Primary Mandate $\rightarrow$ Decisive Actions Spearheaded $\rightarrow$ Quantifiable Results Delivered $\rightarrow$ Formative Learning).
- **Asymmetrical Information & Upward Management:** Applying the **70/30 Rule** to eliminate reporting blindspots and anticipate superior priorities.
- **Autonomous Multi-Tiered Scaling:** Managing 100+ personnel through structured spans of control (handling 4–5 regional directors with high-trust autonomy).
- **Commercial Acumen & Circuit Breakers:** Eliminating bad salesmanship (never "leaving money on the table") and installing "half-goal circuit breakers" for quality control.

📄 **Full Offline Lesson Notes:** [`LESSON_NOTES_TODAY.md`](./LESSON_NOTES_TODAY.md)

---

## 🏛️ Sanctuary Web App Features ([`index.html`](./index.html))

1. **Tab 1: 📜 Interactive Transcript & Inline Vocabulary (00:00 – 52:26)**
   - Complete 123-turn dialogue log organized into 6 thematic chapters.
   - Search filter, speaker toggle (*Both Speakers / YH Only / Louie Only*), and per-turn Web Speech UK audio synthesis.
   - 52 inline B2–C2 vocabulary words tagged with `${v("key", "word")}`. Hovering reveals a **Tippy.js** card with IPA, definition, and Japanese translation; clicking opens the sticky **Vocabulary Spotlight** sidebar.
   - Forensic note-taker fixes embedded via toggleable `fixBadge` pills.
2. **Tab 2: 📚 Vocabulary Dictionary (52 Items)**
   - Searchable and level-filtered (B2, C1, C2) master grid.
   - Clicking any timestamp (`🕒 MM:SS ↗`) smoothly jumps back to Tab 1, scrolls to that exact turn, and pulses the line with a golden glow (`.turn-highlight-flash`).
3. **Tab 3: ✨ Note-Taker Fixes & Natural Strengths**
   - **Section A:** 6 executive strengths celebrated (Qualitative & Quantitative synthesis, Sales-driving factors, High-agency resilience, Asymmetrical communication, Putting oneself in the boss's shoes, High-trust delegation).
   - **Section B:** 6 gentle phrasing polishes (*"In the moment"* vs *"Natural Executive Polish"*) with audio buttons and grammatical analysis.
   - **Section C:** Visual audit log of 20 note-taker speech-to-text corrections.
4. **Tab 4: 🏛️ Masterclass Topics & Strategy**
   - 4 rich editorial cards: The STAR-L Storytelling Architecture, Asymmetrical Information & Upward Alignment, Scaling Autonomous Teams (100+ Staff), and Commercial Acumen & Circuit Breakers.
5. **Tab 5: ☕ Peaceful Practice Sanctuary**
   - 12 interactive flip flashcards with Web Speech audio.
   - 6-question scenario-based context quiz with confetti celebrations.
   - 3 thoughtful reflection prompts for next lesson (including Mac *Keep Talking & Nobody Explodes* simulation prep).
6. **🌿 Calming Atmospheric Plugins**
   - HTML5 Canvas floating autumn breeze overlay (Gentle, Breeze, Still toggle).
   - Web Audio API ambient soundscape generator (*Kensington Breeze, Soft London Rain, Warm Study Hearth*).
   - 3 restful themes (*Bath Stone, Winchester Mist, Warm Study*) and UK voice speed toggle (`0.85×` and `1.0×`).

---

## 📂 Repository Architecture

```
yH/
├── index.html                          # Primary Live Executive Sanctuary (October 21, 2026 Masterclass)
├── LESSON_NOTES_TODAY.md               # Complete Markdown Executive Notes, ASR fixes & 52-term Lexicon
├── template_base.html                  # Core HTML5 Sanctuary Template Engine
├── assemble_index_html.ps1             # PowerShell compilation script
├── build_turns_json.ps1                # Transcript parsing, ASR fixing & vocab tagging engine
├── chapters.json                       # 6 thematic lesson chapters
├── turns.json                          # Full 123-turn cleaned dialogue with inline hooks
├── vocab.json                          # 52 B2-C2 executive vocabulary database with Japanese L1
├── strengths.json                      # 6 natural student strengths celebrated
├── polishes.json                       # 6 gentle phrasing polishes
├── fixes.json                          # 20 ASR note-taker speech-to-text corrections
├── places.json                         # 4 executive masterclass strategy cards
├── quiz.json                           # 6 interactive scenario questions
├── vocab-ladder-portal.html            # Preserved legacy portal (PREP Studio & 3-Tier Vocab Ladder)
├── closest-in-meaning.html             # 100-Question Closest-in-Meaning Mega-Vault
├── croc-brain-wheel.html               # Crocodile Brain "Spin & Sell" Pitch Wheel
├── marketing-scenarios.html            # 11 Interactive Commercial Scenarios & Vocab Lab
├── revision.html                       # Dedicated Vocab Ladder Revision & Homework page
├── studio.html                         # Dedicated Audio Recording Studio
├── transcripts/
│   └── lesson -starl.txt               # Raw note-taker transcript (October 21, 2026)
├── messages/
│   └── Learning needs.txt              # YH Preply profile, goals, and L1 transfer habits
├── Lessons/                            # Multi-week curriculum modules & lesson plans
└── Teacher-Materials/                  # Preply teacher playbooks, answer keys & lexicons
```
