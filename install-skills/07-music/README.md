# Skill · AI 音乐（工具：Suno + Claude）

## 🔑 怎么触发这个 skill（两种方式，任选一个）

| 方式 | 打什么 |
|---|---|
| ① 斜杠（最稳·直接点名）| `/suma-ai-07-music` |
| ② First Prompt（说一句话）| 「帮我做配乐／BGM」 |

> 两种效果一样：斜杠直接点名；First Prompt 打一句话，Claude 认关键词自己进。打不中就用斜杠。触发后一题一题问你。


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
