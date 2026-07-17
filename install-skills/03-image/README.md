# Skill · AI 图像（工具：Higgsfield / nano_banana）

## 🔑 怎么触发这个 skill（两种方式，任选一个）

| 方式 | 打什么 |
|---|---|
| ① 斜杠（最稳·直接点名）| `/suma-ai-03-image` |
| ② First Prompt（说一句话）| 「帮我出海报／产品图」 |

> 两种效果一样：斜杠直接点名；First Prompt 打一句话，Claude 认关键词自己进。打不中就用斜杠。触发后一题一题问你。

> 🔴 **前置（跟 SKILL.md 一致，缺了先回 `suma-ai-00-setup`）：Notion + Google Drive + GitHub connector 必连**（Notion 建大脑、Drive 存成品、GitHub 装 skill）· 地基 + Notion 骨架先搭好 · 要好 Google Drive folder 链接（成品同步存这）。


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
