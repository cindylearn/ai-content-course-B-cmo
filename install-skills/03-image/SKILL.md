---
name: suma-ai-03-image
description: >-
  SUMA AI 内容系统 · 第 03 步。出场景化海报/成品图 + 合 logo。
  触发词：出图 / 海报 / 产品图 / 做图。
  跟用户说话中英双语；教练式一题一题问。
metadata:
  type: reference
  scope: SUMA AI内容课 · 独立 skill · part 03
---

# suma-ai-03-image —— 出场景化海报/成品图 + 合 logo。

## 🔑 怎么触发这个 skill（两种方式，任选一个）

| 方式 | 打什么 |
|---|---|
| ① 斜杠（最稳·直接点名）| `/suma-ai-03-image` |
| ② First Prompt（说一句话）| 「帮我出海报／产品图」 |

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

先用选项卡让用户**选海报风格**（5 种：A战报证明 / B悬浮UI / C导师权威 / D游戏化慎用 / E扁平色块保底 —— 🔴 同批别全用同一种）。场景/文字要戳人性需求。
🔴🔴 **出图 prompt 硬规则（写死，漏了必出问题 —— 完整见 README「通用海报硬规则」+「踩坑」）：**
- 比例统一 **3:4 竖版**，`photoreal documentary real-camera, NOT AI, 本地感`；人物**一律本地人** + 贴行业气质（美妆老板娘=年轻好皮肤，不要 aunty）。
- 🔴 **色号绝不贴着文字写**（`#28C2E7 '字'` 会把色号印进图）→ 颜色用**词**描述，hex 只结尾单列 + 注「绝不渲染成文字」；**别写字体规格**（`60px` 会印进图）。
- 🔴 **只渲染引号里的中文**；屏幕内容 `abstract blurred colour blocks, NO legible text` + 加死 `NO garbled text`（防乱码假 UI）。
- 🔴 **logo 别让 AI 画**（会出假 logo）→ 右上/顶部留空 + `do NOT render the word 'LOGO'`，真 logo 后期 PIL 合成。
- 🔴 **人物用真人脸参考锁定**（`face MUST match the reference exactly`），别生陌生脸。
- 🔴 **ToFu 不放价格、不 overpromise**（价格=BoFu 专属）；ToFu 用温和时间型大字（如「1 天」）。
- 🔴 **对比图写** `full-bleed, NOT 印刷海报立街边/白框`（否则画「海报中的海报」）。
- 🔴 **生成后一定 Read 图人工审**：色号泄漏 / 乱码 / 外国脸 / 撞 logo。

---

> 📄 **本文件夹的其他 md = 这一步的完整规则/框架**，做之前先读。改内容请改 SUMA 主 repo 的 `7大AI启动包`，再重生成。
