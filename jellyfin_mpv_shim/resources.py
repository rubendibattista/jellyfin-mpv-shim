import os.path
import sys
from importlib.resources import path as get_path


def get_resource(*path):
    # Detect if bundled via pyinstaller.
    # From: https://stackoverflow.com/questions/404744/
    application_path = get_application_path()
    return os.path.join(application_path, *path)


def get_application_path():
    try:
        if sys.platform == "darwin" and sys.frozen:
            from AppKit import NSBundle

            return NSBundle.mainBundle().pathForResource_ofType_(
                "jellyfin_mpv_shim", None
            )
    except AttributeError:
        with get_path("jellyfin_mpv_shim", "__init__.py") as p:
            return os.path.dirname(p)
