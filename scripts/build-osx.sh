#!/usr/bin/env bash

# Download mpv and extract
if [[ ! -d ./mpv.app ]]; then 
    curl -L  https://laboratory.stolendata.net/~djinn/mpv_osx/mpv-latest.tar.gz | tar -xvf - -C .
fi

pyinstaller -w --noconfirm -n "Jellyfin MPV Shim" \
    --add-data "mpv.app/Contents/MacOS:jellyfin_mpv_shim/mpv" \
    --add-data "../jellyfin_mpv_shim/systray.png:jellyfin_mpv_shim" \
    --add-data "../jellyfin_mpv_shim/mouse.lua:jellyfin_mpv_shim" \
    --add-data "../jellyfin_mpv_shim/default_shader_pack:jellyfin_mpv_shim/default_shader_pack" \
    --add-data "../jellyfin_mpv_shim/messages:jellyfin_mpv_shim/messages" \
    --add-data "../jellyfin_mpv_shim/webclient_view/webclient:jellyfin_mpv_shim/webclient_view/webclient" \
    --add-data "../jellyfin_mpv_shim/display_mirror/index.html:jellyfin_mpv_shim/display_mirror" \
    --add-data "../jellyfin_mpv_shim/display_mirror/jellyfin.css:jellyfin_mpv_shim/display_mirror" \
    --icon ../jellyfin.icns \
    ../run-desktop.py
