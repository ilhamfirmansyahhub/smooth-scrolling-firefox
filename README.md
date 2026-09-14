# Firefox Smooth Scrolling

A small Firefox `user.js` preset that makes scrolling feel smoother and more fluid, inspired by the scrolling feel of Zen Browser.

> [!NOTE]
> **Tested on CachyOS (Arch Linux) with the native Firefox package.**
> The preset is intended for Firefox on Linux and Windows. The Linux installer has been tested on CachyOS/Arch Linux.

## Why I Made This

I really liked how smooth scrolling felt in Zen Browser, and started wondering:

**Why does Zen feel this smooth, and can regular Firefox do something similar?**

After trying different Firefox `about:config` preferences, I found a combination that made scrolling feel much smoother than the default.

The annoying part was having to change all those settings manually every time I installed Firefox again.

So I turned the settings into a small preset with installers for Linux and Windows.

The idea is simple:

**Install Firefox → run the installer → restart Firefox → enjoy smoother scrolling.**

No need to open `about:config` and change everything one by one.

## What You Get

This preset is focused on one thing: **making Firefox scrolling smoother while keeping it responsive and lightweight.**

It enables Firefox's smooth scrolling physics and tunes the motion so wheel input feels more continuous and less abrupt.

You get:

- Smoother mouse-wheel scrolling
- Zen-like smooth scrolling physics
- More continuous motion between wheel inputs
- Small, responsive scroll steps
- Native Firefox overscroll behavior
- A lightweight preset focused only on scrolling

This is **not** a full Firefox optimization or privacy config like Betterfox. It only changes scrolling-related preferences.

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

It also falls back to searching for `prefs.js`, so the profile does not need a specific name.

### Windows

The Windows installer checks common Firefox profile locations under:

```text
%APPDATA%\Mozilla\Firefox\Profiles\
%LOCALAPPDATA%\Mozilla\Firefox\Profiles\
```

It detects profiles by looking for `prefs.js`.

> [!NOTE]
> The Linux installer has been tested on CachyOS/Arch Linux. The Windows installer is designed for standard Firefox profile locations, but Windows-specific behavior has not been tested by the project maintainer yet.

## Installation — Linux

Close Firefox completely before installing.

### One-command install

Copy and paste this into your terminal:

```bash
git clone https://github.com/ilhamfirmansyahhub/smooth-scrolling-firefox.git ~/smooth-scrolling-firefox && cd ~/smooth-scrolling-firefox && chmod +x install.sh && ./install.sh
```

Then start Firefox again.

### Already cloned the repository?

```bash
cd ~/smooth-scrolling-firefox && git pull && chmod +x install.sh && ./install.sh
```

The installer automatically detects your Firefox profiles and installs `user.js` into each detected profile. You do not need to know the profile name or edit `about:config` manually.

> [!TIP]
> Firefox on CachyOS may use `~/.config/mozilla/firefox/`. The installer checks this location automatically.

## Installation — Windows

Close Firefox completely before installing.

### One-command PowerShell install

Open PowerShell and copy/paste:

```powershell
git clone https://github.com/ilhamfirmansyahhub/smooth-scrolling-firefox.git "$HOME\smooth-scrolling-firefox"; Set-Location "$HOME\smooth-scrolling-firefox"; Set-ExecutionPolicy -Scope Process Bypass; .\install.ps1
```

Then start Firefox again.

### Already cloned the repository?

```powershell
Set-Location "$HOME\smooth-scrolling-firefox"; git pull; Set-ExecutionPolicy -Scope Process Bypass; .\install.ps1
```

You can also download the repository as a ZIP, extract it, open PowerShell in the extracted folder, and run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\install.ps1
```

## Uninstall

### Linux

Close Firefox, then run:

```bash
cd ~/smooth-scrolling-firefox
./uninstall.sh
```

### Windows

Close Firefox and remove the managed `user.js` from the Firefox profile(s) where the preset was installed.

## Preferences

The current preset uses:

```text
general.smoothScroll = true
general.smoothScroll.mouseWheel = true
general.smoothScroll.msdPhysics.enabled = true
general.smoothScroll.currentVelocityWeighting = 0.15
general.smoothScroll.stopDecelerationWeighting = 0.6
mousewheel.min_line_scroll_amount = 10
general.smoothScroll.mouseWheel.durationMinMS = 80
general.smoothScroll.mouseWheel.durationMaxMS = 300
general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS = 12
general.smoothScroll.msdPhysics.motionBeginSpringConstant = 600
general.smoothScroll.msdPhysics.regularSpringConstant = 650
general.smoothScroll.msdPhysics.slowdownMinDeltaMS = 25
general.smoothScroll.msdPhysics.slowdownSpringConstant = 250
apz.overscroll.enabled = true
```

These values are intended to give Firefox a smoother, more continuous feel without turning the scrolling into a slow or overly floaty animation.

## Reinstall / New Firefox Setup

After reinstalling Firefox, just run the one-command installer for your operating system again. Firefox must have created a profile first.

### Linux

```bash
git clone https://github.com/ilhamfirmansyahhub/smooth-scrolling-firefox.git ~/smooth-scrolling-firefox && cd ~/smooth-scrolling-firefox && chmod +x install.sh && ./install.sh
```

### Windows

```powershell
git clone https://github.com/ilhamfirmansyahhub/smooth-scrolling-firefox.git "$HOME\smooth-scrolling-firefox"; Set-Location "$HOME\smooth-scrolling-firefox"; Set-ExecutionPolicy -Scope Process Bypass; .\install.ps1
```

No manual `about:config` editing is required.

## How It Works

This project is **not a Firefox browser extension**. It uses Firefox's `user.js` mechanism to apply scrolling preferences inside the browser profile.

The installers automatically detect Firefox profiles instead of relying on a specific profile name. Multiple profiles can be configured at once.

The preset is inspired by the **Zen Smooth Scrolling** approach from Betterfox/Smoothfox, but this project intentionally keeps the scope small and focused on scrolling.

## Notes

- Close Firefox before running the installer so the profile is not actively being modified.
- The installers support multiple Firefox profiles and apply the preset to every detected profile.
- Firefox must have created at least one profile before installation.
- Preference names and behavior can vary between Firefox versions. If Mozilla changes or removes a preference, that setting may have no effect on newer versions.
- This preset changes Firefox preferences; it does not modify Firefox binaries or install a browser extension.

## Author

Created and maintained by [ilhamfirmansyahhub](https://github.com/ilhamfirmansyahhub).
