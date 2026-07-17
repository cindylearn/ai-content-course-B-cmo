# Skill · AI 数字人（工具：Higgsfield / Seedance）

## 🔑 怎么触发这个 skill（两种方式，任选一个）

| 方式 | 打什么 |
|---|---|
| ① 斜杠（最稳·直接点名）| `/suma-ai-05-avatar` |
| ② First Prompt（说一句话）| 「帮我做一个数字人主播」 |

> 两种效果一样：斜杠直接点名；First Prompt 打一句话，Claude 认关键词自己进。打不中就用斜杠。触发后一题一题问你。

> 🔴 **前置（跟 SKILL.md 一致，缺了先回 `suma-ai-00-setup`）：Notion + Google Drive connector 必连**（少了 Claude 建不了大脑、存不了成品）· 地基 + Notion 骨架先搭好 · 要好 Google Drive folder 链接（成品同步存这）。


> 🔴 **交互铁律（跟 SKILL.md 一致，这一包的任何一步都守）：问用户任何选择题 —— 一题一题问、一题一张可点选项卡（`AskUserQuestion`，每题最多 3–4 个选项，系统自动加「其他」）、**绝不一次全倒**。只有开放题（品牌名 / 具体挑刺 / 参考链接）才让他打字。**

> 🔴 **底层三层（跟 SKILL.md 一致，这一包出的每样东西都要套）：① 说服（大师：**Blair Warren 为客户处境正名**/自我说服/LF8/AIDA·PAS/Cialdini/Duarte 客户是英雄）· ② 语言（NLP：换框/未来预演/连续肯定/锚定）· ③ 动机（6 大人性需求：确定/新鲜/重要/爱与连接/成长/贡献）。做完要能说出「这套了哪个大师 + 哪个 NLP + 戳哪个人性需求」——说不出 = 只做了表面，重来。**



**在系统里的工位：** 让一个「数字主播」替你出镜口播——不敢/不方便真人露脸也能做品牌口播、个人 IP、口播短视频。同时也是**跨分镜锁定同一个人**的技术核心。

## 🔴🔴 第一步：先问「这个数字人怎么来？」（一题一张选项卡）

这是数字人的入口决定 —— **一次一题问用户**：

**Q1. 要哪种进阶数字人？（二选一 · 选项卡）**
> 🔴 只有想**锁定一个特定的人**才需要 05；只是想先 test 一支正常口播 → 回 `04`，它用脚本 persona 直接出 AI 人（画面+声音一起）就够。

1. **九宫格数字人**（AI 凭空生成、选一个锁定，不是真人本尊）→ 进 Q2 选 model + Q3 九宫格选脸。🔴 性别/年龄/气质照目标受众定。
   → 🔴 **出视频跟 04 一样：画面 + 声音一起 prompt**（`generate_audio=true`），**不用分开**。
2. **自己样子的数字人**（照某个真人本尊做 —— 长得像他 + 用他的声音）→ 提供下面 3 样素材，照片锁脸 + 语音克隆声。
   → 🔴 **出视频要「声音分开」**：要用他本人的克隆声对准口型 → 走「静音生成 + 逐句 TTS + PTS 合声」（**唯一要拆的情况**）。

> 🔴 **真人数字人要他给 3 样**（只给照片 = 长得像、但声音是别人的）：
> ❶ **照片** —— 3+ 张清晰正脸/多角度（正脸 · 侧一点 · 微笑），高清、光线均匀、脸无遮挡 → 锁脸，长得像本人。
> ❷ **语音样本（关键）** —— 一段干净录音 ~1 分钟：安静、近麦 ~15cm、无背景乐、连续说话 → `create_voice_from_confirmed_audio` 克隆他的声音，数字人用**他自己的声音**讲。样本脏 → 克隆薄、带杂音。
> ❸ **可选 · 一小段说话视频（几秒）** —— 参考他的神态/口型习惯，更像本人。
>
> （已经能真人亲自出镜实拍？那就不用数字人，直接实拍进 `04 AI口播`。）

**Q2.（选了 九宫格数字人 才问）用什么 model 出人物图？给选项 + 说清 credit：**
1. **Higgsfield `generate_image`** — 系统内直接出，省事（消耗 Higgsfield credit）
2. **ChatGPT / GPT image** — 学生自己在 ChatGPT 里生（自己的 ChatGPT 额度）
3. **其他生图工具** — 用户已有的
> 🔴 **说清每个要花谁的 credit / 额度**，让用户按自己有的选，别默认帮他花钱。

**Q3.（选了 九宫格数字人 才做）九宫格选脸 + 定妆照锁脸** —— 两步，中间停下等用户选（这套模板 05 自带，不用翻别包）：

**① 九宫格选人**（`generate_image`，1:1 正方，一张图 9 个不同的人）：
```
A single square 1:1 casting board arranged as a clean 3x3 grid of 9 passport-style
headshots of 9 DIFFERENT [目标市场] [men/women], all [age range] with a [vibe] look.
IMPORTANT: each of the 9 is a DIFFERENT individual with a DIFFERENT face — different
face shape, eyes, nose, eyebrows, lips, jawline, skin tone and hairstyle. They must
NOT look like the same person; do not reuse one face with different hair. Every cell:
head-and-shoulders, front-facing, neutral friendly expression, pure white background,
even soft lighting, consistent framing. Place a small clean number (1 to 9) in the
TOP-LEFT corner of each cell.
<真实感条款>
The 9 people:
1 — [脸1：脸型/眼/鼻/眉/唇/肤色/发型]
2 — [脸2：…]   3 — […]   4 — […]   5 — […]   6 — […]   7 — […]   8 — […]   9 — […]
```
- 🔴 **`[目标市场]/[men/women]/[age range]/[vibe]` 全部照你的「目标受众」填** —— 受众是谁，就出那种人。
- 🔴 **9 个不同的人，不是同一张脸换 9 个发型** —— 最容易错。**先把五官写死再写头发**。
- 🔴 **9 张脸清单写出来给用户看**，他才知道几号是谁。
- ⏸️ **停。等用户回一个号码（1–9），只能选 1 个。**

**② 定妆照锁脸**（拿到号码 → 把九宫格原图当参考图送回、prompt 点名号码）：
```
Using the attached 3x3 casting grid image as reference, recreate the EXACT same person
shown in CELL NUMBER [N] (the headshot labelled "[N]" in its top-left corner). Keep that
person's identity unchanged — same face shape, eyes, nose, eyebrows, lips, jawline, skin
tone and hairstyle as cell [N]; do not blend with the other faces.
[把 [N] 号那张脸的五官原样重述一遍] [气质] [服装]. Pure white background, front-facing,
neutral friendly expression, head-and-shoulders framing.
<真实感条款>
```
- 🔴 **不点名号码 = 9 张脸糊成「平均脸」**，跟选的不是同一人。
- 建议再出**不同角度各一张**（正脸 / 侧一点 / 微笑）→ 凑够 3 张脸参考图。

**`<真实感条款>`（① ② 都要带 —— 让脸像真实照片、不像 AI）：**
```
candid photo shot on a real camera (50mm, f/2.8), natural realistic skin texture with
visible pores, fine lines and subtle imperfections, natural facial asymmetry, true-to-life
natural lighting, slight film grain, documentary realism, looks like a real unretouched
photo of a real person, NOT AI-generated, no CGI, no 3D render, no plastic or
over-smoothed skin, no waxy look, no airbrushing, no over-saturation, no perfect symmetry.
```

🔴 **拿到锁定的参考图后**：这就是整支视频的脸。回 `04 AI口播` 生成。

## 🔴 生成视频的前置：Notion 要有脚本

数字人**光有脸不够** —— 要生成会讲话的口播视频，**必须先有完整脚本**（台词 + 分镜）。没脚本 → 先回 `02 AI文案` 写脚本，别急着生成。

## 两种用法

### 1. 主角本人 = 数字人（整支口播一致）
先出**一张人物参考图**（`generate_image`，9:16，锁脸/发型/衣着/场景），当每个分镜的 `image_references`，`seedance` 就能让 8 段视频**同一个人、同一套形象**、还能对上台词口型。
> 这就是「一个人讲 8 段」一致性的解法。

### 2. 画面里 show 一个数字主播（B-roll）
讲「AI 数字人」这个工具时，手机/屏幕铺满画面，里面是一个数字主播在讲。

## 🔴 踩坑 / 标准
- **数字人要「照片级真人」**：prompt 写 `PHOTOREAL, REALISTIC HUMAN presenter, a real-looking [本地] person talking to camera, NOT a cartoon, NOT a 3D avatar`。第一版出成卡通/塑料脸就是没写死这条。
- **人物一律本地** + 贴行业气质。
- 参考图要**具体到特征**（脸型/眼镜/衣着/痣/表），换镜不换人。
- 屏幕里的主播也**不要乱码字**。

## Prompt 骨架
```
generate_image: 一张 9:16 人物参考图，[受众 persona 具体特征] + [场景]
→ generate_video seedance_2_0, 9:16, generate_audio,
   medias=[{role:image_references, value:参考图job_id}],
   prompt=[同一套人物特征] + [该镜动作] + Saying:「台词」
```

## 接进系统
参考图 job_id 存好，整支视频复用 → 人物一致；数字主播镜头归到视频生产线（`7大AI启动包/04-《AI口播短视频》启动包`）。
