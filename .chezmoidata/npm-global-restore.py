#!/usr/bin/env python3
from __future__ import annotations

import yaml
import platform
import subprocess
from pathlib import Path
from typing import Iterable
from shutil import which

SCRIPT_DIR = Path(__file__).resolve().parent
PACKAGES_FILE = SCRIPT_DIR / "packages.yaml"

def get_os_packages(path: Path) -> list[str]:
    current_os = platform.system().lower()

    with path.open("r", encoding="utf-8") as fh:
        yaml_data = yaml.safe_load(fh)
        packages: dict[str, list[str]] | None = yaml_data.get('packages')
        if packages is None:
            raise IndexError("packages.yaml is missing 'packages' key")

        os_packages = packages.get(current_os)
        if os_packages is None:
            raise IndexError(f"packages key is missing packages for os: {current_os}")

        return os_packages


def run_npm_install(packages: Iterable[str]) -> int:
    if not packages:
        print("No npm packages listed for this platform.")

        return 0

    npm = which("npm")
    if npm is None:
        print("npm is not installed or not on PATH. Install Node/npm first.")
        return 1

    print("Installing npm global packages:", ", ".join(packages))
    result = subprocess.run([npm, "install", "-g", *packages], check=False)
    return result.returncode


def main() -> int:
    packages = get_os_packages(PACKAGES_FILE)
    return run_npm_install(packages)


if __name__ == "__main__":
    raise SystemExit(main())
