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

> 🔴🔴 **两套通用底层（每个产出都要套，不管这一步做的是文案/图/视频/数字人/PPT/音乐）：**
> - ❤️ **6 大人性需求**（确定 / 新鲜 / 重要 / 爱与连接 / 成长 / 贡献）= 内容动机的根 —— 每条内容先想「戳的是哪个需求」。
> - 🧠 **NLP 说服技巧**（换框 / 未来预演 / 连续肯定 / 锚定 / 社会认同…）= 语言的说服力 —— 每条内容至少叠 1–2 个。
> 🔴 **两套的完整全文，就在本 skill 最下方「📚 完整参考资料」里**（`09-6大人性需求…` + `08-NLP营销技巧…`）—— 动手前先读，做完自检：**这条戳了哪个人性需求？用了哪个 NLP 技巧？** 说不出＝没套底层，重来。

> 🚦🔴🔴 **开工前先看 Status（每个 skill、每一步都守）：** 动任何一条内容前，先读它在 Notion「内容矩阵」里的 `Status` —— **Status 决定这一步该做什么**：Not Started→定角度立项 · Need Review Idea→审角度 · Proceed to Generate→写文案+去生成(生成前先确认) · Need Review Poster/Video→审成品+三落归档 · Checked→**全部做完只差发**(排期等发) · Need Modify→按反馈改 · Rejected→弃用 · Posted→已发看数据（详见本 skill 下方模版「🚦 Status 工作流」）。🔴 **绝不不看 Status 就闷头产**；做完这一步**改 Status** 推进。🔴 `Checked`＝万事俱备只差发布，不是角度审过。

> 🔴🔴 **前置闸门（先查再做，缺了就挡）：**
> 1. **connector 连好没？** 🔴 **Notion + Google Drive + GitHub 必连**（Notion 建大脑、Drive 存成品、GitHub 装 skill）；出图/视频还要 Higgsfield、剪片要 ChatCut。缺 → 让她去 Claude 设置 → Connectors 连，或回 `suma-ai-00-setup`。🔴 **还要她的 Google Drive folder 链接**（成品同步存这），没有先要。
> 2. **地基做了吗？** 有没有「业务 md」+ 品牌地基（品牌名/受众/红线/命名）？没有 → **先去 `suma-ai-00-setup`**，别在这开工。
> 3. **Notion 骨架搭了吗？** dashboard + folder（品牌地基/内容矩阵/素材库/成品归档）+ 内容矩阵 database 建好没？没有 → 先回 00 搭。
> 缺任何一条 → 停下，先补，别硬往下做。
> 🔴🔴 **成品归档（做完必做，禁找任何借口）：** 每个成品（图/视频/音乐/PPT）做完，**三处都要落，一处都不能跳**：① 本地成品 folder；② 🔴 **贴进 Notion**（对应立项页的「成品」块 + 改 Status）；③ 🔴 **`rclone copy` 传进用户 Google Drive 成品 folder**。🔴 **②③ 只要有一处没做，就是没做完 —— 绝不说「传不了 / 太大 / 浪费算力 / 你自己上传 / 你自己拖」这类借口。**
>
> **② 贴进 Notion（学生用 Notion connector，真能跑的路径 —— 别再卡在这找借口）：**
> `notion-create-attachment` 的 `content` 只收文本（≤200KiB），**本地二进制成品（图/视频/音乐）必须走 `source_url`（公开 HTTPS）**。本地文件没有公开 URL → 这样拿：
> 1. 用 Higgsfield `media_upload`（filename=成品文件）拿 presigned `upload_url` → PUT 上传字节 → `media_confirm`；再用 `show_medias` / `media_import_url` 取回该成品的**公开 HTTPS URL**。
> 2. 把这条公开 URL 喂 `notion-create-attachment` 的 `source_url` → 拿回 `markdown_source`。
> 3. 用 `notion-update-page`（insert_content）把 `markdown_source` 放进立项页的「成品」块。🔴 **1 小时内贴完**（临时上传会过期）。
> 🔴 免费 Notion `source_url` ≤5MiB（付费 workspace 50MiB）：成品超了先压到限额内再传，**不是不传**。
>
> **③ 传进 Drive：** Drive connector 传大图不行（base64 太大），但 **rclone 直传就行、多大都可以**（00 已帮学员配好 `gdrive` remote）。命令：`rclone copy "<本地成品>" gdrive: --drive-root-folder-id <Drive成品folder的ID>`（folder ID = Drive 链接 `/folders/` 后那段）。rclone 没配 → 先带学员配一次（见 `suma-ai-00-setup`），别跳过、别甩给用户手动。

> 🔴🔴 **强制：先看 Status → 照模版立项（单独跑这个 skill 也一样，绝不跳过）：** 动手写 / 生成**之前**：
> ① 🚦 **先读这条内容的 `Status`，Status 决定这一步做什么** —— Not Started→定角度 · Need Review Idea→审角度 · Proceed to Generate→写文案+去生成 · Need Review Poster/Video→审成品+归档 · Checked→做完只差发 · Need Modify→改 · Rejected→弃 · Posted→已发看数据（详见下方模版「🚦 Status 工作流」）。**别不看 Status 就闷头做。**
> ② 在 Notion「内容矩阵」database **New / 打开这条立项页**，正文**照 `05-Notion内容矩阵页模版` 填**（按媒体类型选对应结构：概念 / 文案 / 图内文字层级 / prompt 表 / 台词…）。
> ③ 产出完**回填**（文案进「文案」列、成品图贴「成品」块）＋ **改 Status**（推进到下一状态）。
> 🔴 **绝不**：不看 Status 闷头做、不建页就直接产出、建空白页、内容散在对话里。**每一条内容 ＝ 内容矩阵一行 ＋ 照模版填好的立项页**。🔴 没有「内容矩阵」database？先回 `suma-ai-00-setup` 建。模版全文见下方「底层必读」。

> 🔴🔴 **生成前必停确认（绝不自动烧 credit）：** 调用 `generate_image` / `generate_video` / 生成音乐 **之前**，先把**最终 prompt ＋ 数量 / 规格（如 3:4、时长）＋ 预计 credit** 摆给用户看，明确问一句「**要我 proceed 生成吗？**」。🔴 **等用户说「生成 / proceed / go」才真正调生成 API**；用户要改就改完再确认。**绝不**没问就自动生图 / 生视频 / 生成音乐 —— 那是在替用户烧钱。

# 🔴🔴 底层必读 · 先看这几套再动手（❤️人性需求 ＋ 🧠NLP ＝ 所有内容的根；📋 内容矩阵模版 ＝ 每条内容的立项格式 ＋ 🚦Status 工作流）


---

## 📄 09-6大人性需求-内容角度更有方向.md

# 6 大人性需求 —— 让内容角度更有方向（通用，任何行业都能用）

> 🔴 **两条底盘规则（跟 SKILL.md / 本包 README 一致，做这一步也守）：** ① **交互**：问用户任何选择题 → 一题一题、一题一张可点选项卡（每题≤4 个+「其他」）、**绝不一次全倒**。② **底层三层**：出的每样东西都套 说服（大师：**Blair Warren 为处境正名**/自我说服/LF8/AIDA·PAS/Cialdini/Duarte）+ 语言（NLP）+ 动机（6 大人性需求），**说得出「用了哪个大师 + 哪个 NLP + 戳哪个需求」，说不出＝重来。**


> 人做任何决定，背后都在满足 **6 种深层需求**（Tony Robbins 框架）。
> 内容戳中哪一个需求，就更容易被"戳到心里"。
> 这份帮你解决"**不知道下一条内容从什么角度切**"——每条内容先问：**它满足哪个需求？**
>
> 用法：给内容矩阵的每一格**配一个主需求**；一批内容里 6 种需求**轮着来**，受众不腻、覆盖更全。

---

## 🧭 6 大需求速查

| 需求 | 人在追求什么 | 什么内容戳中它 | Hook 例子（换成你的行业）|
|---|---|---|---|
| **1. 确定感 Certainty** | 安全、可控、不出错、不被骗 | 保证、证据、步骤清单、对比测评、"怎么做"教程、退款/售后 | 「照这 3 步做，不会翻车」 |
| **2. 新鲜感 Variety** | 新奇、惊喜、变化、刺激 | 反直觉、新趋势、"你没想到的"、幕后、挑战、盲测 | 「99% 的人不知道的做法」 |
| **3. 重要感 Significance** | 被看见、独特、有地位、被需要 | 身份认同、专属/限量、成就展示、"你值得"、专家/VIP 感 | 「只有认真的人才配拥有」 |
| **4. 爱与连接 Love & Connection** | 归属、被理解、被爱、同类 | 社群、共鸣故事、"我们"、幕后温情、客户关系、身份共同体 | 「原来不只我这样」 |
| **5. 成长 Growth** | 变强、学会、进步、突破 | 教育、转变前后、"升级你的…"、技能拆解、学员进步 | 「30 天从 0 到能自己做」 |
| **6. 贡献 Contribution** | 利他、有意义、影响别人、留下价值 | 使命、帮助他人、回馈、"让更多人…"、公益、传承 | 「学会了，你也能帮到别人」 |

---

## 💡 怎么把需求变成内容角度（每个需求 3 个角度）

**1. 确定感**：① 手把手教程（照做就行）② 对比/测评（帮你选对）③ 常见坑清单（避雷）
**2. 新鲜感**：① 行业揭秘/内幕 ② 反常识观点 ③ 新工具/新趋势抢先看
**3. 重要感**：① 学员/客户高光时刻 ② 专属身份（"XX 圈内人"）③ 稀缺/限量
**4. 爱与连接**：① 真实故事引共鸣 ② 建立社群/圈子 ③ 幕后/创始人真心话
**5. 成长**：① 转变前后对比 ② 技能拆解（可学会）③ 学习路线图
**6. 贡献**：① 帮助他人的故事 ② "学会去帮别人" ③ 使命/为什么做这件事

---

## 🔗 怎么跟你的内容矩阵结合

原来的矩阵是 `受众 × 漏斗层 × Hook`。现在**再加一维：人性需求**。

```
受众 × 漏斗层 × Hook × 人性需求 = 一格内容的完整方向
```

- **确定感 / 成长** → 最搭 **MoFu**（讲方法、给证据、教怎么做）
- **新鲜感 / 重要感** → 最搭 **ToFu**（戳注意力、制造好奇/身份）
- **爱与连接 / 贡献** → 全漏斗都能用，尤其做**品牌温度**和**BoFu 临门一脚**

> 小技巧：一个受众的一批内容，**6 种需求各来一两条**，就自然有了节奏和多样性——不会全是硬核教程，也不会全是煽情故事。

---

## 🗣️ 怎么让 Claude 用（直接说）

```
帮我给「<受众>」出 6 条内容角度，6 大人性需求各一条，标清楚每条戳的是哪个需求。
```
```
这条内容我想主打「成长」需求，用「转变前后对比」的角度重写。
```
```
帮我检查这批内容：6 大需求覆盖得均衡吗？缺哪个需求，补 2 条。
```

> 配套：把选好的角度交给 `04-文案框架-验证版` 写成文案；想更有说服力，叠 `08-NLP营销技巧`。
> ⚠️ 护栏照旧：真实、不空承诺、不制造虚假紧迫。



---

## 📄 08-NLP营销技巧-让文案更有说服力.md

# NLP 营销技巧 —— 让文案更有说服力（通用，任何行业都能用）

> 🔴 **两条底盘规则（跟 SKILL.md / 本包 README 一致，做这一步也守）：** ① **交互**：问用户任何选择题 → 一题一题、一题一张可点选项卡（每题≤4 个+「其他」）、**绝不一次全倒**。② **底层三层**：出的每样东西都套 说服（大师：**Blair Warren 为处境正名**/自我说服/LF8/AIDA·PAS/Cialdini/Duarte）+ 语言（NLP）+ 动机（6 大人性需求），**说得出「用了哪个大师 + 哪个 NLP + 戳哪个需求」，说不出＝重来。**


> **NLP（神经语言程序学）** 研究"语言怎么影响人的大脑和行为"。
> 用在营销上，就是一套**让文案更抓人、更被相信、更容易行动**的语言模式。
> 这份是**通用工具箱**：每个技巧都有「原理 / 怎么用在内容 / 例子」，例子是通用的，换成你的行业就行。
>
> 用法：写内容时挑 1–2 个技巧套进去（不是全用）。想让 Claude 用，直接说：「这条文案用 **未来预演 + 换框** 写一版。」

---

## 🧠 12 个最好用的 NLP 技巧

### 1. 未来预演（Future Pacing）
- **原理**：让人在脑中**先体验**拥有结果后的样子，未来的好处变成现在的画面，行动的欲望被提前点燃。
- **怎么用**：描述"用了之后的那一天"——具体、感官、现在进行时。
- **例子**：「想象下个月，你不用再熬夜赶内容，发出去的每一条都有人问『怎么做的』。」

### 2. 先同频再带走（Pacing & Leading）
- **原理**：先说出对方**此刻真实的状态/想法**（同频、建立信任），再顺势把他带到你要的方向。
- **怎么用**：前 2 句讲他现在的痛/现状（他会点头），第 3 句才转向方案。
- **例子**：「你每天忙到没时间做内容（同频），请人又贵又慢（同频）——其实这件事现在可以自己一个人搞定（带走）。」

### 3. 嵌入指令（Embedded Commands）
- **原理**：把"行动指令"藏在一句自然的话里，绕过防御，直接进潜意识。
- **怎么用**：把动作词放进句子中间，语气自然（口播时可轻微加重）。
- **例子**：「当你**现在开始用 AI 做内容**，你会发现原来这么简单。」（指令＝现在开始用）

### 4. 预设（Presupposition）
- **原理**：把你想让他接受的事，当成**已经成立的前提**说出来，人很难反驳一个"预设"。
- **怎么用**：不问"要不要"，而是问"什么时候/哪一个"。
- **例子**：「你**开始做**之后，第一条想先发哪个平台？」（预设＝他一定会开始）

### 5. 换框（Reframing）
- **原理**：同一件事换个"框"去看，意义就变了。把异议/缺点重新定义成优点。
- **怎么用**：把"贵"换成"投资"、"慢"换成"稳"、"难"换成"门槛=护城河"。
- **例子**：「这不是一笔花费，是**一次性买下一个永远能用的技能**。」

### 6. 锚定（Anchoring）
- **原理**：把某个**情绪/画面**反复跟你的品牌绑在一起，之后一想到品牌就触发那个情绪。
- **怎么用**：每条内容结尾用**同一个画面/口号/颜色/手势**收尾，重复=锚。
- **例子**：固定用一句 slogan + 固定品牌色收尾，久了看到就想起你。

### 7. 连续认同（Yes-Set）
- **原理**：先让对方连说几个"对"，进入"同意"的惯性，最后那个请求也更容易被答应。
- **怎么用**：开头连抛 2–3 个他一定认同的小问题，再给主张。
- **例子**：「内容重要吧？（对）没时间做吧？（对）请人贵吧？（对）——所以你需要一套能自己跑的系统。」

### 8. 感官语言 VAK（Visual / Auditory / Kinesthetic）
- **原理**：人分"看/听/感觉"型，多用感官词，文案在脑中更有"画面感"。
- **怎么用**：混用**看得到（画面）、听得到（声音）、摸得到（触感/情绪）**的词。
- **例子**：「你会**看到**后台数字往上走，**听到**客户说『在哪买』，**感觉到**终于松了一口气。」

### 9. 艺术性模糊（Milton 模式）
- **原理**：故意用"留白/概括"的语言，让每个人**自己填进自己的情况**，觉得"说的就是我"。
- **怎么用**：用"很多人/你可能已经注意到/某种程度上"这类词，让读者对号入座。
- **例子**：「你可能已经隐约觉得，**再不学 AI，慢慢会被同行拉开**。」

### 10. 对比框（Contrast Frame）
- **原理**：把"旧方法的惨"和"新方法的好"并排，落差越大，价值越明显。
- **怎么用**：左边列 before（痛），右边列 after（爽），或"别人 vs 你"。
- **例子**：「以前：一条内容磨一整天。现在：一个下午出十条。」

### 11. "因为"催化剂（Because Justifier）
- **原理**：给一个理由（哪怕很简单），"因为"这个词本身就会提升被答应的概率。
- **怎么用**：每个主张/CTA 后面补一个"因为…"。
- **例子**：「现在就报名，**因为**这套方法趁早用趁早领先。」

### 12. 模式打断 + 故事（Pattern Interrupt / Story）
- **原理**：开头用一句反常/反直觉的话打断惯性滑动（hook），再用故事把人带进去（人天生爱听故事）。
- **怎么用**：第一句反预期；然后讲一个"某个人从痛到爽"的小故事。
- **例子**：「别再学怎么用工具了。——我认识一个老板娘，学了三个软件还是发不出内容，直到她换了个做法…」

---

## 🎯 怎么配漏斗层用（NLP × ToFu/MoFu/BoFu）

| 漏斗层 | 主打目的 | 最搭的 NLP 技巧 |
|---|---|---|
| **ToFu 觉醒** | 戳痛、点醒 | 先同频再带走 · 艺术性模糊 · 模式打断 · 对比框 |
| **MoFu 信任** | 讲方法、给证据 | 感官语言 · 故事 · 换框 · 连续认同 |
| **BoFu 行动** | 推进决策 | 未来预演 · 预设 · 嵌入指令 · 「因为」催化剂 · 锚定 |

---

## 🗣️ 怎么让 Claude 用（直接说）

```
这条文案用「未来预演 + 换框」重写一版，结尾加一个「因为」催化剂。
```
```
把这条 ToFu 用「先同频再带走」的结构改：前两句讲我受众的真实痛，第三句才转方案。
```

> ⚠️ 护栏：NLP 是**放大真实价值**的工具，不是骗人。别承诺做不到的结果、别制造虚假紧迫（合规红线照旧）。
> 配套：内容角度的"方向"用 `09-6大人性需求`；文案分层骨架用 `04-文案框架-验证版`。



---

## 📄 05-Notion内容矩阵页模版.md

# Notion「内容矩阵」页模版（建库 + 每条立项页照这个填）

> 🔴 这是内容矩阵 database 的**标准模版**。00 守门人建库时照「一、属性」建栏位；之后**每建一条立项页，正文照「二、正文」填成这个样子**（Claude 建页时就填好，别留空页）。
> 🔴🔴🔴 下面的具体值（学员见证/内容创作者/数字营销/「一个人扛全公司」/「AI营销系统」…）**全是 SUMA 示例——只是「长什么样」的形状参考，绝不照抄它的角度/产品/卖点**。内容（内容角度/文案/图prompt/台词）必须**从这个业务自己的品牌地基长出来**（它卖什么、卖给谁、怎么交付）：代运营 agency=「交给我们做」· 卖货=「产品解决你什么」· 服务店=「来店体验」，跟 SUMA「教你自己搭系统」完全不同。
> 🔴 **每格的文案/图prompt/台词 = 现场套对应 skill 规则真写**（文案→02 · 图→03 · 台词→04），别在建库时随手填、别套模版例子当真内容。
> 🔴 **「Notion 默认模版」API 设不了** —— 见「三、设为默认」，教学员手动点一次。

---

## 🚦 Status 工作流（🔴 Status 决定这一步该做什么 —— 开工前先看它）

> 🔴🔴 **动任何一条内容前，先读它的 `Status`；Status 决定这一步做什么，别不看 Status 就闷头产出。做完这一步就把 Status 推进到下一状态。**

| Status | 含义 | 🔴 这一步该做什么 |
|---|---|---|
| **Not Started** | 还没开始（刚开的空行）| 定角度方向、照模版把立项页填起来 → 角度写好改 `Need Review Idea` |
| **Need Review Idea** | 角度 / 想法待审 | 审角度（Hook ＋ ❤️人性需求 ＋ 🧠NLP、贴不贴业务）；过 → `Proceed to Generate`，不行 → `Need Modify` 或 `Rejected` |
| **Proceed to Generate** | 已批准生产 | 写文案 / 图 prompt / 脚本（如还没写）＋ 🔴 去生成图 / 视频 / 数字人（**生成前先把 prompt ＋ 预计 credit 给用户确认再烧**）→ `Need Review Poster/Video` |
| **Need Review Poster/Video** | 成品出来了，待审 | 审成品（渲染 / 乱码 / 外国脸 / 合规）；过 → **成品三落归档**（本地 ＋ Notion ＋ Drive）→ `Checked`；要改 → `Need Modify` |
| **Checked** | ✅ **全部做完 ＋ 审过 ＋ 归档好，只差还没发** | 排期 / 等发；发出去 → `Posted` |
| **Need Modify** | 角度 / 成品要改 | 按反馈改（文案 / prompt / 重生成）→ 改好回 `Need Review Poster/Video`（或对应待审）|
| **Rejected** | 这条弃用 | 不再产出，留着当记录 / 教训 |
| **Posted** | 已发布 | 回看数据表现，好的角度复用 |

> 🔴 这 8 个 Status 是标准工作流值（可按业务微调），但**「先看 Status、Status 决定做什么、做完改 Status」这条铁律不变**。
> 🔴🔴 **`Checked` ＝ 万事俱备、只差发布**（不是「角度审过」）—— 它在流程**倒数第二步**，别搞反。

---

## 一、database 属性（栏位）

> 🔴 **建 database 时，属性就按这个表从上到下的顺序建**（= Notion 里从左到右的列顺序，照做就行）。
> 🔴 **Title（Aa 属性）= `内容角度`**（页面大标题就是那句角度整句），**不是**「命名标题」（命名标题是另一个文本属性 = 编号命名串）。

| 栏位 | 类型 | 说明 / 示例值 |
|---|---|---|
| **广告投放日期** | Date | 可空 |
| **Status** | Select | Not Started / Need Review Idea / Checked / Proceed to Generate / Need Review Poster/Video / Need Modify / Rejected / Posted（工作流状态，见上方 🚦 Status 工作流）|
| **Stage** | Select | ToFu / MoFu / BoFu |
| **目标受众** | Select | 按用户受众（例：内容创作者_In-house Marketer / Freelance Marketer） |
| **领域** | Select | 按用户领域（例：数字营销） |
| **行业** | Select | 按用户行业（例：Marketer） |
| **主讲人** | Person | 谁出镜（可空） |
| **命名标题** | 文本 | `编号 Hook - Stage - 受众：一句话`，例：`06 学员见证 - MOFU - 内容创作者_In-house Marketer：搭了AI内容营销系统后产能提升、被看见` |
| 🔴 **内容角度** | **标题(Title · Aa)** | 这条内容的角度**整句 = 页面标题本身**（例：「学员见证：从前一个人在公司加班到十点还追不完内容，搭了一套自己的AI内容营销系统后…」）。**这就是数据库的 Title 属性。** |
| **Hook 类型** | Select | 学员见证 / 行业揭秘 / 痛点直击 / 对比反差 / 趋势警醒 …（按业务扩） |
| **🏷️ 关联主题** | Multi-select | 🔴 **按业务自己的内容主题/系列**（例：客户见证 / 行业干货 / 产品展示 / 优惠活动…）。⚠️ **不是「AI内容课」**——那是 SUMA 自己的字段；通用业务一律用自己的主题。 |
| **媒体类型** | Select | 视频 / 图文 |
| **备注** | 文本 | 可空 |
| **❤️ 人性需求** | Select | 确定 / 新鲜 / 重要 / 爱与连接(Love & Connection) / 成长 / 贡献 |
| **🧠 NLP技巧** | Select | social proof 社会认同 / 换框 / 锚定 / 未来预演 / 连续肯定 … |
| **📽️ Hook变体(A/B)** | 文本 | 前3秒评分 X/10 + 变体A（角度1）/ 变体B（角度2），用来 A/B 测钩子 |

---

## 二、页面正文模版（每条立项页照填，别留空页）

### 📹 视频类（媒体类型=视频）

正文顺序（🔴 **概念是概念、文案是文案、台词是台词 —— 三样分开，别塞一起**）：

**## 概念**
`<角度类型（如 觉醒型ToFu）+ 用的 NLP：这条内容的「想法/角度」一句话 —— 跟图文的「概念」同一种，不是 caption>`

**## 📱 视频社媒文案**（= 文案，发帖 caption）
`<🔴 完整文案：照 02「§四 节拍表」填满每一拍（ToFu/MoFu 9 拍 · BoFu 6 拍）· **卖自己产品/服务，AI 全程隐形** · 字数达标（ToFu≥250 / MoFu≥300 / BoFu≥200 字）· 分段（每拍空行）+ 适当 emoji（3–6 个）· NLP 按漏斗层挑 + 戳 ❤️人性需求 · 参照 02「§五 示范」· + hashtags —— 绝不缩成 2 句 caption>`

**## 📽️ 分镜脚本（8-shot）**（表格；里面的「台词」列 = 每 shot 主播讲的话，又是另一回事）
分镜表格列（🔴 **`Higgsfield Prompt` 列宽 ≈ 562px** —— 这是曾定的标准列宽，够宽才看得全 prompt）：

| 画面构图 | Higgsfield Prompt（含图内文字与排版规格）| 台词 | 适用平台 | 🎯涉及的USP（独特卖点）|
|---|---|---|---|---|
| 口播开场，学员对镜头真诚自述 | `<纯英文 seedance/higgsfield prompt：人物+动作+无字幕护栏+真实感条款…>` | Shot 1 台词：… | 小红书 / IG / FB | <这一 shot 戳中的独特卖点，如「一人顶一队」/「方法论不是工具」> |
| …（共 8 行，一 shot 一行）| … | … | … | … |

> 🔴 **台词 ≠ 文案，别混：** 这列是**台词**（每个 shot 主播嘴里讲的话）；**文案**（发帖 caption）是另一回事，在上面「概念 → 📱视频社媒文案」那段。台词是台词、文案是文案。
> 🔴 **`🎯涉及的USP` = 这一 shot 卖的「独特卖点/独特销售主张」**（不是用了哪个 AI skill —— 这条属于哪个主题在页面属性「关联主题」里）。每个 shot 挂它主打的 USP，方便看整支片有没有把卖点讲全。

> 🔴 视频类台词/脚本 = 文案，**先套 CMO + 文案大师身份再写**（见 `02 AI文案`）；prompt 规则以 `04 AI口播短视频` 为准（声画一起生成、无字幕护栏、人物贴受众）。

### 🖼️ 图文类（媒体类型=图文）

正文顺序照这个（比视频多「图内文字层级」和「素材」两段）：

**## 概念**
`<角度类型（如 觉醒型ToFu）+ 用的 NLP：这条内容的角度一句话说明>`

**## 🖼️ 图内文字层级**（海报上要出现的字，分层 —— 就是 poster 三层分工）
- 🔴 **顶部受众 pill**：<受众一句话，如「在公司做 Marketing 的你」>
- 🟠 **立体描边大标题**（黑色粗描边 + 品牌渐变）：<最痛/最爽一句，如「一个人，扛全公司的内容」>
- 🟥 **色块横幅**（品牌深色底，白/黄字）：<解决方案一句>
- ⚪ **底部技能/卖点打勾清单一行**：✅… ✅…（按业务，别太多字）
- ⚪ **起价小字（可选 · 合规才放）**：<如「从 RMxxx 起」——🔴 ToFu 只暗示、BoFu 才明码；不合规就不放>
- ⚪ **右上角留 logo 位**
> 🔴 **分层铁律**：ToFu 只戳痛点、字要少；BoFu 才放 offer/价（跟海报 SOP 一致）。

**## 🖼️ 已生成图片**
`待生成`（生成后把图贴这）

**## 📸 提供给 Higgsfield 的素材**
- ① **素材图**：<真实场景描述 —— 人物一律本地人、真实办公/生活场景>
- ② **风格参考**：<文档感 / 光线 / 「一个人 vs 一整间公司」压力对比 / 负空间多、字少>

**## 表格：画面构图 | Higgsfield Prompt | 文案**
🔴 **`Higgsfield Prompt` 列宽 ≈ 562px**（跟视频表同一标准列宽）。

| 画面构图 | Higgsfield Prompt（含图内文字与排版规格）| 文案 |
|---|---|---|
| `<一句画面描述>` | `<纯英文出图 prompt：3:4 + 场景 + 🔴 **把上面「图内文字层级」的中文大字放引号里让 Higgsfield 渲染进图**（headline/pill/横幅/清单）+ 真实感 + logo位 + 护栏「只渲染引号中文·NO garbled」。🔴 **绝不写 no text overlay**（那是视频规则，海报要字！），规则见 03>` | `<🔴 完整文案：照 02「§四 节拍表」填满每一拍（ToFu/MoFu 9 拍 · BoFu 6 拍）· **卖自己产品/服务，AI 全程隐形** · 字数达标（ToFu≥250 / MoFu≥300 / BoFu≥200 字）· 分段（每拍空行）+ 适当 emoji（3–6 个）· NLP 按漏斗层挑 + 戳 ❤️人性需求 · 参照 02「§五 示范」· + hashtags —— 绝不缩成 2 句 caption>` |

> 🔴 **`文案` = 这张图配的发帖 caption**（跟视频页「概念 → 📱视频社媒文案」对应）。图内的字在「图内文字层级」，发帖的字在这列，别混。

**## 成品海报（最终标准版：真人脸 + 真实场景 + 大字）**
`<合 logo 后的成品图贴这>`

---

## 三、🔴 设为默认模版（Notion API 做不到，手动一次 · Claude 教学员点）

建完库、填好一条示例页后，让 Claude **一步步教学员**在 Notion 里把它设成默认（之后每次 **New** 自动套）：

1. 打开这个内容矩阵 database。
2. 「**New**」按钮右边的 **⌄** → **+ New template**。
3. 把上面「二、正文」的结构（概念 + 8-shot 表 / 海报 prompt）做进这个模版页、属性留空当占位。
4. 模版页右上 **⋯** → **Set as default**（设为默认）→ 选「for all views」。
5. 以后点 **New** 就自动是这个模版；Claude 通过 API 建页时也照「二、正文」填，两边一致。

> 为什么要手动这一步：Notion 的**公开 API 不支持创建/设置 database 模版**（那是界面功能）。所以 Claude 能建库、能把每页正文填成模版样子，但「点 New 自动套」这个默认只能手动设一次。


---


---

> 🔴🔴 **动手前必做（第 0 件事）：先用 `Read` 把本文件夹里的每一个 `.md` 文件读一遍**（框架 / NLP / SOP / 模版 —— 完整规则在那里），读进来再开工。**别只看这份 SKILL.md 就动手 = 出烂成品。**

## 第一步：先跟用户敲定海报风格（5 选 1，一题一张卡问）
促销 / BoFu 海报从这 5 种里挑，按行业 / 受众搭配，🔴 同批次别整批用同一种：
- **A｜战报证明风**：立体描边大标题 + 实心横幅放一个**温和**成果/转变陈述（不写离谱金额、不做个人结果保证）+ 圆形 icon 打勾清单 + 真人合照压底做背书。→ 需强背书行业（电商、招生、补习、小生意老板）。
- **B｜信息流悬浮 UI 风**：深色背景真人拿手机/电脑，周围悬浮半透明发光 UI 卡片（内容一律抽象色块、**无可读文字**），标题带光效。→ 科技/年轻潮流（美妆、服装、副业人）。
- **C｜导师权威风**：深色科技背景，自信真人张开双臂"掌控"数据面板，一个**放大的数字/徽章**当视觉核心。→ 专业权威（保险、顾问、Marketer、打工人）。
- **D｜赛博游戏化风（🔴慎用）**：高度风格化人物 + 霓虹 + 能量特效 + "LEVEL UP"式用语。最花哨，只在受众明显年轻/游戏化时用，**默认不选**。
- **E｜扁平色块对角风（最稳/保底）**：对角撞色色块 + 立体描边大标题 + icon 打勾清单 + 真人 + 真 logo。→ 补习/才艺班/克制的顾问型个人 IP。

## 🔴🔴 图文海报 = 要渲染大字！别当成没字的场景照
**图文海报 ≠ 视频镜头。** 海报要 Higgsfield **把「图内文字层级」的中文大字渲染进图**（headline / 受众 pill / 色块横幅 / 清单，中文放**引号**里）。
- 🔴 **绝不写 `no text overlay`** —— 那是 04 视频的无字幕规则！海报**要字**，写了就出一张没字的空场景照（烂成品）。
- 🔴 护栏是「**只渲染引号里的中文** + `NO garbled text`」（防乱码），不是"不要字"。
- 🔴 prompt 里必须带上你在「图内文字层级」写好的那几句中文（headline/pill/横幅/清单），不是只写场景。

## 🔴🔴 标准 prompt 黄金模板（照这个逐行填 —— 好海报的结构，绝不缩水成一句场景）
以 **A 战报证明风** 为例（换风格只换视觉，TOP/headline/banner/MIDDLE/checklist/CRITICAL 结构不变）：
```
vertical 3:4 BOLD promo-style poster, Style A 战报证明风: chunky 3D-extruded/embossed outlined Chinese headline (thick black outline, [品牌色] gradient fill) + a solid colour-block banner strip + an icon-checklist feature list + a real photo grounding credibility.
TOP: small kicker pill naming the audience: '[受众一句话]'.
Big chunky 3D-extruded outlined headline (the PAIN/contrast opener): '[痛点/反差主标题]'.
Below headline: a solid [品牌深色] colour-block banner strip with bold white/yellow text stating the NAMED SOLUTION + a concrete moderate outcome: '[方案+温和成果]'.
MIDDLE: real photo (photoreal, authentic documentary-style candid photo, NOT a cutout) of [主角详细:本地人+年龄+气质,NOT auntie], [真实场景+道具+情绪], natural window light, real camera look NOT AI-looking, authentic [本地].
Below the photo: an icon-checklist row, [N] small colourful circular icon badges with checkmarks and tiny labels: '✅[卖点]' × [N], small clean single row, must NOT dominate the poster.
[可选·合规才放] a tiny price-hint line near the bottom: '[从 RMxxx 起]'.
NO course-name capsule, NO sign-up button, NO specific outcome guarantee (no '保证/包你/一定能'). Keep top-right corner truly empty for a logo — do NOT render the word 'LOGO' or any placeholder.
🔴 CRITICAL: render NO English words/letters anywhere; the ONLY rendered text is the Chinese specified above, proofread character-by-character, no typos, no repeated/duplicated text blocks, no garbled characters; the person is a real local [本地] (photoreal, not cartoon/CGI).
```
🔴 **结构必须齐**：① TOP 受众 pill ② 大字痛点标题(3D描边) ③ 色块横幅=方案+成果 ④ 中段真人纪实照(NOT cutout·NOT auntie·本地) ⑤ 一行图标打勾清单 ⑥ 起价小字(合规才放) ⑦ 右上 logo 空位 ⑧ **CRITICAL 只渲染引号中文·proofread·no garbled·绝不出英文**。
🔴 人脸锁定：`generate_image` 传 `medias:[{value:<media_id>, role:"image"}]` + `the person's face MUST match the reference exactly`；屏幕内容 `abstract blurred colour blocks, NO legible text`。

## 图内文字层级（画面 carry，文字精简）
① 受众 pill（顶部小标签，点名"就是你"）② 大标题 headline（立体描边、全图最大、戳痛点/给结果）③ 色块横幅/sub（一行成果或时间陈述，温和可信）④ 技能/工具清单（圆形 icon 打勾）⑤ logo 位（右上/顶部纯色留空，绝不让 AI 画）。

## 通用海报硬规则（哪种风格都套）
- 🔴 **ToFu 不放价格**（价格是 BoFu 专属）：ToFu 用温和时间型 hero 巨字（例：「1 天」渐变/发光）当钩子。
- 🔴 **真实纪实场景 + 悬浮科技元素混搭**，不要纯棚拍/纯抠图；人物在行业相关真实场景里（例：电商打包桌、老师画室），科技只点缀。
- 🔴 **不 overpromise**：不写夸张金额、不写「保证/包你/一定能」。
- 🔴 **同批不同受众分不同风格**，别整批一样。
- **光效按漏斗层**：BoFu/促销可酌情用；ToFu 纪实软钩子风 + 所有 MoFu **禁 sci-fi/glow**。

## 🔴 踩坑（每个都花过时间）
- 🔴 **色号别贴着要渲染的文字**：写 `#28C2E7 sub '文字'` 会把 `#28C2E7` 印进图。颜色用**词**描述，色号只结尾单列 + 写「hex 只是样式、绝不渲染成文字」。
- 🔴 **别写字体规格标注**（例 `Source Han Sans 60px` 会被印进图）。
- 🔴 **人物一律本地 + 贴行业气质**：连屏幕里/模特/背景都本地人（例：美妆老板娘=年轻好皮肤、不要 aunty）。
- 🔴 **对比图/split-screen**：写 `full-bleed，这就是海报本身，NOT 印刷海报立街边/白框`，否则画「海报中的海报」。
- 🔴 **比例统一 3:4 竖版**。
- 🔴 **生成后一定 Read 图人工审**：色号泄漏 / 乱码 / 外国脸 / 撞 logo，任一命中就重出。

## Logo 合成（PIL 后期，别靠 prompt 留白）
prompt「留白」不可靠且会出假 logo。做法：**成图最上方叠一条纯色 header 带**，logo 放带内右侧，带色**自适应**（顶部浅→白带+深 logo，深→深带+白 logo），原图缩到留出带位、保持 3:4 → logo 永远有干净空位、不撞标题。

## 📌 完整实例（SUMA 真实产出 · 照抄结构，换成你的行业/受众/卖点）
```
vertical 3:4 BOLD promo-style poster, Style A 战报证明风: chunky 3D-extruded/embossed outlined Chinese headline (thick black outline, orange-to-yellow gradient fill) + a solid colour-block banner strip + an icon-checklist feature list + a real photo grounding credibility.
TOP: small kicker pill naming the audience: '开中学补习班的你'.
Big chunky 3D-extruded outlined headline (the PAIN/contrast opener): '教得再好，家长网上看不到你'.
Below headline: a solid red/deep-orange colour-block banner strip with bold white/yellow text stating the NAMED SOLUTION + a concrete moderate outcome: '1 天学会 AI内容营销系统，自己做出招生内容'.
MIDDLE: real photo (photoreal, authentic documentary-style candid photo, NOT a cutout) of a young Malaysian secondary-school (SPM) tuition teacher (around 30, sharp and professional, good skin light makeup, NOT an auntie) sitting alone at dusk in her bright classroom, a whiteboard still full of handwritten SPM-level questions (algebra equations, chemistry formulas), a row of empty student chairs beside her, textbooks and exam papers on the desk, her phone lying silent with no new enquiry, quietly waiting, a little worried, honest calm moment, natural window light, real camera look NOT AI-looking, authentic Malaysian.
Below the photo: an icon-checklist row, 6 small colourful circular icon badges with checkmarks and tiny labels: '✅AI文案', '✅AI图像', '✅AI数字人', '✅AI PPT', '✅AI音乐', '✅AI影片', small clean single row, must NOT dominate the poster.
A tiny price-hint line near the bottom: '从 RM500/人起'.
NO course name capsule, NO sign-up button, NO specific outcome guarantee to an individual (no '保证/包你/一定能'). Keep top-right corner truly empty for a logo — do NOT render the word 'LOGO' or any placeholder.
🔴 CRITICAL: render NO English words/letters anywhere; the ONLY rendered text is Chinese as specified, proofread character-by-character, no typos, no repeated/duplicated text blocks, no garbled characters, the person is a real local Malaysian (photoreal, not cartoon/CGI), young professional teacher, never an auntie.
```
🔴 换行业时：受众 pill / 痛点标题 / 方案+成果 / 主角 / 卖点清单 全换成你业务的；**8 块结构 + CRITICAL 那段一字不动照搬**。

## 接进系统 + 归档（🔴 三处都要落，一处都不能跳）
出图 → PIL 合 logo → **成品三落**（见顶部「成品归档」铁律，别找借口）：
1. 本地成品 folder。
2. 🔴 **贴进 Notion 立项页「成品海报」块**：本地 PNG 没公开 URL → `media_upload`(成品.png) PUT 上传 → `media_confirm` → `show_medias` 取公开 URL → `notion-create-attachment` 的 `source_url` 喂它 → 拿 `markdown_source` → `notion-update-page`(insert_content) 贴进「成品海报」块（🔴 1 小时内贴完）。免费版 ≤5MiB，超了先压。
3. 🔴 **`rclone copy "<成品.png>" gdrive: --drive-root-folder-id <Drive成品folder ID>` 传进 Drive**。
🔴 **绝不说「图太大 / 传不了 Notion / 传不了 Drive / 你自己上传 / 你自己拖」** —— Notion 走 source_url、Drive 走 rclone，两条都跑得通。
> 📌 附：你（开发者 Cindy）自己用 token 直连 Notion API 时，附件要归 image 块自己（record.id=新建 image 块 id，否则渲染 Error 400）+ `getSignedFileUrls` GET=200 验证 —— 那是内部脚本路径，**学生用 connector 走上面 source_url 那套**。

---

> 📄 **本文件夹的其他 md = 这一步的完整规则/框架**，务必先读。改内容请改 SUMA 主 repo 的 `7大AI启动包`，再重生成。


---

# 📚 完整参考资料（已全部收进本 skill · 按序号排 —— 下面就是各 md 全文，不用再翻别的文件）


---

## 📄 README.md

# Skill · AI 图像（工具：Higgsfield / nano_banana）

> 🔴 **交互铁律（跟 SKILL.md 一致，这一包的任何一步都守）：问用户任何选择题 —— 一题一题问、一题一张可点选项卡（`AskUserQuestion`，每题最多 3–4 个选项，系统自动加「其他」）、**绝不一次全倒**。只有开放题（品牌名 / 具体挑刺 / 参考链接）才让他打字。**

> 🔴 **底层三层（跟 SKILL.md 一致，这一包出的每样东西都要套）：① 说服（大师：**Blair Warren 为客户处境正名**/自我说服/LF8/AIDA·PAS/Cialdini/Duarte 客户是英雄）· ② 语言（NLP：换框/未来预演/连续肯定/锚定）· ③ 动机（6 大人性需求：确定/新鲜/重要/爱与连接/成长/贡献）。做完要能说出「这套了哪个大师 + 哪个 NLP + 戳哪个人性需求」——说不出 = 只做了表面，重来。**



**在系统里的工位：** 出海报 / 成品图 —— 图文生产线的核心。

## 怎么用好（核心：场景化 + 画面感）
主视觉 = **该受众的真实日常场景**（照片级实拍 / documentary / NOT AI / 本地感），把痛点**可视化**，不是抽象排版。文字精简（headline + sub + 工具 pill + CTA 胶囊），让画面 carry。

**🔴🔴 标准 prompt 黄金模板（照这个逐行填 —— 这是产出好海报的结构，绝不缩水成一句场景）：**
以 **A 战报证明风** 为例（换风格只换视觉，TOP/headline/banner/MIDDLE/checklist/CRITICAL 结构不变）：
```
vertical 3:4 BOLD promo-style poster, Style A 战报证明风: chunky 3D-extruded/embossed outlined Chinese headline (thick black outline, [品牌色] gradient fill) + a solid colour-block banner strip + an icon-checklist feature list + a real photo grounding credibility.
TOP: small kicker pill naming the audience: '[受众一句话，例:开中学补习班的你]'.
Big chunky 3D-extruded outlined headline (the PAIN/contrast opener): '[痛点/反差主标题，例:教得再好，家长网上看不到你]'.
Below headline: a solid [品牌深色] colour-block banner strip with bold white/yellow text stating the NAMED SOLUTION + a concrete moderate outcome: '[方案+温和成果，例:1天学会…自己做出…]'.
MIDDLE: real photo (photoreal, authentic documentary-style candid photo, NOT a cutout) of [主角详细:本地人+年龄+气质，NOT auntie], [真实场景+道具+情绪], natural window light, real camera look NOT AI-looking, authentic [本地].
Below the photo: an icon-checklist row, [N] small colourful circular icon badges with checkmarks and tiny labels: '✅[卖点]' × [N], small clean single row, must NOT dominate the poster.
[可选·合规才放] a tiny price-hint line near the bottom: '[例:从 RMxxx 起]'.
NO course-name capsule, NO sign-up button, NO specific outcome guarantee to an individual (no '保证/包你/一定能'). Keep top-right corner truly empty for a logo — do NOT render the word 'LOGO' or any placeholder.
🔴 CRITICAL: render NO English words/letters anywhere; the ONLY rendered text is the Chinese specified above, proofread character-by-character, no typos, no repeated/duplicated text blocks, no garbled characters; the person is a real local [本地] (photoreal, not cartoon/CGI).
```
🔴 **结构必须齐**：① TOP 受众 pill ② 大字痛点标题(3D描边) ③ 色块横幅=方案+温和成果 ④ 中段真人纪实照(NOT cutout·NOT auntie·本地) ⑤ 一行图标打勾清单 ⑥ 起价小字(合规才放) ⑦ 右上 logo 空位 ⑧ **CRITICAL 只渲染引号里中文·proofread·no garbled·绝不出英文**。🔴 绝不写 `no text overlay`（海报要字）。

## 海报风格库（5 种可选风格 · 按受众挑，🔴 同批次别全用同一种）
促销 / BoFu 海报可从这 5 种风格里挑，按你的行业 / 受众自由搭配：
- **A｜战报证明风**：立体描边大标题 + 实心横幅放一个**温和**的成果/转变陈述（不写离谱金额、不做个人结果保证）+ 圆形 icon 打勾清单 + 真人合照压底做背书。→ 需强背书的行业（电商、招生、补习、小生意老板）。
- **B｜信息流悬浮UI风**：深色背景真人拿手机/电脑，周围悬浮半透明发光 UI 卡片（内容一律抽象色块、**无可读文字**），标题带光效。→ 偏科技 / 年轻潮流（美妆、服装、副业人）。
- **C｜导师权威风**：深色科技背景，自信真人张开双臂"掌控"周围数据面板，一个**放大的数字/价格徽章**当视觉核心。→ 专业权威调性（保险、顾问、Marketer、打工人）。
- **D｜赛博游戏化风（慎用）**：高度风格化人物 + 霓虹 + 能量特效 + "LEVEL UP"式用语。冲击最强但最花哨，只在受众明显年轻/游戏化时用，**默认不用**。
- **E｜扁平色块对角风（最稳/保底）**：对角撞色色块 + 立体描边大标题 + icon 打勾清单 + 真人 + 真 logo。→ 补习/才艺班/克制的顾问型个人 IP。

## 通用海报硬规则（无论哪种风格都套）
1. 🔴 **人物用真人脸参考锁定身份**：`generate_image` 传 `medias:[{value:<media_id>, role:"image"}]` + prompt 写 `the person's face/identity MUST match the reference image exactly`，别让模型生成陌生脸。
2. 🔴 **同批次不同受众分配不同风格**，别整批长一样。
3. 🔴 **ToFu 不放价格**（价格是 BoFu 专属）：ToFu 改用一个**温和可信的时间型 hero 大字**（如「1 天」）做成渐变/发光巨字当视觉钩子，配小字呼应该行业产出。
4. 🔴 **画面 = 真实纪实场景 + 悬浮科技元素混搭**，不要纯棚拍/纯深色抠图 —— 人物必须在跟行业相关的**真实场景**里（电商打包桌、老师画室…），科技元素只做点缀。
5. 🔴 **屏幕内容** `abstract blurred colour blocks, NO legible text`（防乱码假 UI）。
6. 🔴 **右上留 logo 位** + prompt 写 `do NOT render the word 'LOGO'`（防占位字）。
7. 🔴 **不 overpromise**：不写夸张金额结果、不写「保证/包你/一定能」；可用温和时间框架（如「1 天学会」）。
8. **光效按漏斗层**：BoFu/促销 + ToFu 走 A–E 促销风格时可酌情用；ToFu 纪实软钩子风 + 所有 MoFu 仍**禁 sci-fi/glow**。

> 📎 例（仅示范，换成你行业）：BoFu 三档报价用「**人均价当巨大主视觉数字**」（人均价看着没那么痛，是更好的价格锚点），不用总价当大字；具体报价/人脸素材/命名是各品牌自己的事。

## 踩坑（我们学到的，每个都花过时间）
- 🔴 **色号别贴着要渲染的文字**：写 `#28C2E7 sub '文字'` 会把 `#28C2E7` 印进图。颜色用**词**描述，色号只在结尾单独注明 + 加「hex 只是样式、绝不渲染成文字」。
- 🔴 **别写字体规格标注**（`Source Han Sans 60px` 会被印进图）。
- 🔴 **人物一律本地 + 贴行业气质**：连屏幕里/模特/背景都要本地人；美妆老板娘=年轻漂亮好皮肤，**不要 aunty**。
- 🔴 **对比图/split-screen**：写 `full-bleed，这就是海报本身，NOT 印刷海报立街边/易拉宾/白框`，否则模型画「海报中的海报」。
- 🔴 **logo 别让 AI 画**（会出假 logo）：右上/顶部留空，真 logo 后期 PIL 合成。
- 🔴 **比例统一 3:4 竖版**。
- 🔴 **生成后一定 Read 图人工审**：色号泄漏 / 乱码 / 外国脸 / 撞 logo。

## Logo 合成（PIL，系统关键技巧）
不靠 prompt「留白」（不可靠 + 会出假 logo），也不用底板——**在成图最上方叠一条纯色 header 带**，logo 放带内右侧。带色**自适应**：取顶部亮度，浅→白带+蓝 logo，深→深带+白 logo。原图缩到留出带位、保持 3:4。→ logo 永远有干净空位、绝不撞标题。

## 接进系统 + 归档（🔴 三处都要落，一处都不能跳）
出图 → PIL 合 logo → 成品三落，**别找借口**：
1. 本地成品 folder。
2. 🔴 **贴进 Notion 立项页「成品海报」块**：学生用 Notion connector，本地 PNG 没公开 URL → 用 Higgsfield `media_upload`(成品.png) PUT 上传 → `media_confirm` → `show_medias` 取公开 URL → 喂 `notion-create-attachment` 的 `source_url` → 拿 `markdown_source` → `notion-update-page`(insert_content) 贴进「成品海报」块（🔴 1 小时内贴完；免费版 source_url ≤5MiB，超了先压）。
3. 🔴 **`rclone copy "<成品.png>" gdrive: --drive-root-folder-id <Drive成品folder ID>` 传进 Drive**（文件名=页内 heading）。
🔴 **绝不说「图太大 / 传不了 Notion / 传不了 Drive / 你自己上传 / 你自己拖」**。
> 📌 附：开发者用 token 直连 Notion API 时附件要归 image 块自己（record.id=新 image 块 id，否则 Error 400）+ getSignedFileUrls GET=200 —— 那是内部脚本路径，学生走上面 source_url 那套。

