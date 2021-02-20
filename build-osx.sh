pyinstaller -d imports -w \
    --add-data "jellyfin_mpv_shim/systray.png:jellyfin_mpv_shim" \
    --add-data "jellyfin_mpv_shim/mouse.lua:jellyfin_mpv_shim" \
    --add-data "jellyfin_mpv_shim/default_shader_pack:jellyfin_mpv_shim/default_shader_pack" \
    --add-data "jellyfin_mpv_shim/messages:jellyfin_mpv_shim/messages" \
    --add-data "jellyfin_mpv_shim/webclient_view/webclient:jellyfin_mpv_shim/webclient_view/webclient" \
    --add-data "jellyfin_mpv_shim/display_mirror/index.html:jellyfin_mpv_shim/display_mirror" \
    --add-data "jellyfin_mpv_shim/display_mirror/jellyfin.css:jellyfin_mpv_shim/display_mirror" \
    --icon jellyfin.icns \
run-desktop.py
