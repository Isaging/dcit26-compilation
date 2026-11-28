# Lab 5 - Navigation (`lab5_navigation`)

Flutter application implementing **Laboratory Exercise #5: Navigation** using only Flutter's built-in `Navigator`, `MaterialPageRoute`, `Scaffold`, and `Drawer` widgets (no third-party navigation packages).
Author: Johann Carl Ronario

## Project Structure

- `lib/main.dart` — App entry point, theme, and root routes.
- `lib/screens/home_screen.dart` — Home screen with Drawer and `OPEN PROFILE` button.
- `lib/screens/profile_screen.dart` — Profile screen reached from Home via `Navigator.push` + `MaterialPageRoute`, with `GO HOME` (`Navigator.pop`) and AppBar back button.
- `lib/screens/about_screen.dart` — About screen on a distinct route (`/about`), keeping the Drawer accessible and providing a `GO HOME` button.
- `lib/widgets/app_drawer.dart` — Reusable Drawer widget with links to `Home` and `About`.

## Navigation / Route Design Choice

This implementation uses **one root `Navigator` with separate routes** (rather than a nested `Navigator`) to keep the structure beginner-friendly and predictable:

1. **Home (`/`):** Root route in `MaterialApp`.
2. **Home ↔ Profile:** Uses `Navigator.push` with `MaterialPageRoute<void>` to push `ProfileScreen` onto the stack, and `Navigator.pop(context)` (via the `GO HOME` button or AppBar back arrow) to return to Home.
3. **Drawer → About (`/about`):** Tapping `About` in the `Drawer` closes the drawer first (`Navigator.pop(context)`) and pushes `AboutScreen` as a distinct route (`RouteSettings(name: '/about')`) when not already on About.
4. **Returning from About:** Both the `GO HOME` button and the `Home` drawer item return cleanly to the root route via `Navigator.popUntil(context, (route) => route.isFirst)`, and the system Back button pops `About` back to `Home` predictably without stacking duplicate screens.
