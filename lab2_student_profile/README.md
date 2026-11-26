# Lab 2 - Student Profile (`lab2_student_profile`)

Flutter application implementing **Laboratory Activity #2: Student Profile** (Composing a profile from Flutter widgets) for DCIT 26 - Application Development and Emerging Technologies.

## Objectives

- Compose a readable screen from basic Flutter widgets.
- Use `Text`, `Column`, `Row`, `Card`, and spacing widgets to organize related information.
- Apply clean styling while keeping all required profile fields visible on narrow mobile viewports.

## Required Fields Displayed

1. **Name**: Alvarez, Joyce E.
2. **Age**: 20
3. **Course/Year/Section**: BS Computer Science 3-1
4. **About me**: Personal and academic introduction
5. **Achievements**: Academic achievements and milestones
6. **Skills**: Programming languages and competencies

## Project Structure

- `lib/main.dart` — Complete single-screen application with `StudentProfileScreen`, top avatar card, and card listing all 6 required fields inside a `SingleChildScrollView`.
- `test/widget_test.dart` — Automated widget tests verifying all 6 required fields and scrollable container.

## Running the Project

```bash
flutter pub get
flutter run
```
