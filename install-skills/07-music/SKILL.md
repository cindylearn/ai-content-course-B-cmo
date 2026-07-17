---
name: suma-ai-07-music
description: >-
  SUMA AI 内容系统 · 第 07 步。用 Suno + Claude 做垫底 BGM 或品牌歌，存进 Notion 音乐库。
  触发词：配乐 / BGM / 背景乐 / 品牌歌 / 做首歌 / Suno。
  跟用户说话中英双语；教练式一题一题问。
metadata:
  type: reference
  scope: SUMA AI内容课 · 独立 skill · part 07
---

# suma-ai-07-music —— 用 Suno + Claude 做垫底 BGM 或品牌歌，存进 Notion 音乐库。

## 🔑 怎么触发这个 skill（两种方式，任选一个）

| 方式 | 打什么 |
|---|---|
| ① 斜杠（最稳·直接点名）| `/suma-ai-07-music` |
| ② First Prompt（说一句话）| 「帮我做配乐／BGM」 |

> 两种效果一样：斜杠直接点名；First Prompt 打一句话，Claude 认关键词自己进。打不中就用斜杠。触发后一题一题问你。

> 🔴 **交互铁律：** 问用户任何选择题 → 一题一题、一题一张可点选项卡（`AskUserQuestion`，每题≤4 个+「其他」）、**绝不一次全倒**。只有开放题才打字。
> 🔴 **底层三层：** 出的每样东西都套 ① 说服（大师：**Blair Warren 为处境正名**/自我说服/LF8/AIDA·PAS/Cialdini/Duarte）· ② 语言（NLP）· ③ 动机（6 大人性需求）。说得出「用了哪个大师+哪个NLP+戳哪个需求」，说不出＝重来。

> 🔴 **强制记录：** 全程把决定/产出记进用户的「业务 md」（`业务-<品牌名>.md`）——品牌地基、每条内容的角度/大师/需求、Notion 结构、产出链接。没有这个文件 → 先建。

> 🔴🔴 **前置闸门（先查再做，缺了就挡）：**
> 1. **地基做了吗？** 有没有「业务 md」+ 品牌地基（品牌名/受众/红线/命名）？没有 → **先去 `suma-ai-00-setup`**，别在这开工。
> 2. **Notion 骨架搭了吗？** dashboard + folder（品牌地基/内容矩阵/素材库/成品归档）+ 内容矩阵 database 建好没？没有 → 先回 00 搭。
> 缺任何一条 → 停下，先补，别硬往下做。

---

照 `MUSIC-SKILL`（Suno 操作流程）。收尾**必存 Notion 音乐库**（标能不能用 / 版权）。
🔴🔴 **BGM prompt 五个成分（少一个就靠运气 —— 完整见 README）：**
1. **用途 + 格式**（`short-form vertical ad`，否则给你写整首歌）
2. **具体乐器**（`muted electronic pulse` `plucked synth arpeggio`…，别写 lo-fi/chill 含糊词）
3. **调性含否定**（`professional, not hype or cheesy` —— 说不要什么一样重要）
4. 🔴 **给人声让路**（`no vocals` + `no melody competing with speech` + **`low-mid frequencies scooped for voice clarity`**）—— 最容易漏最要命，是**频率打架**不是音量，生成时就挖掉人声频段
5. **BPM + 时长**（`100 BPM, 85 seconds`）

---

> 📄 **本文件夹的其他 md = 这一步的完整规则/框架**，做之前先读。改内容请改 SUMA 主 repo 的 `7大AI启动包`，再重生成。
