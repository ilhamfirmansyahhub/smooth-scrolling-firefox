# Firefox Smooth Scrolling

A simple `user.js` preset for Firefox that makes scrolling feel smoother and more fluid, with a feel inspired by Zen Browser.

> [!NOTE]
> **Tested on CachyOS (Arch Linux) with the native Firefox package.**
> This project was originally made for my own Linux setup, but the `user.js` itself also works on Windows. Native installers are included for both platforms.

## Why I Made This

I really liked how smooth scrolling felt in Zen Browser. It made me wonder: **why does Zen feel this smooth, and can regular Firefox do the same thing?**

After trying different Firefox `about:config` preferences, I found a combination that made scrolling feel much smoother than the default settings.

The annoying part was having to change all those preferences manually every time I installed Firefox again.

So I turned the settings into a small preset with an installer.

The idea is simple:

**Install Firefox → run the installer → restart Firefox → enjoy smoother scrolling.**

No need to open `about:config` and change every preference one by one.

## What You Get

This preset applies the following Firefox preferences:

- Smooth mouse-wheel scrolling
- Longer and more fluid scroll animation
- Smaller scroll steps
- Fling/momentum scrolling
- Overscroll support
- Adjusted fling friction for a more natural momentum effect

The goal is not to copy Zen Browser exactly, but to make regular Firefox feel noticeably smoother without manually configuring everything.

## Compatibility

### Tested

- **CachyOS / Arch Linux**
- Native Firefox package from the Arch Linux repositories
- Standard Firefox profiles created automatically by Firefox

### Linux

The Linux installer checks common Firefox profile locations, including:

```text
~/.config/mozilla/firefox/
~/.mozilla/firefox/
~/.var/app/org.mozilla.firefox/.config/mozilla/firefox/
~/.var/app/org.mozilla.firefox/.mozilla/firefox/
```

It also falls back to searching for `prefs.js`, so the profile does not need to use a specific profile name.

### Windows

The Windows installer checks the standard Firefox profile locations under:

```text
%APPDATA%\Mozilla\Firefox\Profiles\
%LOCALAPPDATA%\Mozilla\Firefox\Profiles\
```

It detects profiles by looking for `prefs.js`, so you do not need to know the profile name.

> [!NOTE]
> The preset is intended for Firefox on Linux and Windows. The included native installers are currently tested on CachyOS/Arch Linux and designed for standard Windows Firefox profile locations. Other Firefox packaging methods may use different profile paths.

## Installation — Linux

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

The installer automatically detects Firefox profiles and creates/updates `user.js` in every detected profile.

You do **not** need to know the profile name or edit `about:config` manually.

### 4. Restart Firefox

Start Firefox again after the installer finishes so Firefox loads the preferences.

## Installation — Windows

Close Firefox completely before installing the preset.

### Option 1: PowerShell + Git

Clone the repository:

```powershell
git clone https://github.com/ilhamfirmansyahhub/smooth-scrolling-firefox.git
cd smooth-scrolling-firefox
```

Then run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\install.ps1
```

The script automatically searches your Firefox profiles and installs `user.js` into every detected profile.

You do **not** need to edit `about:config` manually.

### Option 2: Download as ZIP

Download the repository as a ZIP from GitHub, extract it, open PowerShell in the extracted folder, and run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\install.ps1
```

### After installation

Restart Firefox after the script finishes.

## Uninstall

### Linux

Close Firefox, then run:

```bash
./uninstall.sh
```

The uninstaller removes only the `user.js` files managed by this project. Restart Firefox afterward.

### Windows

Close Firefox and remove the `user.js` file from the Firefox profile(s) where the preset was installed.

Your normal Firefox settings are not modified by the preset itself; only the `user.js` file created by this project needs to be removed.

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

After reinstalling Firefox, just clone the repository again and run the installer for your operating system.

### Linux

```bash
git clone https://github.com/ilhamfirmansyahhub/smooth-scrolling-firefox.git
cd smooth-scrolling-firefox
chmod +x install.sh
./install.sh
```

### Windows

```powershell
git clone https://github.com/ilhamfirmansyahhub/smooth-scrolling-firefox.git
cd smooth-scrolling-firefox
Set-ExecutionPolicy -Scope Process Bypass
.\install.ps1
```

No manual `about:config` editing is required.

## How It Works

This project is **not a Firefox browser extension**. It uses Firefox's `user.js` mechanism to apply the preferences in the browser profile.

The installers automatically detect Firefox profiles instead of relying on a specific profile name. Multiple profiles can be configured at once.

## Notes

- Firefox must have created at least one profile before the installer can install the preset.
- Close Firefox before running the installer so the profile is not actively being modified.
- The installer supports multiple Firefox profiles and installs the preset into every detected profile.
- Preference names and behavior can vary between Firefox versions. If Mozilla changes or removes a preference, that setting may have no effect on newer versions.
- This preset changes Firefox preferences; it does not modify Firefox binaries or install a browser extension.

## Author

Created and maintained by [ilhamfirmansyahhub](https://github.com/ilhamfirmansyahhub).
