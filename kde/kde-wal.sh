#!/bin/bash
#
# kde-wal.sh - build a pywal color scheme from the active KDE Plasma wallpaper
#              and publish it as a Zed theme.
#
# Usage: ./kde-wal.sh [-q]
#   -q   quiet: only warnings and errors are printed

set -uo pipefail

CONFIG_FILE="$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc"
WAL_CACHE="$HOME/.cache/wal"
ZED_SOURCE="$WAL_CACHE/zed-pywal.json"
ZED_DIR="$HOME/.config/zed/themes"
ZED_THEME="$ZED_DIR/pywal.json"

QUIET=0
[[ "${1:-}" == "-q" ]] && QUIET=1

# All output goes to stderr so stdout stays free for pipelines.
if [[ -t 2 ]]; then
    C_INFO='\e[1;34m'; C_OK='\e[1;32m'; C_WARN='\e[1;33m'; C_ERR='\e[1;31m'; C_DIM='\e[2m'; C_OFF='\e[0m'
else
    C_INFO=''; C_OK=''; C_WARN=''; C_ERR=''; C_DIM=''; C_OFF=''
fi

info() { (( QUIET )) || printf '%b==>%b %s\n' "$C_INFO" "$C_OFF" "$*" >&2; }
ok()   { (( QUIET )) || printf '%b==>%b %s\n' "$C_OK"   "$C_OFF" "$*" >&2; }
warn() { printf '%b warning:%b %s\n' "$C_WARN" "$C_OFF" "$*" >&2; }
err()  { printf '%b error:%b %s\n'   "$C_ERR"  "$C_OFF" "$*" >&2; }
dim()  { (( QUIET )) || printf '%b    %s%b\n' "$C_DIM" "$*" "$C_OFF" >&2; }

fail() { err "$*"; exit 1; }

# --- preconditions -----------------------------------------------------------

trap 'err "interrupted"; exit 130' INT TERM

info "KDE wallpaper -> pywal -> Zed theme"

command -v wal >/dev/null 2>&1 || fail "'wal' (pywal) not found in PATH"
[[ -r "$CONFIG_FILE" ]] || fail "Plasma config not readable: $CONFIG_FILE"

dim "config: $CONFIG_FILE"

# --- locate the wallpaper ----------------------------------------------------

# Every configured wallpaper (one per activity/containment), newest first.
mapfile -t WALLPAPER_LINES < <(grep -E '^Image=file://' "$CONFIG_FILE" 2>/dev/null)

if (( ${#WALLPAPER_LINES[@]} == 0 )); then
    fail "no 'Image=file://...' entry in Plasma config (is a wallpaper set?)"
fi
dim "wallpaper entries in config: ${#WALLPAPER_LINES[@]}"

# Resolve one entry to a usable image file: the entry itself, or the largest
# image inside it when the value points at a slideshow directory.
resolve_wallpaper() {
    local path="${1#*file://}"
    path="${path%\"}"

    if [[ -f "$path" && -r "$path" ]]; then
        printf '%s' "$path"
        return 0
    fi

    if [[ -d "$path" ]]; then
        info "slideshow directory, picking its largest image"
        dim "dir: $path"
        local found count
        found=$(find "$path" -type f \
            \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.bmp' -o -iname '*.webp' \) \
            -printf '%s\t%p\n' 2>/dev/null | sort -rn | head -1 | cut -f2-)
        count=$(find "$path" -type f \
            \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.bmp' -o -iname '*.webp' \) \
            2>/dev/null | wc -l)
        if [[ -n "$found" ]]; then
            dim "candidates: $count"
            printf '%s' "$found"
            return 0
        fi
        warn "no image files inside $path"
        return 1
    fi

    warn "wallpaper path missing or unreadable: $path"
    return 1
}

WALLPAPER=''
USED_ENTRY=0
for line in "${WALLPAPER_LINES[@]}"; do
    (( USED_ENTRY++ ))
    if WALLPAPER=$(resolve_wallpaper "$line") && [[ -n "$WALLPAPER" ]]; then
        (( ${#WALLPAPER_LINES[@]} > 1 )) && dim "using entry $USED_ENTRY of ${#WALLPAPER_LINES[@]}"
        break
    fi
    WALLPAPER=''
done

[[ -n "$WALLPAPER" ]] || fail "no usable wallpaper image found in Plasma config"

WALL_SIZE=$(du -h "$WALLPAPER" 2>/dev/null | cut -f1)
WALL_DIMS=$(identify -format '%wx%h' "$WALLPAPER" 2>/dev/null || echo '?')
info "wallpaper: $WALLPAPER"
dim "size: $WALL_SIZE, dimensions: $WALL_DIMS"

# --- generate the palette ----------------------------------------------------

info "extracting colors with pywal"
START=$(date +%s%N)

if ! WAL_OUTPUT=$(wal -q -i "$WALLPAPER" 2>&1); then
    [[ -n "$WAL_OUTPUT" ]] && dim "$WAL_OUTPUT"
    fail "wal failed for $WALLPAPER"
fi
# pywal leaks ImageMagick's deprecation notice; it is not our problem.
WAL_OUTPUT=$(grep -v -e 'convert command is deprecated' <<<"$WAL_OUTPUT" | grep -v '^$')
[[ -n "$WAL_OUTPUT" ]] && dim "$WAL_OUTPUT"

ELAPSED=$(( ( $(date +%s%N) - START ) / 1000000 ))
[[ -f "$WAL_CACHE/colors.json" ]] || fail "pywal produced no $WAL_CACHE/colors.json"
ok "palette written to $WAL_CACHE ($ELAPSED ms)"
dim "$(jq -r '"background #\(.special.background|sub("#";"")) / foreground #\(.special.foreground|sub("#";"")), \(.colors|length) colors"' "$WAL_CACHE/colors.json" 2>/dev/null || echo 'palette details unavailable (jq missing?)')"

# --- publish to Zed ----------------------------------------------------------

info "publishing Zed theme"
mkdir -p "$ZED_DIR" || fail "cannot create $ZED_DIR"

if [[ ! -f "$ZED_SOURCE" ]]; then
    warn "$ZED_SOURCE missing, skipping Zed theme update"
    dim "hint: install the pywal Zed template (pywal16/zed template)"
else
    if cp "$ZED_SOURCE" "$ZED_THEME"; then
        ok "Zed theme: $ZED_THEME ($(du -h "$ZED_THEME" | cut -f1))"
    else
        fail "cannot copy $ZED_SOURCE -> $ZED_THEME"
    fi
fi

ok "done"
exit 0
