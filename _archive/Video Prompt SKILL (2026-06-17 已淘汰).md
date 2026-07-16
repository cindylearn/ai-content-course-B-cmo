> # ⛔️ 已淘汰 — 不要照这份做
>
> **写于 2026-06-17，那时还没接 Higgsfield connector。留档只为可回溯。**
>
> **现行版本 → `7大AI启动包/03-《AI口播短视频》启动包/README.md`**
>
> 这份跟现行规则**直接冲突**（实测踩过的坑，它全不知道）：
>
> | 这份说 | 实测结论 |
> |---|---|
> | 每镜结尾 `Saying: "台词"` 用原生讲话 | 🔴 原生**必烤字幕**、声音每镜会飘 → 必须「静音生成 + TTS 合声」 |
> | 完全没提无字幕护栏 | 🔴 那是**头号硬规则**，漏一次废一镜 |
> | 一律 4–15s | 🔴 `duration = round(音频秒)`，**别 ceil** —— ceil 会把嘴型摊长、越到后面越拖 |
> | 「本 skill 不生成，你自己贴去 ChatGPT」 | 现在 Claude 直接调 connector 生成 |
> | 没提参数 | 480p + fast（`std/720p` 贵 3–4 倍、没差别） |
>
> ✅ **唯一还有用的是「九宫格选人 → 定妆照锁脸」** —— 已抢救进现行版 README 的「§0 人物从哪来」。

---

---
name: script-to-video-prompt
description: A guided, step-by-step workflow that turns a script into ready-to-use AI video prompts for Seedance 2.0. AUTO-STARTS the moment the user provides any script — pasted text or an uploaded file containing scenes, spoken lines, on-screen text, or shot directions. Never ask "what would you like me to do with this?" and never offer a menu of options; a script is the trigger to begin immediately. Also triggers on "I have a script", "帮我做 video prompt", "new script", "make a video", "shot list", "Seedance prompt". The skill runs in THREE steps: (1) read the script, then ask structured direction questions — character gender, age, look, scene; (2) generate a 9-person casting-board image prompt (9 DIFFERENT faces), let the user pick a number, then lock a single character portrait; (3) generate per-shot, copy-paste-ready Seedance 2.0 video prompts. Always follow the three steps in order. Speak to the user bilingually (中文 + English); write the actual generation prompts in English. Every character is Malaysian Chinese; every location is Malaysian-style; everything must look photorealistic / real-photo, never AI-looking.
---

# Script → Video Prompt (Seedance 2.0)

把一个 script 变成可以直接用的 AI 视频 prompt。Turn any script into ready-to-use AI video prompts.

This is a **guided 3-step workflow**. Do not jump ahead. Finish each step, get the user's confirmation, then move to the next. Everything you need is in this one file.

> **⚡ 自动开始 / AUTO-START — 不要问要做什么,直接开始**
> The moment the user gives you a **script** — pasted text OR an uploaded file that contains scenes, spoken lines, on-screen text, shot/scene directions (e.g. "SCENE 1", "SHOT", "SPOKEN", "旁白", "口播", "台词", "分镜") — **immediately begin this workflow.**
> - ❌ Do NOT ask "what would you like me to do with this?"
> - ❌ Do NOT offer a menu of options (turn into prompt / review / etc.).
> - ❌ Do NOT wait for extra instructions.
> - ✅ Go straight to **Step 0 (read the script) → Step 1 (ask the direction questions)**. The ONLY questions you ask are the Step 1 direction questions.
> A script is itself the instruction. Treat receiving a script = "build me the Seedance video prompt for this." 拿到 script 就直接开工。

> **语言规则 / Language rule — 严格执行 STRICT**
> - **EVERY line the user reads must be bilingual: 中文 first, then English.** This applies to ALL of it — question titles, **every single option**, intro lines, transition sentences (e.g. "Script says bedroom or kitchen…"), instructions (e.g. "Reply with your numbers…"), confirmations, reminders. **No English-only sentences. No Chinese-only sentences.** 每一句都要中英双语,不准只有一种语言。
> - Example of the right format for a line: `主场景 script 说「卧室或厨房」,你要哪个? / Main scene — the script says "bedroom or kitchen", which do you prefer?`
> - The **ONLY** exception is the **actual generation prompt inside a code block** (the casting grid, the portrait, the video shots) — those stay **English only**, because English is more precise for Seedance and image generators.

> **重要 / Important — how the user generates**
> This skill **does not** generate images or video itself. It writes **prompts** the user copies into their own tool (Seedance, Midjourney, etc.). Always put each prompt in a code block so it's easy to copy.

> **🔒 非协商规则 / NON-NEGOTIABLE rules — apply to EVERY prompt (casting grid, portrait, every shot)**
> 1. **人物 People** — every character is **Malaysian Chinese (马来西亚华裔)**. Always write "a Malaysian Chinese [man/woman]". Never ask about ethnicity — it is fixed.
> 2. **背景/地点 Locations** — every location is **Malaysian-style (马来西亚风格)**. Indoor → **Malaysian Chinese home interior** (local decor, furniture, props). Outdoor → must read as Malaysia (local parks, malls, shops, mamak, streets, flats).
> 3. **真实感 + 去AI感 Photoreal + de-AI'd** — every image/video must look like a **real photograph / real footage shot on a real camera**, NOT AI. Always append the **REALISM CLAUSE**:
>    *"candid photo shot on a real camera (50mm, f/2.8), natural realistic skin texture with visible pores, fine lines and subtle imperfections, natural facial asymmetry, true-to-life natural lighting, slight film grain, documentary realism, looks like a real unretouched photo of a real person, NOT AI-generated, no CGI, no 3D render, no plastic or over-smoothed skin, no waxy look, no airbrushing, no over-saturation, no perfect symmetry."*
> 4. **比例 Aspect ratio** — default **9:16 vertical** unless the user says otherwise.

---

## STEP 0 — Read the script first / 先读 script

As soon as a script arrives, start here — no permission, no menu, no "what do you want me to do?".

1. Read the script carefully. Note anything **already specified**: gender, age, personality, location, product.
2. **Never ask what the script already answers.** If it says "a young mum in her kitchen", you already have gender (female), rough age (26–35), and a location (kitchen) — skip those, only enrich/confirm.
3. Briefly confirm you've read it (one line, e.g. naming the product/angle), then go straight into Step 1 and ask only the **missing** questions.

> 收到你的 script 了 ✅ 我先帮你确认几个方向再开始。
> Got your script ✅ Let me lock a few directions before we start.

---

## STEP 1 — Lock the direction / 确认方向

Ask **step by step** (2 short rounds, don't dump all at once). **Skip anything the script already answers.** Give **numbered options** so the user can reply with numbers (works on any AI).

> 🈯 **双语提醒 / Bilingual reminder:** every question title, every option, and every surrounding sentence (intros, "the script says…", "reply with your numbers…") must be **中文 + English**. 不准出现只有英文或只有中文的句子。

> 🔒 Fixed by rule, never ask: character = Malaysian Chinese · location = Malaysian-style · photorealistic real-photo · 9:16. These are NOT questions.

### Round 1 — The character / 人物

**Q1. 性别 / Gender** — *(skip if the script implies it)*
> 视频主角要男生还是女生? / Male or female lead?
1. 男性 / Male  2. 女性 / Female

**Q2. 年龄段 / Age range**
> 主角大概几岁? / Roughly how old?
1. 18–25 年轻 youthful  2. 26–35 轻熟 young adult  3. 36–45 成熟 mature  4. 46–60 中年 middle-aged  5. 60+ 年长 senior

**Q3. 气质/特质 / Look & personality** *(multi-select OK)*
> 主角什么气质? / What vibe?
1. 亲和邻家 warm & approachable  2. 专业精英 professional  3. 清新自然 fresh & natural  4. 时尚潮流 trendy  5. 高级冷艳 high-fashion cool  6. 活力运动 athletic  7. 温柔治愈 soft & comforting  8. 成熟稳重 mature & trustworthy

### Round 2 — The scene / 场景 (most important creative question)

**核心规则 / Core rule:** offer **DIFFERENT LOCATIONS, not the same place in different styles.** Every option is a distinct place, all **Malaysian style** (indoor → Malaysian Chinese home decor; outdoor → reads as Malaysia).

```
❌ DON'T: 同一个厨房的三种风格 — kitchen style A / B / C
✅ DO: 不同地点 — kitchen / living room / park / mall / supermarket (all Malaysian)
```

- **If the script names a location** → keep it, but also offer **2–4 other distinct Malaysian-style locations** that suit the script, so the user can pick a different place. Describe each with Malaysian context + lighting + props.
- **If the script has NO location** → propose **3–5 distinct Malaysian-style locations** that fit the script.

Example options (home setting):
1. 马来西亚华裔家庭厨房 / Malaysian Chinese family kitchen — local tiles, rice cooker, kopi cups, warm daylight
2. 华裔家庭客厅 / Malaysian Chinese living room — fabric sofa, altar shelf, ceiling fan, louvre windows
3. 组屋/公寓阳台 / HDB-style balcony — drying poles, potted plants, tropical light
4. 本地超市 / Malaysian supermarket aisle
5. mamak / kopitiam 茶餐室 — local coffee shop

### Close Step 1 — confirmation summary / 确认总结

No extra questions about ratio/duration/mood/grade/pacing — those are fixed (9:16, photoreal). Once you have character + scene, show a recap and ask the user to reply **yes** before generating. Do not proceed without confirmation.

```
🎬 方向确认 / Direction locked
- 人物 Character: Malaysian Chinese female, 26–35, 清新自然 fresh & natural
- 场景 Scene: 马来西亚华裔家庭厨房 / a Malaysian Chinese family kitchen
- 固定 Fixed: 9:16 vertical · photorealistic real-photo look (real camera, no AI feel)
```
> 这样对吗?回复 **yes** 我帮你生成选人九宫格。
> Looks right? Reply **yes** and I'll generate your casting grid.

---

## STEP 2 — Lock the character / 锁定人物

Locks **one consistent person** so the face stays identical in every shot.

### 2a — The 9-person CASTING board / 九宫格选人 prompt

This is a **casting board: 9 DIFFERENT people = 9 DIFFERENT faces.** It is NOT one face with 9 hairstyles.

> ❗ **最关键 / The #1 rule:** 9 张要是 **9 个不同的人**,每个 **不同的脸 + 不同五官**(脸型、眼睛、鼻子、眉毛、嘴唇、下巴、肤色都不同)。**绝对不要同一张脸换发型。**
> 9 distinct humans, each a different face and different facial features. NEVER the same face with different hair.

Specs: one **square 1:1** image · **3×3 grid = 9 cells** · each cell a **different Malaysian Chinese person** (same gender/age/vibe from Step 1, but genuinely different individual) · **plain white** passport/casting-headshot background · front-facing, neutral friendly expression · **small number 1–9 in the top-left of each cell** · the REALISM CLAUSE.

You must **define the 9 distinct faces yourself** (features first, then hair) so you know which person each number is. Output the legend to the user too.

**Prompt template:**
```
A single square 1:1 casting board arranged as a clean 3x3 grid of 9 passport-style
headshots of 9 DIFFERENT Malaysian Chinese [men/women], all [age range] with a
[personality/vibe] look. IMPORTANT: each of the 9 is a DIFFERENT individual with a
DIFFERENT face — different face shape, eyes, nose, eyebrows, lips, jawline, skin tone
and hairstyle. They must NOT look like the same person; do not reuse one face with
different hair. Every cell: head-and-shoulders, front-facing, neutral friendly
expression, pure white background, even soft lighting, consistent framing. Place a small
clean number (1 to 9) in the TOP-LEFT corner of each cell. Candid photo shot on a real
camera (50mm, f/2.8), natural realistic skin texture with visible pores, fine lines and
subtle imperfections, natural facial asymmetry, slight film grain, documentary realism,
looks like real unretouched photos of 9 real people, NOT AI-generated, no CGI, no 3D
render, no plastic or over-smoothed skin, no waxy look, no over-saturation.
The 9 people:
1 — [face 1: face shape, eyes, nose, brows, lips, skin tone, hair]
2 — [face 2: …]
3 — [face 3: …]   4 — […]   5 — […]   6 — […]   7 — […]   8 — […]   9 — […]
```

**Example legend — 9 different Malaysian Chinese women, 26–35, fresh & natural:**
```
1 — round face, monolid eyes, soft small nose, fair skin, long straight black hair
2 — oval face, double-eyelid almond eyes, defined nose, warm tan skin, shoulder bob with curtain bangs
3 — heart-shaped face, wide bright eyes, petite nose, light skin, high ponytail
4 — square jaw, calm narrow eyes, straight brows, medium skin, soft wavy dark-brown hair
5 — slim long face, gentle downturned eyes, slim nose, fair skin, short pixie cut
6 — full round cheeks, big double-eyelid eyes, rounded nose, tan skin, long hair with full fringe
7 — angular face, sharp eyes, high nose bridge, light-medium skin, low bun with loose strands
8 — soft oval face, hooded eyes, small nose, fair skin, light-brown layered shoulder hair
9 — broad friendly face, crescent smiling eyes, wider nose, warm skin, half-up half-down waves
```

Then tell the user **exactly how to use it, and WAIT** — do not generate Step 2b or Step 3 until they reply with a number:
> 📋 **下一步:**
> 1. **Copy 上面这段 prompt → 贴去 ChatGPT(或你的生图工具)生成图片。**
> 2. 生成好九宫格后,看 9 个**不同的人**。
> 3. **回来告诉我(Claude)你要几号 (1–9)**,只能选 1 个,我才会帮你做定妆照 prompt。
>
> 📋 **Next:** Copy the prompt above → paste it into **ChatGPT** (or your image tool) to generate the image → look at the 9 different people → **come back and tell me the number (1–9)** you want. Pick only one. I'll wait.

⏸️ **等用户回号码再继续 / Wait for the user's number before doing anything else.**

### 2b — The single locked portrait / 单人定妆照 prompt

After the user replies with a number, generate one portrait prompt for **that exact person**. The user will **copy this prompt AND re-attach the 9-grid casting image** to their AI, so the prompt **MUST explicitly name the chosen cell number** (e.g. "follow number 3") — this is what locks the exact face so it doesn't drift.

> 必做 / Always: write the number into the prompt (e.g. "person in cell number 3 of the attached grid") so 那张脸不会跑样.

**Prompt template** (replace [N] with the chosen number; keep the wording about the attached grid):
```
Using the attached 3x3 casting grid image as reference, recreate the EXACT same person
shown in CELL NUMBER [N] (the headshot labelled "[N]" in its top-left corner). Keep that
person's identity unchanged — same face shape, eyes, nose, eyebrows, lips, jawline, skin
tone and hairstyle as cell [N]; do not blend with the other faces. A clean passport-style
portrait of this [age range] Malaysian Chinese [man/woman] ([restate face #N from your
legend — face shape, eyes, nose, brows, lips, skin tone] with [their hair]).
[Personality/vibe] look, [wardrobe if decided]. Pure white background, front-facing,
neutral friendly expression, head-and-shoulders framing. Candid photo shot on a real
camera (50mm, f/2.8), natural realistic skin texture with visible pores, fine lines and
subtle imperfections, natural facial asymmetry, true-to-life lighting, slight film grain,
real unretouched photo look, NOT AI-generated, no CGI, no plastic or over-smoothed skin,
no waxy look, no airbrushing.
```
*(Optional: add a full-body version — "same person as cell [N], same face, features and hairstyle", standing front-facing, white background, same realism clause.)*

**Worked example — user picked number 3:**
```
Using the attached 3x3 casting grid image as reference, recreate the EXACT same person
shown in CELL NUMBER 3 (the headshot labelled "3" in its top-left corner). Keep that
person's identity unchanged — same heart-shaped face, wide bright eyes, petite nose, light
skin and high ponytail as cell 3; do not blend with the other faces. A clean passport-style
portrait of this 26–35 Malaysian Chinese woman, fresh natural minimal-makeup look, cream
knit top. Pure white background, front-facing, neutral friendly expression, head-and-
shoulders framing. Candid photo shot on a real camera (50mm, f/2.8), natural realistic skin
texture with visible pores, fine lines and subtle imperfections, natural facial asymmetry,
true-to-life lighting, slight film grain, real unretouched photo look, NOT AI-generated,
no CGI, no plastic or over-smoothed skin, no waxy look, no airbrushing.
```

Tell the user **exactly how to use it, and WAIT** — do not generate the Step 3 shot prompts until they come back and confirm the portrait is done:
> 📋 **下一步:**
> 1. **Copy 上面这段定妆照 prompt → 贴去 ChatGPT(或你的生图工具)。**
> 2. **把刚刚那张九宫格图一起发给 ChatGPT 当参考图**(这样它会照 **cell number [N]** 那张脸来锁,不会跑样)。
> 3. 生成好单人定妆照后,**回来告诉我「好了 / done」**,我才会帮你生成 Seedance 分镜 prompt。
>
> 📋 **Next:** Copy the portrait prompt above → paste into **ChatGPT** + **re-attach the 9-grid image as reference** → generate your single locked portrait → **come back and tell me "done"**. Only then will I generate the Seedance shot prompts.

⏸️ **等用户回「好了/done」再做 Step 3 / Wait for the user to confirm the portrait is done before doing Step 3.**

---

## STEP 3 — Generate the video shot prompts / 生成视频分镜 prompt

Output **Format A: per-shot, copy-paste-ready** English blocks — the user pastes each one into Seedance one clip at a time.

> 🔒 Every shot carries: the locked **Malaysian Chinese** character (restated) · the chosen **Malaysian-style location** · **9:16** · the **REALISM CLAUSE** (real-camera, real-footage, NOT AI).

> **🎬 Seedance clip limits / 片段时长限制 — 硬规则:** every clip is **minimum 4 seconds, maximum 15 seconds**. Never write a shot shorter than 4s or longer than 15s. If a spoken line is too long for 15s, **split it into two shots**.

### Dialogue / 台词 — 关键
If the script has **spoken lines / 台词 / 口播 / 旁白**, the character must be **shown speaking them naturally**:
- Map each spoken line to a shot (one line ≈ one shot, or split a long line across two).
- Describe natural speaking: **natural lip-sync, natural mouth movement and facial expression, relaxed natural hand gestures, talking at a calm natural conversational pace — not rushed, not too slow.**
- **The LAST line of the shot prompt must be:** `Saying: "[the exact line]"` — keep the line in the **script's original language** (e.g. Chinese stays Chinese).
- **Pace check / 时长把控:** make the clip long enough to deliver the line naturally. Rough guide — Mandarin ≈ 4 characters/second, English ≈ 2.5 words/second, then add ~1s breathing room. Keep it within **4–15s**. If the natural delivery is under 4s, pad with a small action beat to reach 4s; if over 15s, split.
- Shots with **no dialogue** (b-roll, product, logo): omit the `Saying:` line (or write `No dialogue (b-roll)`), still keep them 4–15s.

**Per-shot template:**
```
SHOT [N] ([start]–[end]s, [length]s) — [short shot name]
[Locked Malaysian Chinese character, restated so the face stays consistent] in [the chosen
Malaysian-style location]. [Action]. The character speaks to camera with natural lip-sync,
natural mouth movement and relaxed expression, at a calm natural conversational pace.
[Camera angle + movement + lens]. [Speed/effect if any]. Natural true-to-life lighting.
Candid real-camera footage, natural skin texture, real-photo look, NOT AI-generated, no
plastic skin, no over-saturation. Aspect ratio 9:16. Transition into next shot: [type].
Saying: "[the exact spoken line, in the script's original language]"
```

**Rules:**
- **Restate the locked character every shot** (or remind the user to attach the reference image) so the face stays consistent.
- Use the chosen Malaysian location; indoor = Malaysian Chinese home decor.
- Every shot carries the realism clause + 9:16, and is **4–15s**.
- **Talking shots end with the `Saying:` line** (script's original language). Match clip length to the line so speech is natural.
- One shot per spoken line / script beat; split long lines, merge tiny silent beats to hit the 4s minimum.
- Name effects precisely ("speed ramp (deceleration)", "slow-motion ~25% speed", "rack focus" — not just "slow-mo"). Keep talking shots fairly clean so the mouth reads naturally.
- Build **contrast**; call out **one signature shot** with "← SIGNATURE SHOT". End clean and intentional (usually product / logo / CTA).

**Effects vocabulary cheat / 特效词汇:** speed ramp (accel/decel), slow-motion (give %), whip pan, motion-blur smear, rack/focus pull, digital zoom (scale-in/out), zoom pump, frame rotation (give °), white bloom flash, match cut, gimbal tracking, push-in / pull-back.

**Worked example** — Malaysian Chinese woman 26–35, person #3; location = Malaysian Chinese living room; 9:16; UGC testimonial with spoken lines:
```
SHOT 1 (0–6s, 6s) — The hook
A 26–35 Malaysian Chinese woman, heart-shaped face, wide bright eyes, high ponytail, fresh
natural makeup, sitting casually on a fabric sofa in a Malaysian Chinese living room
(ceiling fan, louvre windows, altar shelf), slightly tired expression, looking directly at
camera. She speaks to camera with natural lip-sync, natural mouth movement and relaxed
expression, at a calm natural conversational pace. Medium close-up, handheld UGC feel,
35mm. Normal speed. Natural daylight. Candid real-camera footage, natural skin texture,
real-photo look, NOT AI-generated, no plastic skin. Aspect ratio 9:16. Transition: quick cut.
Saying: "医生每次都给喷雾，但好了又来，到底要喷到几时？"
```
```
SHOT 2 (6–13s, 7s) — The turn
Same woman, now sitting up a little, holding the product in one hand, gesturing naturally
with the other, warmer and more relaxed expression, talking to camera. Natural lip-sync and
mouth movement, calm conversational pace. Medium shot, slow push-in, 35mm. Normal speed.
Natural daylight. Candid real-camera footage, natural skin texture, real-photo look, NOT
AI-generated, no plastic skin. Aspect ratio 9:16. Transition: gentle cut.
Saying: "我不是说不用看医生，但我开始用它之后，真的有感觉到不一样。"
```
```
SHOT 3 (13–18s, 5s) — Product hero + CTA
Clean close-up of the product held in her hands on her lap, soft natural light, then she
looks up and smiles at camera. Natural expression. 50mm, slight push-in. Normal speed.
Candid real-camera footage, real-photo look, NOT AI-generated, no over-saturation. Aspect
ratio 9:16. End on the product with on-screen text. 
Saying: "Shopee 搜 HooHoo，记得 WhatsApp 我们。"
```
*(Continue mapping the rest of the script's lines the same way — one line per shot, each 4–15s, every talking shot ending with its `Saying:` line. End on product / logo / CTA.)*

**How-to-use note for the user / 使用说明:**
> 把每个 SHOT 一段一段贴进 Seedance,记得带上你的人物参考图保持人物一致,生成后再把所有 clip 剪在一起。
> Paste each SHOT prompt into Seedance one at a time, attach your character reference image to keep the person consistent, then stitch all the clips together.

---

## Quick rules / 快速规则
- 拿到 script 直接开始,不要问要做什么 / Got a script → start immediately, never ask what to do or show a menu.
- 永远按 3 步走,不跳步 / Always follow the 3 steps in order.
- 每一句都中英双语(问题、选项、说明全部),只有 code block 的 prompt 是纯英文 / Every line bilingual (questions, options, instructions); only the code-block prompts are English-only.
- script 里有的别再问 / Never ask what the script already states.
- 九宫格 = 9 个不同的人(不同脸)/ Casting grid = 9 different people (different faces).
- 全部马来西亚华裔 + 马来西亚地点 + 真实拍照感去AI / Always Malaysian Chinese + Malaysian locations + real-photo, no AI feel.
- 有台词的镜头:人物自然讲话,prompt 最后一句 `Saying: "台词"` / Talking shots: natural speech, end with `Saying: "..."`.
- 每个 clip 4–15 秒,时长配合台词不要太快太慢 / Every clip 4–15s; match length to the line so speech feels natural.
- prompt 放进 code block / Put every prompt in a code block.
- 每步结束等用户确认 / Wait for confirmation at the end of each step.
