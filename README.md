# speedclicker

A hold-to-click / toggle auto clicker for **Omarchy** (Arch + Hyprland, Wayland).
Inspired by the Windows "Speed AutoClicker"; this is an independent project and shares no code with it.

## Features
- Global activation key: any keyboard key **or mouse button** (default `XButton2`), with an optional second key
- **Hold** or **toggle** activation mode
- Left / middle / right button, optional double click
- Clicks per second (0.01-1000), **unlimited**, and **random** timing
- **Click duty cycle** (how long each click is held vs. the wait between clicks)
- Click limit, start delay
- Per-app filter (only click while chosen Hyprland window classes are focused)
- Optional "block activation button" so the side button doesn't also trigger back/forward

Works on Wayland by reading `/dev/input` (python-evdev) and clicking through a virtual mouse (`/dev/uinput`).

## Install
```bash
git clone https://github.com/YOURNAME/speedclicker.git
cd speedclicker
./install.sh
```
Then **log out and back in** (the `input` group change needs a new session) and launch
*Speed AutoClicker* from the app launcher, or run `speedclicker-gui`.

## Usage
- Pick the activation key with `SELECT...` (`+` adds a second one) and choose hold or toggle.
- `OK` hides the window but keeps the clicker running. Run `speedclicker-gui` again to bring it back. `EXIT` quits.
- Settings are saved to `~/.config/speedclicker/config.json`.

## Notes
- `XButton1` = back, `XButton2` = forward (Windows naming). If your mouse differs, `SELECT...` shows what it detects.
- If you notice mouse stutter, untick *Block activation button in other apps*. That option grabs the mouse and re-emits its events, which can add latency on high-polling-rate mice.
- Per-app filtering and autostart are Hyprland-specific (`hyprctl`, `~/.config/hypr/autostart.conf`).
- If the window tiles instead of floating, press `Super + T` or add a float window rule.
- Status "No access to /dev/input" or "/dev/uinput" means the `input` group change hasn't applied yet.

## License
MIT
