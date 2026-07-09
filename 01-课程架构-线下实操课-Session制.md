# 【AI 内容营销系统】线下实操课 · 课程架构（Session 制）

> **定位：** 市场只教单个 skill；我们**一步一个 Session（一章一步）**——从喂地基 → 一节学会一个 AI 技能并当场做出产物 → 再一节一节把它们搭成你自己的**一站式 AI 内容营销系统**。
> **形式：** 线下实操课，每一节都**当场动手**，走出教室手上就多一块真实成品，最后拼成完整系统。
> **铁律：** 一次一步 · 先跑通 1 条再放量（One before many）。

---

## 课程地图（一眼看懂全程）

```
Session 0  喂地基（Feed）
   │
   ├─ Session 1  AI 文案      ┐
   ├─ Session 2  AI 图像      │
   ├─ Session 3  AI 数字人    │  6 个 AI 技能
   ├─ Session 4  AI PPT       │  一节一个，学 + 当场做出产物
   ├─ Session 5  AI 音乐      │
   ├─ Session 6  AI 影片      ┘
   │
   ├─ Session 7  内容矩阵（大脑）
   ├─ Session 8  图文生产线
   ├─ Session 9  视频生产线
   └─ Session 10 自动化 + 串成系统  →  🎓 结课：你自己的一站式系统
```

---

## 每个 Session 的统一结构（4 块）

| 块 | 内容 |
|----|------|
| 🎯 **本节目标** | 学完这节你能做到什么 |
| 📦 **学什么 skill** | 这节要装/用的 Claude skill |
| 📖 **读什么 md** | 这节要读的框架/文档 |
| 🛠️ **当场动手** | 线下实操——现场做一遍 |
| 🎁 **走出教室的交付物** | 这节结束你手上多了什么真东西 |

> 每节的具体 prompt 见 `05-对话会怎么走-Claude带你搭.md` 对应阶段，照抄照填。

---

## Session 明细

### Session 0 · 开课 · 喂地基（Feed）
- 🎯 目标：把你的品牌/生意喂进系统，账号连好。
- 📦 skill：记忆系统（auto-memory）· `ai-content-factory`（总览）
- 📖 md：`02-从零搭建` · `03-SETUP-详细清单-装连喂` · `07-TEMPLATE`
- 🛠️ 动手：连 Notion / Higgsfield / Suno；把品牌名/受众/品牌色/logo/合规红线喂进 memory。
- 🎁 交付：**你的品牌地基 memory + 账号全连好**。

### Session 1 · AI 文案
- 🎯 目标：会用分层框架写你行业的广告文案。
- 📦 skill：`suma-copywriting`
- 📖 md：`04-文案框架-验证版-可直接喂Claude` · `tools/01-ai-copywriting`
- 🛠️ 动手：把验证框架喂给 Claude，写你行业的 ToFu / MoFu / BoFu 各一条。
- 🎁 交付：**3 条广告文案**。

### Session 2 · AI 图像
- 🎯 目标：出一张场景化海报 + 合上你的 logo。
- 📦 skill：Higgsfield（图像）
- 📖 md：`tools/02-ai-image`
- 🛠️ 动手：写场景 prompt → 出图 → Read 图审 → PIL 合 logo(顶部 header 带)。
- 🎁 交付：**1 张成品海报（带你的 logo）**。

### Session 3 · AI 数字人
- 🎯 目标：做一个照片级真人数字主播替你出镜。
- 📦 skill：Higgsfield（Seedance）
- 📖 md：`tools/03-ai-avatar`
- 🛠️ 动手：出人物参考图锁脸 → 生成一段数字人口播。
- 🎁 交付：**你的数字主播 + 一段口播**。

### Session 4 · AI PPT
- 🎯 目标：做一页会卖的卖点页/汇报。
- 📦 skill：Claude / AI PPT 工具
- 📖 md：`tools/04-ai-ppt`
- 🛠️ 动手：把内容结构排好 → 做一页品牌化卖点页。
- 🎁 交付：**1 份卖点 PPT**。

### Session 5 · AI 音乐
- 🎯 目标：给视频配有质感的背景乐。
- 📦 skill：Suno
- 📖 md：`tools/05-ai-music`
- 🛠️ 动手：按情绪 prompt Suno，出一段无人声背景乐。
- 🎁 交付：**1 段可商用背景乐**。

### Session 6 · AI 影片
- 🎯 目标：做出一支完整的口播短视频。
- 📦 skill：Higgsfield（Seedance）· `script-to-video-prompt`
- 📖 md：`tools/06-ai-video`
- 🛠️ 动手：8 分镜脚本 → 锁人物 → 逐镜生成(先 1 镜验证 480p) → 配乐 → 拼接。
- 🎁 交付：**1 支完整短视频（约 90 秒）**。

> ⬆️ 到这里，6 个 AI 技能都学会，且**每个都有一件真产物**。下面开始把它们串成系统。

### Session 7 · 内容矩阵（系统的大脑）
- 🎯 目标：建一张能管上百条内容的 Notion 数据库。
- 📖 md：`SKILL.md`（内容矩阵段）
- 🛠️ 动手：建 Notion database(14 列 + Status 流水线；含 人性需求 + NLP手法) → 排你的 受众 × 漏斗 × Hook 矩阵。
- 🎁 交付：**你的内容矩阵表（立好项）**。

### Session 8 · 图文生产线
- 🎯 目标：把 文案→图像→logo→Notion→Drive 串成一条线。
- 📖 md：`tools/01` + `tools/02` + `SKILL.md`
- 🛠️ 动手：跑通 1 条完整图文（立项→出图→合logo→上传→归档），再复制。
- 🎁 交付：**一批图文成品 + 一条能重复的图文线**。

### Session 9 · 视频生产线
- 🎯 目标：把 脚本→锁人物→逐镜→音乐→拼接 串成一条线。
- 📖 md：`tools/03/05/06` + `SKILL.md`
- 🛠️ 动手：跑通 1 支完整视频流程，再复制到其他内容。
- 🎁 交付：**一批视频 + 一条能重复的视频线**。

### Session 10 · 自动化 + 串成系统（Capstone 结课）
- 🎯 目标：把 6 个技能串成一站式流水线，能自己跑、可记录。
- 📖 md：`06-FRAMEWORK-如何指挥AI搭系统` · `SKILL.md`（自动化段）
- 🛠️ 动手：状态驱动(标 Proceed 才生产) + 批量 + push GitHub 记录；把整条流水线走一遍。
- 🎁 交付：**🎓 你自己的一站式 AI 内容营销系统（可复制、可放量、有记录）**。

---

## 结课后你手上有什么

- 一套**属于你品牌**的内容矩阵（Notion）
- 一条**图文生产线** + 一条**视频生产线**
- 6 个 AI 技能的**真实产物**各一件
- 一份**可放量、可自动化、可记录**的系统
- —— 不是学会一个工具，是**带走一整套能自己跑的系统**。

> 教学材料对应：本 skill 包里 `SKILL.md`(总览+交互教练) · `03-SETUP`(装连喂) · `PROMPTS`(每步口令) · `04-文案框架-验证版` · `tools/`(6 技能) · `FRAMEWORK`(方法论) · `07-TEMPLATE`(填空) · Word 工作手册。
