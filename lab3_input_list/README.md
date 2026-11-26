# Lab 3 - Button, Text Input and List (`lab3_input_list`)

Flutter application implementing **Laboratory Exercise #3: Button, Text Input and List** (User input, callbacks, and local state) for DCIT 26 - Application Development and Emerging Technologies.

## Objectives

- Use a Flutter `TextField` to accept a user-entered item.
- Connect a button press callback to an action.
- Use `StatefulWidget` and `setState()` to update an in-memory list and refresh the UI.
- Clear the input after adding an item and ignore blank/whitespace-only input.
- Properly manage and dispose of `TextEditingController`.

## Features

- **Text Field**: Hint placeholder is exactly `Enter Item`.
- **ADD Button**: Trims input, appends non-empty values to `List<String>`, and clears the field.
- **Dynamic List**: Renders styled item rows with green indicator dots underneath the input area.
- **Disposal**: `TextEditingController` is safely cleaned up in `dispose()`.

## Project Structure

- `lib/main.dart` — Complete implementation of `Lab3InputListApp` and `ItemListScreen`.
- `test/widget_test.dart` — Comprehensive widget tests validating interaction flow, input clearing, whitespace trimming, and list updates.

## Running the Project

```bash
flutter pub get
flutter run
```
