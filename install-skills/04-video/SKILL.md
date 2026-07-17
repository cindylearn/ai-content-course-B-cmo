---
name: suma-ai-04-video
description: >-
  SUMA AI 内容系统 · 第 04 步。把脚本做成完整口播短视频（生成 + ChatCut 剪辑）。
  触发词：口播视频 / 做视频 / 短视频 / video / 分镜。
  跟用户说话中英双语；教练式一题一题问。
metadata:
  type: reference
  scope: SUMA AI内容课 · 独立 skill · part 04
---

# suma-ai-04-video —— 把脚本做成完整口播短视频（生成 + ChatCut 剪辑）。

## 🔑 怎么触发这个 skill（两种方式，任选一个）

| 方式 | 打什么 |
|---|---|
| ① 斜杠（最稳·直接点名）| `/suma-ai-04-video` |
| ② First Prompt（说一句话）| 「帮我做口播短视频」 |

> 两种效果一样：斜杠直接点名；First Prompt 打一句话，Claude 认关键词自己进。打不中就用斜杠。触发后一题一题问你。

> 🔴 **交互铁律：** 问用户任何选择题 → 一题一题、一题一张可点选项卡（`AskUserQuestion`，每题≤4 个+「其他」）、**绝不一次全倒**。只有开放题才打字。
> 🔴 **底层三层：** 出的每样东西都套 ① 说服（大师：**Blair Warren 为处境正名**/自我说服/LF8/AIDA·PAS/Cialdini/Duarte）· ② 语言（NLP）· ③ 动机（6 大人性需求）。说得出「用了哪个大师+哪个NLP+戳哪个需求」，说不出＝重来。

> 🔴 **强制记录：** 全程把决定/产出记进用户的「业务 md」（`业务-<品牌名>.md`）——品牌地基、每条内容的角度/大师/需求、Notion 结构、产出链接。没有这个文件 → 先建。

> 🔴🔴 **前置闸门（先查再做，缺了就挡）：**
> 1. **connector 连好没？** 🔴 **Notion + Google Drive 必连**（少了 Claude 建不了大脑、存不了成品）；出图/视频还要 Higgsfield、剪片要 ChatCut。缺 → 让她去 Claude 设置 → Connectors 连，或回 `suma-ai-00-setup`。🔴 **还要她的 Google Drive folder 链接**（成品同步存这），没有先要。
> 2. **地基做了吗？** 有没有「业务 md」+ 品牌地基（品牌名/受众/红线/命名）？没有 → **先去 `suma-ai-00-setup`**，别在这开工。
> 3. **Notion 骨架搭了吗？** dashboard + folder（品牌地基/内容矩阵/素材库/成品归档）+ 内容矩阵 database 建好没？没有 → 先回 00 搭。
> 缺任何一条 → 停下，先补，别硬往下做。

---

🔴🔴 **硬闸门：Notion 里没有完整脚本 → 做不了口播视频。** 先确认「内容矩阵里这条有没有完整分镜脚本+台词」；没有 → 先回 `suma-ai-02-copy` 写好脚本再来。

🔴 **04 = 直接把脚本拍成一支正常口播视频**：脚本 prompt = **画面+声音一起**生成（`generate_audio=true`），先 test 一支跑通。不选人、不造脸。
🔴 **开工只问两件（选项卡，别默认）：**
1. **角色要 AI 人 / 卡通人？** AI 人（default）= 跟真人一样的照片级真人数字人，04 直接照脚本 persona 出；卡通人 = 选一个卡通风格分类。
2. **说话语言 —— 别默认英文**：🇲🇾 马来西亚华语／中文（默认）· 中英混 Rojak · English · Bahasa Malaysia ·（方言走「其他」）。选的语言 = 台词语言 + 选声语言，全片统一。
🔴 **主讲人只 mention：** 想全片同一个人 / 真人本尊 / 锁定特定 AI 脸 → 才去 `suma-ai-05-avatar`（自己样子的数字人 或 九宫格锁一个）。先 test 不用 05。
🔴 **声音分开只有一处** = 05 的「自己样子的数字人」（克隆真人声）；04 的 AI 人、05 的九宫格数字人 = 画面+声音一起。

🔴🔴 **每一镜 prompt 的硬规则（写死，漏了必出问题 —— 完整见 README「硬规则」段）：**
- **无字幕护栏（必带）**：`ABSOLUTELY NO on-screen text, NO subtitles, NO captions, NO burned-in words…`（字幕后期加）。
- **AI 人 = 照片级真人**：`PHOTOREAL, REALISTIC HUMAN … NOT a cartoon, NOT a 3D avatar` + 会眨眼眼珠动（`BLINKS… EYES alive…`）+ **真实感条款**（`candid photo… visible pores… NOT AI-generated…`）。🔴 **这条只管 AI 人；选了「卡通人」→ 不套照片级真人，按选定的卡通风格出。**
- **B-roll = 无脸真实近景**（`generate_audio=false`）+ **快切** `FAST-PACED… HARD CUTS every ~1.2–1.5s`。
- **prompt 绝不写 hex 色号 / 文字标签**（会烤成乱码）→ 写方向词 + `NO letters, NO numbers, NO words`。
- **背景虚化无可读文字** `background softly out of focus, NO readable text`。
- **参数：一律 480p + `mode fast`**；先验 1 镜（声音+无字幕+眨眼+脸）OK 再批量。

流程照 `VIDEO-PROMPT-SKILL`（出片）→ `CHATCUT-SKILL`（剪片），完整硬规则以 `README.md`「硬规则」段为准。

---

> 📄 **本文件夹的其他 md = 这一步的完整规则/框架**，做之前先读。改内容请改 SUMA 主 repo 的 `7大AI启动包`，再重生成。
