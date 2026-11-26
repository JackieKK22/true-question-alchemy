# 真问题炼金术 · True Question Alchemy

> 让孩子从「我不知道问什么」到「我有一个自己想弄明白的问题」。
>
> A questioning coach that helps a child turn everyday curiosity into a real question they can start exploring today — with the tools already at hand.

一个给孩子用的 **提问教练 Skill**。孩子对某件事好奇、想练习提问、或已有一个模糊想法需要打磨时，它不替孩子把问题写好，而是陪他用自己的话说出来，并选一个自己能做的第一步。

AI Native Learner 系列 · Part 1「会提问」。

---

## 这是什么 / What This Is

- **适用对象**：小学生到初中生（语言随孩子的表达自动调节，不例行问年龄）
- **解决的问题**：孩子不会提问、问题太大太虚、喜欢问「好不好/对不对」、想到一个困惑不知道怎么往下走
- **不做的事**：普通知识查询不默认进入训练；孩子只想要答案时，简短回答，不追问扣住

核心产出不是一份漂亮的研究计划，而是孩子自己说出的三句话：

```
我的问题：
我今天先做：
我会看什么：
```

---

## 安装 / Install

### 方式一：一句话安装（WorkBuddy / OpenClaw / Hermes / Claude Code）

```
@skill://https://github.com/JackieKK22/true-question-alchemy
```

### 方式二：命令行安装（跨平台）

解压 zip 后进入目录：

```bash
bash install.sh                 # 自动探测，装到所有已安装的 Agent
bash install.sh workbuddy       # 只装 WorkBuddy -> ~/.workbuddy/skills/
bash install.sh claude          # 只装 Claude Code -> ~/.claude/skills/
bash install.sh codebuddy       # 只装 CodeBuddy -> ~/.codebuddy/skills/
bash install.sh dsh             # 只装 DeepSeek -> ~/.dsh/skills/
bash install.sh --uninstall     # 卸载
```

脚本优先从同目录的 `SKILL.md` 安装，可离线使用；同目录没有时才从 GitHub 下载。

### 方式三：手动安装（任何 Agent）

把 `SKILL.md` 放进对应目录即可，例如 WorkBuddy 放到 `~/.workbuddy/skills/true-question-alchemy/SKILL.md`。

豆包 / Kimi / 元宝等没有固定技能目录的 Agent，在客户端「上传技能 / 自定义技能」处上传 `SKILL.md`。

---

## 怎么用 / How to Use

不需要特殊指令，正常对话即可。Skill 会先判断孩子是在求知、在探索，还是只是想要一个答案，再决定怎么接。

| 孩子说 | 它会做什么 |
|---|---|
| 「我早上老是找不到要带的作业」 | 从这件小事接起，陪他把困扰变成一个能试几天的办法 |
| 「我是不是不适合学英语？」 | 先弄清这句话指哪件事，不急着安排什么研究任务 |
| 「我就想知道浴室镜子为什么起雾」 | 直接简短解释，不把孩子扣在反问里 |
| 「我想研究一下全球变暖」 | 邀请他把对象缩小到手边能观察、能比较的一小步 |
| 「我试了，可是两次结果不一样」 | 先读结果，再决定要不要换个更公平的比较 |

家长想要反馈时，可明确说「给我一份这次的小报告」。只有家长明确请求或事先约定才输出，且不给孩子贴能力标签。

---

## 设计要点 / How It Works

这套 Skill 把「提问」拆成可观察、可练习的几个动作，而不是一句空泛的「要有好奇心」：

| 环节 | 做什么 |
|---|---|
| **找入口** | 从孩子刚说过、做过、喜欢的事接起；没线索时用双词游戏搭一个小场景 |
| **抓缺口** | 从「抓反常 / 探可能 / 问依据」中选一个动作，不按固定关卡推进 |
| **辨用法** | 含混的词先回到原场景问清楚；把观察和解释分开；价值与情感问题不必强行找数字 |
| **做体检** | 内部参考 N（探索空间）、S（价值）、F（可行性），不给孩子打分，只补最影响下一步的一项 |
| **收束** | 孩子认领了一个具体第一步后，输出《最小研究卡》 |

**几条硬规则**：

- 儿童对话 1–3 句短句，通常不超过 100 字，每轮最多一个需要回答的问题
- 孩子先产出，AI 再补缺口；示范问题会标成「参考问法」，不冒充孩子的成果
- 不称孩子的问题为「伪问题」；能停、能只玩一轮、能先听解释，都不算失败
- 遇到受伤、欺凌或明显不安全的计划，先回应感受和安全，不把困境变成实验
- 不要求孩子透露姓名、学校、住址等个人信息

方法上借鉴后期维特根斯坦对词语**实际用法**的关注：弄清一个词在孩子这句话里到底怎么用，往往比急着找一把「尺子」更重要。N、S、F 只是选题的实用检查项，不是科学评分。

> 想看完整规则与例句，直接读 `SKILL.md`。

---

## 隐私 / Privacy

- 不记录、不上传任何个人信息
- 不读姓名、学校、住址，不涉及外部网络请求与凭据
- 单文件 Skill，不含数据目录，卸载即彻底移除

---

## 文件结构 / Files

```
true-question-alchemy/
├── SKILL.md        # 全部规则与行为示范（唯一必需文件）
├── README.md       # 本文件
├── install.sh      # 跨平台安装脚本
├── LICENSE         # Apache-2.0
└── 分享-小红书.md   # 可直接发布的安装分享文案与配图卡片
```

---

## 许可证 / License

Apache License 2.0。Copyright 2026 开放智慧实验室 Open Wisdom Lab - Jackie Wu

## 关于 / About

开放智慧实验室（Open Wisdom Lab, OWL）致力于让孩子自己提出问题、自己动手做完，而不是成为 AI 的搬运工。

联系：lucjackie@hotmail.com
