#!/usr/bin/env bash
# 真问题炼金术（true-question-alchemy）跨平台安装脚本
#
# 用法：
#   bash install.sh                 # 自动探测并装到所有已安装的 Agent
#   bash install.sh workbuddy       # 只装 WorkBuddy
#   bash install.sh claude          # 只装 Claude Code
#   bash install.sh codebuddy       # 只装 CodeBuddy
#   bash install.sh dsh             # 只装 DeepSeek Harness
#   bash install.sh --uninstall     # 卸载
#   bash install.sh --list          # 列出支持的目标
#
# 优先从同目录的 SKILL.md 安装（可离线）；同目录没有时才从 GitHub 下载。

set -uo pipefail

SKILL_NAME="true-question-alchemy"
REPO_URL="https://github.com/JackieKK22/true-question-alchemy"

targets() {
  case "$1" in
    workbuddy) echo "$HOME/.workbuddy/skills" ;;
    claude)    echo "$HOME/.claude/skills" ;;
    codebuddy) echo "$HOME/.codebuddy/skills" ;;
    dsh)       echo "$HOME/.dsh/skills" ;;
  esac
}

ALL_TARGETS="workbuddy claude codebuddy dsh"

usage() {
  cat <<EOF
真问题炼金术 · 安装脚本

用法：
  bash install.sh [目标]       安装到指定 Agent（不指定则自动探测全部）
  bash install.sh --uninstall  卸载
  bash install.sh --list       列出支持的目标

支持的目标：
  workbuddy   \$HOME/.workbuddy/skills
  claude      \$HOME/.claude/skills
  codebuddy   \$HOME/.codebuddy/skills
  dsh         \$HOME/.dsh/skills

豆包 / Kimi / 元宝等没有固定目录的 Agent：把 SKILL.md 正文粘贴到
「人设 / 系统提示词」里即可（见 README 方式二）。

源码：$REPO_URL
EOF
}

# ---------- 参数处理 ----------
ACTION="install"
TARGET=""
for arg in "$@"; do
  case "$arg" in
    --uninstall) ACTION="uninstall" ;;
    --list|-l)   ACTION="list" ;;
    --help|-h)   usage; exit 0 ;;
    *)           TARGET="$arg" ;;
  esac
done

if [ "$ACTION" = "list" ]; then
  usage
  exit 0
fi

# ---------- 卸载 ----------
if [ "$ACTION" = "uninstall" ]; then
  echo "要卸载的目标："
  for t in $ALL_TARGETS; do
    d="$(targets "$t")/$SKILL_NAME"
    [ -d "$d" ] && echo "  - $t -> $d"
  done
  echo
  read -r -p "确认卸载？输入 yes 继续：" ans
  if [ "$ans" = "yes" ]; then
    for t in $ALL_TARGETS; do
      d="$(targets "$t")/$SKILL_NAME"
      [ -d "$d" ] && rm -rf "$d" && echo "已卸载 $t"
    done
  else
    echo "已取消"
  fi
  exit 0
fi

# ---------- 决定安装目标 ----------
if [ -n "$TARGET" ]; then
  case "$TARGET" in
    workbuddy|claude|codebuddy|dsh) ;;
    *) echo "未知目标：$TARGET"; usage; exit 1 ;;
  esac
  TARGETS="$TARGET"
else
  TARGETS=""
  for t in $ALL_TARGETS; do
    base="$(targets "$t")"
    if [ -d "$base" ] || [ -d "$(dirname "$base")" ]; then
      TARGETS="$TARGETS $t"
    fi
  done
  [ -z "$(echo "$TARGETS" | tr -d ' ')" ] && TARGETS="workbuddy"
fi

# ---------- 准备 SKILL.md ----------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR/SKILL.md"

if [ ! -f "$SRC" ]; then
  echo "本地没有 SKILL.md，尝试从 GitHub 下载..."
  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$REPO_URL/raw/main/SKILL.md" -o "$TMP/SKILL.md" || { echo "下载失败"; exit 1; }
  elif command -v wget >/dev/null 2>&1; then
    wget -q "$REPO_URL/raw/main/SKILL.md" -O "$TMP/SKILL.md" || { echo "下载失败"; exit 1; }
  else
    echo "需要 curl 或 wget"; exit 1
  fi
  SRC="$TMP/SKILL.md"
fi

# ---------- 安装 ----------
for t in $TARGETS; do
  dest="$(targets "$t")/$SKILL_NAME"
  mkdir -p "$dest"
  cp "$SRC" "$dest/SKILL.md"
  echo "已安装到 $t -> $dest"
done

echo
echo "完成。试试这样说："
echo "  「我老是找不到要带的作业」"
echo "  「这题怎么做？直接告诉我答案」（会讲思路，不代做）"
echo
echo "源码：$REPO_URL"
