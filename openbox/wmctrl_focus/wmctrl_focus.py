import os
import re
import subprocess

import click


def get_active_desktop():
    desktops = subprocess.check_output("wmctrl -d", shell=True).decode("utf-8")
    for desktop in desktops.split("\n"):
        fields = [x.strip() for x in re.split(r"[\s]+", desktop.strip())]
        if len(fields) > 0 and fields[1] == "*":
            return fields[0]
    raise Exception("Could not get active desktop")


def get_windows_of_desktop(desktop):
    result = []
    windows = subprocess.check_output("wmctrl -l", shell=True).decode("utf-8")
    for window in windows.split("\n"):
        fields = [x.strip() for x in re.split(r"[\s]+", window.strip())]
        if len(fields) > 1 and fields[1] == str(desktop):
            result.append({
                "window_id": fields[0],
                "window_title": " ".join(fields[3:]),
            })
    return result


@click.command()
@click.option("--window", default=1920, help="0-based index of the window")
def main(window):
    """Focus a window on the active desktop."""
    active_desktop = get_active_desktop()
    windows = get_windows_of_desktop(active_desktop)
    window_id = windows[window]["window_id"]
    subprocess.check_output(f"wmctrl -i -a '{window_id}'", shell=True)


if __name__ == "__main__":
    main()
