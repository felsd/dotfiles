import re
import subprocess

import click


def get_active_window(screen_w):
    active_window = {}
    active_window_info = subprocess.check_output(
        "xwininfo -id $(xdotool getactivewindow)",
        shell=True,
    ).decode("utf-8").split("\n")
    for line in active_window_info:
        line = line.strip()
        if "Window id" in line:
            active_window["id"] = re.search(r"0x[a-z0-9]+", line)[0]
        elif "Absolute upper-left X" in line:
            active_window["x"] = int(line.split(":")[1].strip())
        elif "Absolute upper-left Y" in line:
            active_window["y"] = int(line.split(":")[1].strip())
        elif "Width" in line:
            active_window["w"] = int(line.split(":")[1].strip())
        elif "Height" in line:
            active_window["h"] = int(line.split(":")[1].strip())
    active_window["screen"] = 1 if active_window["x"] >= screen_w else 0
    x = active_window["x"]
    if x >= screen_w:
        x = x - screen_w
    active_window["orientation"] = "left" if x < screen_w / 2 else "right"
    return active_window


@click.command()
@click.option("--screen_w", default=1920, help="Screen width (default 1920)")
@click.option("--screen_h", default=1080, help="Screen height (default 1080)")
@click.option("--tbar_h", default=26, help="Taskbar height (default 26)")
@click.option("--tbar_screen", default=0, help="Screen with taskbar (0 based, default 0)")
def main(screen_w, screen_h, tbar_h, tbar_screen):
    """tile_man can be used as a callback when tiling windows with Openbox,
    to center terminals vertically. Terminals can not use 100% of the
    available height because they can only scale by increasing their
    rows. This script adds a uniform padding above and below the window."""
    screen_h = screen_h - 2
    w = get_active_window(screen_w)
    av_height = screen_h - tbar_h if w["screen"] == tbar_screen else screen_h
    if w["h"] < av_height:
        diff = av_height - w["h"]
        offset = int(diff / 2)
        y = w["y"] + offset
        # x = w["x"] + offset if w["orientation"] == "left" else w["x"] - offset
        subprocess.call(f"wmctrl -r :ACTIVE: -e 0,-1,{y},-1,-1", shell=True)


if __name__ == "__main__":
    main()
