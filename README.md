# Firefox Smooth Scrolling

A simple `user.js` preset for Firefox that enables smoother, more fluid scrolling with a Zen Browser-like feel.

> [!NOTE]
> **Tested on CachyOS (Arch Linux) with the native Firefox package.**
> This project is intended for Linux Firefox installations and has been tested on an Arch-based system. Other Linux distributions may use different Firefox profile locations, but the installer includes several common locations and a `prefs.js` fallback.

## What You Get

This preset applies the following Firefox preferences:

- Smooth mouse-wheel scrolling
- Longer and more fluid scroll animation
- Smaller scroll steps
- Fling/momentum scrolling
- Overscroll support
- Adjusted fling friction for a more natural momentum effect

The goal is a smoother scrolling experience without having to open `about:config` and change each preference manually.

## Compatibility

### Tested

- **CachyOS / Arch Linux**
- Native Firefox package from the Arch Linux repositories
- Standard Firefox profiles created automatically by Firefox

### Profile locations supported by the installer

The installer checks common Linux locations, including:

```text
~/.config/mozilla/firefox/
~/.mozilla/firefox/
~/.var/app/org.mozilla.firefox/.config/mozilla/firefox/
~/.var/app/org.mozilla.firefox/.mozilla/firefox/
```

It also falls back to searching for `prefs.js`, so the profile does not need to use a specific profile name.

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

## How It Works

The project does not use a Firefox browser extension. Instead, it installs a `user.js` file into the Firefox profile. Firefox reads these preferences when starting the browser.

The installer is designed to handle multiple profiles automatically. This means a normal Firefox installation with more than one profile can receive the preset without manually selecting a profile.

## Notes

- Firefox must have created at least one profile before the installer can install the preset.
- Close Firefox before running the installer so the profile is not being actively modified.
- The installer supports multiple Firefox profiles and installs the preset into every detected profile.
- This project is intended for Linux Firefox installations.
- Preference names and behavior can vary between Firefox versions. If Mozilla changes or removes a preference, that setting may have no effect on newer versions.

## Author

Created and maintained by [ilhamfirmansyahhub](https://github.com/ilhamfirmansyahhub).
