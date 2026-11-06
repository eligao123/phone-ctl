#!/usr/bin/env bash
# 安装 phone-ctl 到 PATH
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)/phone-ctl"
DEST_DIR="${PREFIX:-/usr/local}/bin"
[ -w "$DEST_DIR" ] || DEST_DIR="$HOME/.local/bin"
mkdir -p "$DEST_DIR"
install -m 755 "$SRC" "$DEST_DIR/phone-ctl"
echo "installed -> $DEST_DIR/phone-ctl"
command -v adb >/dev/null || echo "⚠ 没找到 adb，请先安装 android-tools / platform-tools"
"$DEST_DIR/phone-ctl" size 2>/dev/null || echo "（当前没有连接设备，连上后运行 phone-ctl status）"
