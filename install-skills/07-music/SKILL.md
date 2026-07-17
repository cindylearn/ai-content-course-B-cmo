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
> 1. **connector 连好没？** 🔴 **Notion + Google Drive + GitHub 必连**（Notion 建大脑、Drive 存成品、GitHub 装 skill）；出图/视频还要 Higgsfield、剪片要 ChatCut。缺 → 让她去 Claude 设置 → Connectors 连，或回 `suma-ai-00-setup`。🔴 **还要她的 Google Drive folder 链接**（成品同步存这），没有先要。
> 2. **地基做了吗？** 有没有「业务 md」+ 品牌地基（品牌名/受众/红线/命名）？没有 → **先去 `suma-ai-00-setup`**，别在这开工。
> 3. **Notion 骨架搭了吗？** dashboard + folder（品牌地基/内容矩阵/素材库/成品归档）+ 内容矩阵 database 建好没？没有 → 先回 00 搭。
> 缺任何一条 → 停下，先补，别硬往下做。

---

> 🔴🔴 **动手前必做（第 0 件事）：先用 `Read` 把本文件夹里的每一个 `.md` 文件读一遍**（框架 / NLP / SOP / 模版 —— 完整规则在那里），读进来再开工。**别只看这份 SKILL.md 就动手 = 出烂成品。**

## 第一刀：先分两条路（分错整首白做）
- **① 垫底 BGM（无人声）** —— 垫口播/广告底下，目标「消失」不抢戏。**先做这个**，视频线天天用。
- **② 品牌歌 / jingle（有歌词有唱）** —— 能记住的主题曲，目标「被记住」。见文末。
🔴 BGM 混人声会跟口播打架；品牌歌没歌词就不是歌。定方向再往下。

## ① BGM 一句话原则：抢戏就是失败
视频已有一个主角（讲话的人）。选 BGM 的唯一标准不是「好不好听」，是「**有没有让讲话更好听**」。

## Suno 的 Discover 是 prompt 图书馆，不是选歌的
🔴 每首公开歌点 **「+ Show full styles」看到作者完整 prompt 原文** —— 逛 Discover 只偷**写法**，不抄歌（音轨是别人的）。🔴 **标签骗人、完整 prompt 不骗人**（列表只显示 `cinematic pop`，点开才看到 `stadium drums / soaring choral / bold vocals`）。🔴 **别拿 Discover 的歌直接当 BGM**（那池全有人声、会打架）；让用户贴「Show full styles」原文给你。

## 「我要这首」→ 能用的 BGM：留 / 扔 / 加（翻译不是照抄）
- **留**：cinematic / orchestral（弦乐铜管）/ 力量感 / 现代感 —— 他真正要的「感觉」。
- **扔**：人声 / 合唱 / 一开场就炸 / 体育场鼓 / euphoric —— 全抢戏，写死砍掉。
- **加**：无人声 / 给人声让路 / BPM / 时长 —— 原歌没有，BGM 必补。
把「爆」换「稳」（`held back` / `restrained not euphoric`），人声合唱写死砍掉，再加给人声让路。

## 🔴 BGM prompt 五个成分（少一个就靠运气）
1. **用途 + 格式**（例 `short-form vertical ad`）—— 漏了它给你写一首完整的歌。
2. **具体乐器**（例 `muted electronic pulse, plucked synth arpeggio, subtle four-on-the-floor kick, light hi-hats`）—— 写「lo-fi/chill」含糊词每次都不一样。
3. **调性（含否定）**（例 `professional and confident, not hype or cheesy`）—— 🔴 说不要什么跟说要什么一样重要。
4. **给人声让路**（例 `no vocals` + `no melody that competes with speech` + `low-mid frequencies scooped for voice clarity`）—— 🔴 **最容易漏、最要命。** 是**频率打架**不是音量，生成时就挖掉人声频段，比事后压音量有效得多。
5. **BPM + 时长**（例 `steady 100 BPM, builds gently, 85 seconds`）。

## suno.com 操作步骤（免费可做）
① 注册登录 suno.com。② 进 Create → 左上把 **`Simple` 切 `Advanced`**（才分出 Lyrics/Styles 两栏）。③ Styles 栏贴风格（BGM 用五成分）；Lyrics 栏 BGM 留空。④ 🔴 **模型选 `v4.5-all`（"Best free model"）**——v5.5/v5/v4.5+/v4 全是 Pro，选了弹付费墙。⑤ Instrumental：BGM 开、品牌歌 关。⑥ 点 Create → 🔴 **会弹 Google 人机验证，必须用户真人点**（机器过不去，所以"全自动出歌"不存在）。⑦ 出 2 首完整版。⑧ 🔴 **试听挑一首——只有用户能做，AI 没耳朵**；不对让他说哪里不对（太吵/开头炸/咬字糊/抢戏）→ 改 prompt → 重生。🔴 **核心分工：你写 prompt，用户当耳朵。**

## 🔴 垫进视频：用「自动闪避」别手动压音量
下载后别用 ffmpeg 硬压，进剪辑软件靠轨道角色自动让路：人声轨=anchor、BGM 轨=follower（讲话时音乐自动缩、不讲回来）。三个坑：① 🔴 **别压两次**（开了闪避就别再手动压，音乐直接没了）② 声音不对**先查 muted 再查音量** ③ 🔴 **人声常在视频轨内嵌音频**，闪避角色要挂真正有人声那轨。（例：SUMA 84 秒竖版广告，BGM `-1.4dB` + follower `-19dB`。）

## ② 品牌歌 / jingle（规则跟 BGM 全相反）
- **要人声**（Instrumental 关），副歌洗脑能哼。**歌词=文案**：套品牌核心信息，找一句 5 字内钩子反复砸。
- **Discover 这时才真有参考价值**（那池就是歌）。
- 🔴 Suno 唱中文易咬字糊 —— 全中文 style 写死 `crystal-clear diction, every word intelligible`；糊了改中英混（副歌走英文）重生。
- 🔴 **别自吹**：品牌自唱「我多好」= 自夸，改唱「我们看见你的难」（客户是英雄）。🔴 **别拿品牌歌当 BGM 垫口播**；短 jingle（5–15 秒）只用片头/片尾 logo 露出。

## 🔴 收尾必存 Notion 音乐库（别跳）
Suno 一次给好几首，不归档 = 下次找不到、又重生花额度。**Notion 建一张表，每首一行**：**标题**（歌名+版本时长，如「…（v4.5·完整·1:54）」）· **类型**（垫底BGM/品牌歌jingle）· **链接**（Suno song URL/下载文件）· **用途**（广告片/片头尾/某产品线）· **参考曲**（抄了哪首写法）· **状态**（草稿/可用/待改）· **备注**。🔴 **每首标清能不能用**：免费 `v4.5-all` 完整版听 OK → 「可用」；v5.5 预览（1 分钟片段、要 Pro）→ 「待改」别误当成品发。用户没这表就帮他建。

## 版权
🔴 **Suno 生成的=你自己的**，可商用（免费方案条款自己确认一次）；🔴 **Discover 上别人的歌=别人的**，抄写法可以、拿音轨不行。

---

> 📄 **本文件夹的其他 md = 这一步的完整规则/框架**，务必先读。改内容请改 SUMA 主 repo 的 `7大AI启动包`，再重生成。
