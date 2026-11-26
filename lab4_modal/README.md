# Lab 4 - Modal Dialog (`lab4_modal`)

Flutter application implementing **Laboratory Exercise #4: Create an App Using Basic Components** (Images, dialogs, scrolling, and styling).

## Project Structure

- `lib/main.dart` — Initial screen with a centered `OPEN MODAL` button that opens `SampleModal` via `showDialog<void>`.
- `lib/widgets/sample_modal.dart` — Reusable modal dialog displaying `assets/images/sample_modal_image.png` at the top, multiple paragraphs inside a bounded `SingleChildScrollView` + `Scrollbar`, and a `CLOSE` button at the bottom.
- `assets/images/sample_modal_image.png` — Registered in `pubspec.yaml` under `flutter.assets`. Replace this placeholder image with the supplied `Assets/sample_modal_image.png` from your course package if needed.

## Running the Project

```bash
flutter pub get
flutter run
```
