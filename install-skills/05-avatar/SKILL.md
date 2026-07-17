---
name: suma-ai-05-avatar
description: >-
  SUMA AI 内容系统 · 第 05 步。做照片级真人数字主播替你出镜（选 model / 9宫格 / 做自己样子）。
  触发词：数字人 / 数字分身 / 数字主播 / 虚拟人 / avatar。
  跟用户说话中英双语；教练式一题一题问。
metadata:
  type: reference
  scope: SUMA AI内容课 · 独立 skill · part 05
---

# suma-ai-05-avatar —— 做照片级真人数字主播替你出镜（选 model / 9宫格 / 做自己样子）。

## 🔑 怎么触发这个 skill（两种方式，任选一个）

| 方式 | 打什么 |
|---|---|
| ① 斜杠（最稳·直接点名）| `/suma-ai-05-avatar` |
| ② First Prompt（说一句话）| 「帮我做一个数字人主播」 |

> 两种效果一样：斜杠直接点名；First Prompt 打一句话，Claude 认关键词自己进。打不中就用斜杠。触发后一题一题问你。

> 🔴 **交互铁律：** 问用户任何选择题 → 一题一题、一题一张可点选项卡（`AskUserQuestion`，每题≤4 个+「其他」）、**绝不一次全倒**。只有开放题才打字。
> 🔴 **底层三层：** 出的每样东西都套 ① 说服（大师：**Blair Warren 为处境正名**/自我说服/LF8/AIDA·PAS/Cialdini/Duarte）· ② 语言（NLP）· ③ 动机（6 大人性需求）。说得出「用了哪个大师+哪个NLP+戳哪个需求」，说不出＝重来。

> 🔴 **强制记录：** 全程把决定/产出记进用户的「业务 md」（`业务-<品牌名>.md`）——品牌地基、每条内容的角度/大师/需求、Notion 结构、产出链接。没有这个文件 → 先建。

> 🔴🔴 **前置闸门（先查再做，缺了就挡）：**
> 1. **connector 连好没？** 🔴 **Notion + Google Drive + GitHub 必连**（Notion 建大脑、Drive 存成品、GitHub 装 skill）；出图/视频还要 Higgsfield、剪片要 ChatCut。缺 → 让她去 Claude 设置 → Connectors 连，或回 `suma-ai-00-setup`。🔴 **还要她的 Google Drive folder 链接**（成品同步存这），没有先要。
> 2. **地基做了吗？** 有没有「业务 md」+ 品牌地基（品牌名/受众/红线/命名）？没有 → **先去 `suma-ai-00-setup`**，别在这开工。
> 3. **Notion 骨架搭了吗？** dashboard + folder（品牌地基/内容矩阵/素材库/成品归档）+ 内容矩阵 database 建好没？没有 → 先回 00 搭。
> 缺任何一条 → 停下，先补，别硬往下做。

---

> 🔴🔴 **动手前必做（第 0 件事）：先用 `Read` 把本文件夹里的每一个 `.md` 文件读一遍**（框架 / NLP / SOP / 模版 —— 完整规则在那里），读进来再开工。**别只看这份 SKILL.md 就动手 = 出烂成品。**

## 🔴 第一步：先问「这个数字人怎么来？」（一次一题）
**Q1. 要哪种进阶数字人？（二选一）**
- **A · 九宫格数字人**：AI 凭空生成、选一个锁定，不是真人本尊 → 进 Q2 选 model + Q3 九宫格选脸。性别/年龄/气质照目标受众定。🔴 **出视频画面+声音一起 prompt**（`generate_audio=true`），**不用分开**。
- **B · 自己样子的数字人**：照真人本尊做（像他 + 用他的声音）→ 要下面 3 样素材。🔴 **出视频要「声音分开」**：静音生成 + 逐句 TTS（他本人克隆声）+ 按 PTS 合声对口型 —— **唯一要拆的情况**。
- 只想先 test 一支普通口播、不锁定特定人 → 回 04 用脚本 persona 直接出 AI 人就够，不用 05。

**🔴 选 B 要用户给 3 样**（只给照片=长得像但声音是别人的）：
1. **照片** 3+ 张清晰正脸/多角度（正脸·侧一点·微笑），高清、光线均匀、脸无遮挡 → 锁脸。
2. **语音样本（关键）** 一段干净录音 ~1 分钟（安静、近麦 ~15cm、无背景乐、连续说话）→ `create_voice_from_confirmed_audio` 克隆声音；样本脏 → 克隆薄带杂音。
3. **可选·一小段说话视频（几秒）** 参考神态/口型习惯，更像本人。

**Q2.（选 A 才问）用什么 model 出人物图？** 给选项 + 说清花谁的额度（Higgsfield `generate_image` 消耗 Higgsfield credit / ChatGPT image 用学生自己额度 / 其他已有工具）。🔴 **别默认帮用户花钱。**

## 🔴 Q3（选 A 才做）九宫格选脸 + 定妆照锁脸（两步，中间停下等号码）
**① 九宫格选人**（`generate_image` 1:1 正方，一张图 9 个不同的人）：
```
A single square 1:1 casting board arranged as a clean 3x3 grid of 9 passport-style
headshots of 9 DIFFERENT [目标市场] [men/women], all [age range] with a [vibe] look.
IMPORTANT: each of the 9 is a DIFFERENT individual with a DIFFERENT face — different
face shape, eyes, nose, eyebrows, lips, jawline, skin tone and hairstyle. do not reuse
one face with different hair. Every cell: head-and-shoulders, front-facing, neutral
friendly expression, pure white background, even soft lighting. Place a small clean
number (1 to 9) in the TOP-LEFT corner of each cell.
<真实感条款>
The 9 people: 1 — [脸1:脸型/眼/鼻/眉/唇/肤色/发型]  2 — [脸2:…] … 9 — […]
```
🔴 `[目标市场]/[men/women]/[age range]/[vibe]` **照目标受众填**（受众是谁就出那种人）；人物一律本地人。🔴 **9 个不同的人，不是同一张脸换 9 个发型** —— 先把五官写死再写头发。🔴 **9 张脸清单列给用户看**。⏸️ 停，等用户回一个号码（1–9）。

**② 定妆照锁脸**（拿号码 → 把九宫格原图当参考图送回、prompt 点名号码）：
```
Using the attached 3x3 casting grid image as reference, recreate the EXACT same person
shown in CELL NUMBER [N] (labelled "[N]" top-left). Keep identity unchanged — same face
shape, eyes, nose, eyebrows, lips, jawline, skin tone, hairstyle as cell [N]; do not
blend with other faces. [把 N 号五官原样重述] [气质] [服装]. Pure white background,
front-facing, neutral friendly expression, head-and-shoulders framing.
<真实感条款>
```
🔴 **不点名号码 = 9 张脸糊成平均脸**。建议再出不同角度各一张 → 凑够 3 张脸参考图。

**`<真实感条款>`（①②都带，让脸像真实照片不像 AI）：**
```
candid photo shot on a real camera (50mm, f/2.8), natural realistic skin texture with
visible pores, fine lines and subtle imperfections, natural facial asymmetry, true-to-life
lighting, slight film grain, documentary realism, NOT AI-generated, no CGI, no 3D render,
no plastic or over-smoothed skin, no waxy look, no airbrushing, no perfect symmetry.
```
🔴 拿到锁定参考图 = 整支视频的脸，回 04 生成。

## 🔴 前置：Notion 要有脚本
数字人光有脸不够 —— 出会讲话的口播视频**必须先有完整脚本**（台词+分镜）。没脚本 → 先回 `suma-ai-02-copy` 写，别急着生成。

## Prompt 骨架 + 踩坑
```
generate_image: 一张 9:16 人物参考图，[受众 persona 具体特征] + [场景]
→ generate_video seedance_2_0, 9:16, generate_audio,
   medias=[{role:image_references, value:参考图 job_id}], prompt=[同套人物特征]+[动作]+Saying:「台词」
```
一张参考图当每镜 `image_references` → 8 段同一个人、对上口型（"一个人讲 8 段"一致性的解法）。
- 🔴 **照片级真人**：`PHOTOREAL, REALISTIC HUMAN presenter, a real-looking [本地] person, NOT a cartoon, NOT a 3D avatar`（漏了出卡通/塑料脸）。
- **人物一律本地** + 贴行业气质（例：美妆老板娘=年轻好皮肤淡妆、不要 aunty）；参考图具体到特征（脸型/眼镜/衣着/痣），换镜不换人。
- 屏幕里的主播也**不要乱码字**。

---

> 📄 **本文件夹的其他 md = 这一步的完整规则/框架**，务必先读。改内容请改 SUMA 主 repo 的 `7大AI启动包`，再重生成。


---

# 📚 完整参考资料（已全部收进本 skill —— 下面就是各 md 全文，不用再翻别的文件）


---

## 📄 README.md

# Skill · AI 数字人（工具：Higgsfield / Seedance）

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

