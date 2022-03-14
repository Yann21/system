#!/usr/bin/env python
"""
Script is modify file structure resilient.
"""

import pathlib
import yaml
import os
import click
import shutil

HOME = os.environ.get("HOME")
with open(f"{HOME}/system/scripts/dynamic_resolve.python/directory_structure.yml", "r") as stream:
    tree = yaml.safe_load(stream)

# Only captures terminal files in tree structure
def path_to_file(tree, sought_file):
    def tail_recurse(tree, sought_file, acc):
        for name, dir in tree.items():
            if not dir:
                print("empty dir")
            else:
                acc2 = list(acc)
                acc2.append(name)
                for file in dir:
                    if isinstance(file, dict):
                        res = tail_recurse(file, sought_file, acc2)
                        if res:
                            return res
                    else:
                        if file == sought_file:
                            acc2.append(sought_file)
                            return acc2

    return tail_recurse(tree, sought_file, [])

def latest_modified_file(folder):
    files = pathlib.Path(folder).iterdir()
    return max(files, key=lambda file: file.stat().st_mtime)

def latest_screenshot():
    screen_path = "/" + "/".join(path_to_file(tree, "screenshots"))
    return latest_modified_file(screen_path)

def copy_screenshot_here(name):
    cwd = os.getcwd()
    shutil.copy(latest_screenshot(), f"{cwd}/{name}.png")


@click.command()
@click.option("-m", "--mute", is_flag=True, help="Display the latest screenshot without copying it.")
@click.argument("filename", required=False)

def main(filename, mute):
    if not mute:
        copy_screenshot_here(filename)
    os.system(f"pqiv {latest_screenshot()}")

if __name__ == "__main__":
    main()
