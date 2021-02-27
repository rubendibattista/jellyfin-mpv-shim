#!/usr/bin/env python3

# Newer revisions of python-mpv require mpv-1.dll in the PATH.
import os
import sys
import multiprocessing

import logging
from logging.handlers import RotatingFileHandler

from jellyfin_mpv_shim.conffile import get as get_config_resource
from jellyfin_mpv_shim.constants import APP_NAME

if sys.platform == "darwin" and getattr(sys, "frozen", False):
    # On MacOS I add a debug.log because the App bundle does not log stdout. So
    # it's very hard to debug it.
    # TODO: Add this only for a pyinstaller debug build

    # Detect if bundled via pyinstaller.
    # From: https://stackoverflow.com/questions/404744/
    logger = logging.getLogger()
    logger.setLevel(logging.DEBUG)
    handler = RotatingFileHandler(
        get_config_resource(APP_NAME, "debug.log", True),
        maxBytes=2000,
        backupCount=1,
    )
    logger.addHandler(handler)

if sys.platform.startswith("win32") or sys.platform.startswith("cygwin"):
    # Detect if bundled via pyinstaller.
    # From: https://stackoverflow.com/questions/404744/
    if getattr(sys, "frozen", False):
        application_path = getattr(sys, "_MEIPASS")
    else:
        application_path = os.path.dirname(os.path.abspath(__file__))
    os.environ["PATH"] = application_path + os.pathsep + os.environ["PATH"]

from jellyfin_mpv_shim.mpv_shim import main_desktop

if __name__ == "__main__":
    # https://stackoverflow.com/questions/24944558/pyinstaller-built-windows-exe-fails-with-multiprocessing
    multiprocessing.freeze_support()

    main_desktop(cef=True)
