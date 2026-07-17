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


---

# 📚 完整参考资料（已全部收进本 skill —— 下面就是各 md 全文，不用再翻别的文件）


---

## 📄 README.md

# Skill · AI 音乐（工具：Suno + Claude）

> 🔴 **交互铁律（跟 SKILL.md 一致，这一包的任何一步都守）：问用户任何选择题 —— 一题一题问、一题一张可点选项卡（`AskUserQuestion`，每题最多 3–4 个选项，系统自动加「其他」）、**绝不一次全倒**。只有开放题（品牌名 / 具体挑刺 / 参考链接）才让他打字。**

> 🔴 **底层三层（跟 SKILL.md 一致，这一包出的每样东西都要套）：① 说服（大师：**Blair Warren 为客户处境正名**/自我说服/LF8/AIDA·PAS/Cialdini/Duarte 客户是英雄）· ② 语言（NLP：换框/未来预演/连续肯定/锚定）· ③ 动机（6 大人性需求：确定/新鲜/重要/爱与连接/成长/贡献）。做完要能说出「这套了哪个大师 + 哪个 NLP + 戳哪个人性需求」——说不出 = 只做了表面，重来。**



**在系统里的工位：** 给视频配背景乐 —— 让整条内容**瞬间脱离「业余感」**。成品视频的最后一层打磨。

> 📄 **配套：`MUSIC-SKILL.md`（本包同目录）** = 教练式交互流程（带用户一步步做）。这份 README = 规则。改规则改这里，两边不分叉。

> 🔴 **先分两条路，做法完全相反：**
> - **① 垫底 BGM（无人声）** —— 垫在口播/广告片底下，**不抢戏**。你视频线天天要用的。**先做这个。**
> - **② 品牌歌 / jingle（有歌词）** —— 有唱的主题曲。见文末 §②。
>
> **共同点只有「都用 Suno」。其余全部相反**：BGM 要「消失」，品牌歌要「被记住」。

---

# ① 垫底 BGM

## 🔴 一句话原则：BGM 是配角，抢戏就是失败

你的视频已经有一个主角（讲话的人）。**再放一个主角进去，两个人打架，观众谁都听不清。**

选 BGM 的唯一标准不是「好不好听」，是「**它有没有让讲话更好听**」。

---

## 🔴 Suno 的 Discover 是 prompt 图书馆，不是拿来选歌的（2026-07 实测）

这是这个 skill 最值钱的一条。

**每首公开歌都能点「+ Show full styles」，看到作者写的完整 prompt 原文。**
不是抄歌（那是别人的作品，音轨不能拿），是**抄写法**。

**实测例**：`Everything, Still` 这首，列表上只显示 `cinematic pop, indie dance, electro-pop` 三个标签。点开完整 styles 是：

> A massive, high-energy cinematic indie-dance anthem that **explodes from the first second — no buildup**… **stadium-sized drums**… thundering toms, driving bass, crisp claps, disco hi-hats, **punchy brass stabs**… **soaring choral harmonies**… euphoric, defiant, wildly alive… **Vocals are bold, soulful, and commanding**… orchestral grandeur…

**看懂这一段，你才知道「cinematic pop」这个标签底下到底藏了什么。标签骗人，完整 prompt 不骗人。**

> 🔴 **别拿 Discover 的歌当 BGM。** 那一池全是**歌**（Rap / Dream Pop / Indie）—— 有人声、有合唱、动态爆炸。垫在口播底下就是两个人一起唱。
> 逛 Discover 只为一件事：**找到「我要这个感觉」，然后偷它的写法。**

---

## 🔴 「我要这首」→ 能用的 BGM：留 / 扔 / 加（实测走过一遍）

拿上面那首当例子。你说「我要这首的感觉」，Claude 要做的是**翻译，不是照抄**：

| | |
|---|---|
| **留** | cinematic · orchestral grandeur（horns/strings）· 力量感 · 现代感 ← 这才是你真正要的「感觉」 |
| **扔** | 人声 · 合唱 · 一开场就炸 · 体育场鼓 · euphoric ← 这些全部会抢戏 |
| **加** | 无人声 · 给人声让路 · BPM · 时长 ← 原歌不需要，BGM 必须有 |

翻译结果：

```
Cinematic corporate underscore for a short-form vertical ad, modern and confident.
Orchestral grandeur held back: warm sustained strings, soft horn swells low in the mix,
subtle driving pulse, light claps far back. Determined and uplifting — cinematic weight
WITHOUT the explosion, restrained not euphoric, no festival energy.
Sits under a Mandarin voiceover — NO vocals, NO choir, no melody that competes with
speech, low-mid frequencies scooped for voice clarity, dynamics compressed so nothing
spikes over the voice. Steady 100 BPM, builds gently across 85 seconds.
```

**只改三处**：把「爆」换成「稳」（`held back` / `WITHOUT the explosion` / `restrained not euphoric`）· 把人声合唱**写死砍掉** · 加上给人声让路的两条。

---

## 🔴 BGM prompt 的五个成分（少一个就靠运气）

下面这句是**实测出片用过的**（84 秒竖版口播广告，成品已发）：

```
Modern minimal corporate tech background music for a short-form vertical ad.
Clean muted electronic pulse, soft plucked synth arpeggio, subtle four-on-the-floor
kick, light hi-hats. Professional and confident, not hype or cheesy.
Sits under a Mandarin voiceover — no vocals, no melody that competes with speech,
low-mid frequencies scooped for voice clarity.
Steady 100 BPM, builds gently, 85 seconds.
```

| 成分 | 长什么样 | 漏了会怎样 |
|---|---|---|
| **1. 用途 + 格式** | `short-form vertical ad` | 它给你写一首完整的歌 |
| **2. 具体乐器** | `muted electronic pulse` `plucked synth arpeggio` `subtle four-on-the-floor kick` `light hi-hats` | 写「lo-fi」「chill」这种含糊词 → 每次生出来都不一样 |
| **3. 调性（含否定）** | `professional and confident, **not hype or cheesy**` | 🔴 **说不要什么，跟说要什么一样重要** |
| **4. 给人声让路** | `no vocals` · `no melody that competes with speech` · **`low-mid frequencies scooped for voice clarity`** | 🔴 **最容易漏、最要命** |
| **5. BPM + 时长** | `100 BPM, builds gently, **85 seconds**` | 长度对不上，要么不够要么得硬剪 |

> 🔴 **第 4 条是这份文件的核心。**
> 大部分人以为「BGM 盖过人声」是**音量**问题 —— 其实是**频率打架**。人声主要在中低频，音乐也在那里，两个挤同一条频段。
> **在生成时就把人声频段挖掉**（`low-mid scooped`），比事后压音量有效得多 —— 事后压只会让音乐变小声，**不会让人声变清楚**。

---

## 操作步骤（suno.com · 2026-07 实测界面）

1. 注册登录 **suno.com**（有免费额度）。
2. 进 **Create** 页 → 左上角把 **`Simple` 切成 `Advanced`** → 出现**两栏**：
   - **上面 Lyrics（歌词）** · **下面 Styles（风格）**
   - Simple 模式只有一个大框，分不开风格和歌词 → **一定切 Advanced**。
3. **Styles 栏**贴风格（BGM 用五成分那套 / 品牌歌抄参考曲写法）；**Lyrics 栏**贴歌词（品牌歌才有；BGM 留空）。
4. 🔴 **选模型：免费只能用 `v4.5-all`（标着 "Best free model"）。** 右上角模型下拉里，v5.5 / v5 / v4.5 / v4.5+ / v4 **全部是 Pro**，选了会**弹 $8/月付费墙、生成不了**。免费就认准 `v4.5-all`。
5. **Instrumental 开关**：垫底 BGM → **开**；品牌歌 → **关**。
6. 点 **`Create`** → 🔴 **会弹 Google 人机验证（选图题）** → **你自己点**（见下），机器过不去。
7. 验证过 → 生成（免费 v4.5-all 出 **2 首完整版**；另有 2 首 v5.5 Preview 只是片段、要 Pro，忽略）。
8. **试听 → 挑一首**。🔴 **这步只有你能做 —— AI 没有耳朵。**
9. 不对 → **告诉 Claude 哪里不对**（「太吵」「开头就炸」「咬字糊」「中间抢戏」）→ 它改 prompt → 回第 3 步重生。
10. 满意 → 下载。

> 🔴 **核心分工：Claude 写 prompt，你当耳朵。** 你不用会写 prompt，只要会说「哪里不对」。

### 🔴 生成时的人机验证 —— 这是硬现实，不是 bug

**Suno 在「点 Create 生成」那一刻会弹 Google 选图验证**（实测："Pick all things that fold like the example"，选会折叠的东西）。

- **这道题机器过不去** —— 任何自动化工具都得真人点。
- **所以「全自动出歌」不存在** —— prompt 可以让 AI 写，但**生成这一下必须你亲手点**。
- 这不是麻烦，是 Suno 故意防机器人。**你自己操作这一步，本来就绕不开。**

---

## 🔴 垫进视频：用「自动闪避」，别手动压音量（实测）

下载完**不要用 ffmpeg 硬压音量**。进剪辑软件，靠轨道角色让它自动让路：

```
人声轨  → role: anchor      ← 讲话那一轨
BGM 轨  → role: follower    ← 音乐这一轨
          duck depth: -19 dB   ← 实测值
BGM 音量 → -1.4 dB             ← 实测值
```

**原理**：讲话时音乐自动缩下去，不讲时自动回来。
手动压是**从头到尾一个音量** —— 讲话时还是吵，不讲话时又太小声。**两头不讨好。**

### 三个踩过的坑

1. 🔴 **别压两次。** 手动压到 0.16 **又**开自动闪避 = 压了两次，音乐直接没了。**开了闪避就别再手动压。**
2. 🔴 **声音不对，先查开关，再查音量。** 曾经调了三轮音量都没反应 —— 那条轨道是 **muted**。先看静音开关，再看音量。
3. 🔴 **人声可能不在音频轨上。** 口播视频的人声常常是**视频轨的内嵌音频**（例如 V1），不是 A1。角色要挂在**真正有人声的那一轨**上 —— 挂错了闪避根本不触发。

> ⚠️ **上传音档的坑**：走预签名上传时，**档案大小要按字节精确报，不能估** —— 估错一个字节就 403（预签名 URL 把 content-length 也签进去了）。另外某些服务的 multipart 上传在 128KB 边界会被挡。

---

## 版权

- **Suno 生成的 = 你自己的**，可商用发社媒（免费方案的授权条款自己确认一次）。
- 🔴 **Discover 上别人的歌 = 别人的作品。抄写法可以，拿音轨不行。**

---

# ② 品牌歌 / jingle（有歌词）

规则跟 BGM **全部相反** —— BGM 要「消失」，品牌歌要「被记住」。

- **要人声**（不开 Instrumental），副歌要洗脑、要能跟着哼。
- **歌词 = 文案**：套你的品牌核心信息，别写空泛形容词。**Claude 写歌词，你听。**
- **Discover 这时才真的有参考价值** —— 那一池就是歌，正好对上。
- 🔴 **别拿品牌歌当 BGM 垫口播。** 它是主角，你也是主角，会打架。
- **短 jingle**（5–15 秒）用在片头 / 片尾 logo 露出，**别铺满全片**。

> ⏳ **这一段还没实测。** BGM 那半是做出来过的；这半是推论。做过之后回来补数值 —— **别把推论当结论用。**

---

## 接进系统

- BGM 在**拼接完整版之后**垫进去（跟中文字幕一样，都属于后期）。
- 视频脚本里讲「AI 音乐」这个工具时，B-roll 可以 show 波形 / 生成界面（清晰，别虚化别乱码）。

---

## 🔴 建一个「音乐库」把歌存起来（别让它散在 Suno 里）

生成完不归档 = 下次要用又找不到、又重生一次、又花额度。**在 Notion 建一张表，每首歌一行**，这样整个系统（大脑在 Notion）随时调得到。

> 🔴 **Suno 生成一次给 2 版，还可能有预览版** —— 一次就是好几首。不记下来，过两天你自己都分不清哪首是能用的完整版、哪首只是片段。

### 表结构（照这个建，全行业通用）

| 列 | 类型 | 填什么 |
|---|---|---|
| **标题** | 标题 | 歌名（Suno 自动命名的 + 版本，如「…（v4.5·完整·1:54）」）|
| **类型** | 单选 | 垫底BGM / 品牌歌·jingle |
| **链接** | 链接 | Suno 的 `song/…` 链接，或下载好的文件 |
| **用途** | 多选 | 用在哪（广告片 / 片头片尾 / Open Day / 某个产品线…）|
| **参考曲** | 文本 | 抄了哪首的写法（Suno Discover 那首）|
| **状态** | 单选 | 草稿 / 可用 / 待改 |
| **备注** | 文本 | 钩子、免费版还是 Pro、哪版能用 |

### 🔴 每首都要标清楚「能不能用」

- **免费 v4.5-all 的完整版** → 能用 → 听过 OK 就标「可用」
- **v5.5 预览版**（只有 1 分钟片段）→ **不能用**（要 Pro 才给完整）→ 标「待改」，别误当成品发出去
- 一次生成的好几首，把**版本 + 时长**写进标题，一眼分得清

> **归档不是可有可无。** 音乐是最容易「生了一堆、用的时候找不到」的东西 —— 一首歌 2 版 × 每支视频都要配 = 很快几十首。有库就有序，没库就重复劳动 + 浪费额度。

---

> 📎 **SUMA 内部示例**（参考，不是通用规则）：Jared LP 广告片 84 秒，BGM 用上面那句五成分 prompt 生成，`-1.4dB` + follower 自动闪避 `-19`；调性 = 专业笃定、不 hype（学院品牌，不做夸张感）。换成你自己行业的调性即可。



---

## 📄 MUSIC-SKILL.md

---
name: ai-music-coach
description: >-
  引导式工作流：用 Suno + Claude 做 AI 音乐（垫底 BGM 或品牌歌）。触发词：「帮我做配乐 / BGM /
  背景乐 / 品牌歌 / 主题曲 / 做首歌 / Suno」。用教练式提问先问清楚（BGM 还是品牌歌 / 参考哪首 /
  语言 / 用途 / 情绪），再帮用户写 Suno 能用的 prompt，再一步步带他在 Suno 生成。
  跟用户说话中英双语；写进 Suno 的 prompt 用英文（风格）+ 目标语言（歌词）。
metadata:
  type: reference
  scope: AI内容课 · Session · 音乐生产线
---

# AI 音乐教练（Suno + Claude）

> 🔴 **底层三层（跟 SKILL.md 一致，本 skill 出的每样东西都套）：** ① 说服（大师：**Blair Warren 为处境正名**/自我说服/LF8/AIDA·PAS/Cialdini/Duarte）· ② 语言（NLP）· ③ 动机（6 大人性需求）。**说得出「用了哪个大师 + 哪个 NLP + 戳哪个需求」，说不出＝重来。**


把「我想要个配乐」变成一首能用的歌。**这是流程；硬规则以 `README.md`（本包同目录）为准。**

> 🔴 **规则不在这份文件里。** 五成分 prompt、留/扔/加、Suno 界面路径、免费模型 `v4.5-all`、生成时的人机验证、垫进视频的自动闪避数值 —— **全部看 README**。这份只管「怎么带着用户一步步走」。

---

## ⚡ 自动开始 —— 用教练式提问，别一次问完

用户说「帮我做配乐 / BGM / 品牌歌 / 做首歌」→ **立刻开始**，但**一步一步问**，别丢一堆问题。

> 🔴🔴 **一题一题问 · 一题一张可点选项卡 · 绝不一次全倒**（Claude Code 的 `AskUserQuestion` 交互组件）——问一题、等他答完、才问下一题。BGM 还是品牌歌、语言、用途、视角… 让用户**点选**，不要只列 `1. 2. 3.` 让他打字。下面每个 Q 里的编号选项都当成选项卡的选项。只有开放题（参考曲链接、品牌信息、具体感觉、挑刺）才让他打字。**每题选项卡最多 3–4 个**（硬限制，系统自动加「其他」）——选项多的题只列最相关的 3 个，其余靠「其他」。
> ⚠️ 可点击选项卡是 **Claude Code**（CLI / 桌面 App / IDE 插件）的功能；claude.ai 网页版没有，会退化成纯文字编号——那时就把编号列清楚让用户回数字。

> 🈯 **中英双语**：每个问题、每个选项都中英双语。

### 第一刀：先分岔（最重要）

> 你要哪种？两种做法完全相反 / Which one? These two are opposites:
> 1. **垫底 BGM（无人声）** / Background music — 垫在口播/广告片底下不抢戏
> 2. **品牌歌 / jingle（有歌词、有唱）** / Branded song — 会唱、能记住的主题曲

**分错了整首白做**（BGM 有人声会跟口播打架；品牌歌没歌词就不是歌）。定了再往下。

---

## 路线 ① 垫底 BGM

### Q1. 参考 / 情绪

> 有没有一首你喜欢的歌，或者你想要什么感觉？
> Got a song you like, or describe the vibe you want?

- **用户给了 Suno 链接** → 🔴 让他点开那首的 **「+ Show full styles」**，把作者的完整 styles 原文贴给你（见 README）。你要的是**写法**，不是那首歌本身。
- **用户只说感觉**（「上进」「温暖」「都市感」）→ 直接进 Q2。

### Q2. 垫在什么视频底下 · 多长

> 这段音乐垫在哪支视频下面？大概多长？
> Under what video? Roughly how long?

→ 拿到用途 + 时长，**照 README 五成分**写 Style prompt，🔴 **务必写死「给人声让路」那两条**（`no vocals` + `low-mid frequencies scooped for voice clarity`）。

### 然后：带他去 Suno（见 README 操作步骤）
> 切 Advanced → Styles 栏贴风格、Lyrics 留空 → 🔴 **Instrumental 开关打开** → 模型选 `v4.5-all` → Create → **你点人机验证** → 出 2 版 → 试听。

---

## 路线 ② 品牌歌 / jingle

### Q1. 参考曲

> 有没有一首歌，你希望品牌歌是那个感觉？
> A song whose vibe you want the branded song to have?

→ 用户给链接 → 点「+ Show full styles」拿完整写法。**留**曲风/力量感，**扔**掉不合品牌调性的（学院品牌别 euphoric、别太 hype）。

### Q2. 语言

> 歌词用什么语言？/ Lyrics in which language?
> 1. 中英混（主歌中文讲故事、副歌英文钩子）— Suno 唱英文更稳
> 2. 全中文 — 共鸣最直接，但咬字可能糊，也许要多生几次
> 3. 全英文

🔴 **提醒用户**：Suno 唱中文最容易咬字糊。全中文时 style 里写死 `crystal-clear diction, natural [language] tones, every word intelligible`，但**成不成只有他耳朵知道**。

### Q3. 用途 · 长度

> 拿来干嘛？/ What for?
> 1. 短 jingle（5–15 秒，片头/片尾 logo 露出）
> 2. 完整主题曲（2–3 分钟）
> 3. Open Day / 开场用（60–90 秒，要开场气势）

### Q4. 「我」是谁（视角）

> 歌里唱的「我」是谁？/ Who's the "I" in the song?
> 1. 你的客户 / 学员（他的转变故事）
> 2. 你的品牌（你们怎么帮他）
> 3. 第三人称旁白

🔴 **品牌视角 + 励志基调有个坑**：品牌自己唱「我碎过我再起」= 自吹。解法（对号入座你的框架）：**唱「我们看见你的难」，不唱「我们多好」** —— 客户是英雄，你是向导。

### 然后：写歌词 + Style，带他去 Suno
- **歌词 = 文案**：套品牌核心信息，找一句 **5 字以内的钩子反复砸**（副歌洗脑靠重复）。
- Style 抄参考曲写法 + 写死人声语言。
- 带他：切 Advanced → 🔴 **Lyrics 栏贴歌词、Styles 栏贴风格** → **Instrumental 关** → 模型 `v4.5-all` → Create → **他点验证** → 出 2 版 → 试听。

---

## 🔴 试听环节（两条路都一样）

> **AI 没有耳朵 —— 生成好了必须你听。**
> 你不用会评价音乐，只要说三种之一：
> - 「可以！」→ 下载，收工
> - 「咬字糊」→ 我改中英混（副歌走英文）重生
> - 「不对味 / 太吵 / 不够狠」→ 说哪里不对，我改 prompt 重生

**用户说「哪里不对」→ 你改 prompt → 回 Suno 重生。** 循环到他满意。这就是整套系统的核心：**你写 prompt，他当耳朵。**

---

## 🔴 收尾：存进音乐库（别跳这步）

用户挑好之后，**带他把歌记进 Notion 音乐库**（表结构见 README「建一个音乐库」）。

- 🔴 **一次生成好几首**（2 版完整 + 可能的预览版）→ 每首一行，**版本+时长写进标题**（「…（v4.5·完整·1:54）」），一眼分得清。
- 🔴 **标清楚能不能用**：免费完整版 = 可用；v5.5 预览（1 分钟片段）= 待改（要 Pro，别误发）。
- 链接贴 Suno 的 `song/…` URL；用途多选（广告片/片头/Open Day…）；参考曲写抄了哪首。
- **没库就会重复劳动**：一首歌 2 版 × 每支视频都配 = 很快几十首，找不到就又重生、又花额度。

如果用户还没有这张表 → 帮他在 Notion 建一个（照 README 表结构）。

---

## 交给下一段

品牌歌 → 直接发 / 当片头。
BGM → 拿去**后期垫进视频**：人声轨 anchor / BGM 轨 follower 自动闪避（数值见 README），🔴 **别用 ffmpeg 硬压音量**。

---

## 快速规则

- 拿到「做配乐」→ 直接开始，教练式一步步问，别一次问完
- 🔴 **第一刀先分 BGM / 品牌歌**（做法相反，分错白做）
- 参考曲 → 让用户点「Show full styles」拿写法，别拿别人音轨
- 中英双语；规则以 README 为准（免费模型 v4.5-all / 生成时人机验证要真人点）
- **你写 prompt，用户当耳朵** —— 他只说「哪里不对」
- BGM 五成分缺一不可，尤其「给人声让路」；品牌歌找 5 字钩子反复砸
- 品牌视角别自吹：唱「看见你的难」，不唱「我们多好」
- 🔴 **收尾必存音乐库**：每首一行、版本+时长进标题、标清能不能用（v5.5 预览不能用）

