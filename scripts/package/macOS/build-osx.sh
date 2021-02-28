#!/usr/bin/env bash

if [[ -z $ROOT_DIR ]]; then 
    echo "ROOT_DIR undefined!"
    exit 1
fi

# Download mpv and extract
if [[ ! -d ./mpv.app ]]; then 
    curl -L  https://laboratory.stolendata.net/~djinn/mpv_osx/mpv-latest.tar.gz | tar -xvf - -C .
fi

pyinstaller -w --noconfirm -n "Jellyfin MPV Shim" \
    --add-data "mpv.app/Contents/MacOS:jellyfin_mpv_shim/mpv" \
    --add-data "$ROOT_DIR/jellyfin_mpv_shim/systray.png:jellyfin_mpv_shim" \
    --add-data "$ROOT_DIR/jellyfin_mpv_shim/mouse.lua:jellyfin_mpv_shim" \
    --add-data "$ROOT_DIR/jellyfin_mpv_shim/default_shader_pack:jellyfin_mpv_shim/default_shader_pack" \
    --add-data "$ROOT_DIR/jellyfin_mpv_shim/messages:jellyfin_mpv_shim/messages" \
    --add-data "$ROOT_DIR/jellyfin_mpv_shim/webclient_view/webclient:jellyfin_mpv_shim/webclient_view/webclient" \
    --add-data "$ROOT_DIR/jellyfin_mpv_shim/display_mirror/index.html:jellyfin_mpv_shim/display_mirror" \
    --add-data "$ROOT_DIR/jellyfin_mpv_shim/display_mirror/jellyfin.css:jellyfin_mpv_shim/display_mirror" \
    --icon jellyfin.icns \
    $ROOT_DIR/run-desktop.py
