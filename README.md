# Firefox Smooth Scrolling

A simple `user.js` preset for Firefox that enables smoother, more fluid scrolling with a Zen Browser-like feel.

The included installer automatically detects Firefox profiles on Linux, including the standard profile location used by this setup:

```text
~/.config/mozilla/firefox/
```

It also supports common Mozilla and Flatpak Firefox profile locations.

## What You Get

This preset applies the following Firefox preferences:

- Smooth mouse-wheel scrolling
- Longer and more fluid scroll animation
- Smaller scroll steps
- Fling/momentum scrolling
- Overscroll support
- Adjusted fling friction for a more natural momentum effect

The goal is a smoother scrolling experience without having to open `about:config` and change each preference manually.

## Installation

Close Firefox completely before installing the preset.

### 1. Clone the repository

```bash
git clone https://github.com/ilhamfirmansyahhub/smooth-scrolling-firefox.git
cd smooth-scrolling-firefox
```

### 2. Make the scripts executable

```bash
chmod +x install.sh uninstall.sh
```

### 3. Install

```bash
./install.sh
```

The installer automatically detects Firefox profiles and creates/updates `user.js` in each detected profile.

You do **not** need to know the profile name or edit `about:config` manually.

### 4. Restart Firefox

Start Firefox again after the installer finishes so Firefox loads the preferences.

## Uninstall

Close Firefox, then run:

```bash
./uninstall.sh
```

The uninstaller removes only the `user.js` files managed by this project. Restart Firefox afterward.

## Preferences

The current preset uses:

```text
general.smoothScroll = true
general.smoothScroll.mouseWheel = true
general.smoothScroll.mouseWheel.durationMaxMS = 400
general.smoothScroll.mouseWheel.durationMinMS = 150
mousewheel.min_line_scroll_amount = 15
apz.fling.enabled = true
apz.overscroll.enabled = true
layout.css.scroll-behavior.spring-constant = 0.5
apz.fling_friction = 0.002
apz.fling_stopped_threshold = 0.0
```

## Reinstall / New Firefox Setup

After reinstalling Firefox, simply clone the repository again and run the installer:

```bash
git clone https://github.com/ilhamfirmansyahhub/smooth-scrolling-firefox.git
cd smooth-scrolling-firefox
chmod +x install.sh
./install.sh
```

No manual `about:config` editing is required.

## Notes

- Firefox must have created at least one profile before the installer can install the preset.
- The installer supports multiple Firefox profiles and installs the preset into every detected profile.
- This project is intended for Linux Firefox installations.

## Author

Created and maintained by [ilhamfirmansyahhub](https://github.com/ilhamfirmansyahhub).
