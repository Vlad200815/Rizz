<div align="center">

<img src="assets/images/app_icon.png" alt="Rizz App Logo" width="120"/>

# 💘 Rizz

### *A playful one-screen Flutter app that asks one special person on a date — and won't take "No" for an answer.*

> 🎯 **Pet project** — a personal, just-for-fun app built to ask a girl on a date, with a runaway "No" button and a full date planner that fires off the plan over Telegram and Google Calendar.

<br/>

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=apple&logoColor=white)

<br/>

![Provider](https://img.shields.io/badge/State-Provider-7C4DFF?style=flat-square)
![Architecture](https://img.shields.io/badge/Architecture-Feature--based-1E0A16?style=flat-square)
![Localization](https://img.shields.io/badge/i18n-EN%20%7C%20UK-E8607A?style=flat-square)
![Offline](https://img.shields.io/badge/Backend-None%20(offline)-4DB858?style=flat-square)
![Codegen](https://img.shields.io/badge/Codegen-flutter__gen%20%2B%20build__runner-0175C2?style=flat-square)

</div>

---

## 📖 Overview

**Rizz** is a small, deliberately personal Flutter app with exactly one job: ask one specific person on a date in the most charming, hard-to-refuse way possible. The first screen is the "pop the question" moment — a pulsing heart, a rotating set of cheeky one-liners, a big inviting **Yes** button, and a **No** button that physically dodges your finger and runs to a new random spot every time you try to tap it. Say "Yes" and you move into a full date planner.

Architecturally it's intentionally lean and **fully offline — there is no backend, no Firebase, no analytics, and no network API of its own.** Instead of a server, the app integrates with the outside world purely through deep links: the finished date plan is handed off to **Telegram** (via a `t.me` pre-filled message) and to **Google Calendar** (via a calendar `TEMPLATE` URL) using `url_launcher`. State is held in two `ChangeNotifier` view-models wired up with `provider`, and the UI is split into self-contained feature folders.

End-to-end ownership is on display in the small things: a feature-based folder layout, a generated design system (colors, fonts and assets are code-generated from source files via `flutter_gen`), full **English / Ukrainian** localization through `easy_localization` with type-safe generated keys, a shared `Formatters` utility so every screen and the outgoing Telegram message render dates identically, and unit tests covering the formatters and both notifiers.

---

## ✨ Features

<details>
<summary><b>💌 The "Will you go on a date with me?" screen</b></summary>

- A pulsing ❤️ hero animation driven by a looping `TweenSequence` (gentle double-beat, then a rest) with a soft rose glow.
- An animated particle background — 18 rose-colored particles continuously rising and fading, each on its own randomized duration and phase so they never move in sync.
- A prominent gradient **Yes** button that navigates straight to the date planner.
- A **No** button that refuses to be pressed: every tap increments a counter, teleports the button to a new random on-screen position, and swaps in the next cheeky line.
- Six rotating, localized "rizz" phrases that cycle as the No button is chased around the screen.
</details>

<details>
<summary><b>🗓️ Date planner</b></summary>

- Pick a **date** and **time** through native pickers, with a live preview of the chosen values.
- Enter a **place** for the date as free text.
- Choose a **vibe** from four options — Romantic, Casual, Adventure, or Surprise me — backed by a typed `DateVibe` enum.
- Add a free-text **note / love message**.
- A **Send** button stays disabled until a date, time, and place are all set (`canSend`), preventing half-filled plans.
</details>

<details>
<summary><b>📤 Telegram hand-off</b></summary>

- Builds a neatly emoji-formatted summary of the plan (date, time, place, vibe, note).
- Opens a chat with the configured Telegram username and pre-fills the message via a `https://t.me/<user>?text=...` deep link.
- No bot, no API token, no server round-trip — it simply launches the Telegram app with the message ready to send.
</details>

<details>
<summary><b>📅 Google Calendar hand-off</b></summary>

- Turns the chosen date and time into a 2-hour event using a Google Calendar `action=TEMPLATE` render URL.
- Pre-fills the event title, location (the place), and details (place + note) so the date lands in your calendar with one tap.
- Falls back to a "to be determined" label for the place when none was entered.
</details>

<details>
<summary><b>🌍 Localization & theming</b></summary>

- Full **English** and **Ukrainian** translations via `easy_localization`, with type-safe `LocaleKeys` generated from the translation files.
- A dark, romance-themed design split into two palettes — deep **rose** for the request screen and deep **purple** for the planner — defined in `colors.xml` and generated into Dart by `flutter_gen`.
- Custom **Playfair Display** typography bundled as a font family.
- Portrait orientation locked on startup for a consistent layout.
</details>

---

## 🏗️ Architecture

```text
lib/
├── main.dart                     # Entry: localization init, providers, orientation lock
├── app.dart                      # MaterialApp, theme, routes
├── config.dart                   # Routes, Telegram username, locale constants
│
├── features/
│   ├── request/                  # "Ask on a date" screen
│   │   ├── date_request_page.dart
│   │   ├── no_button_notifier.dart   # Runaway-button + funny-message state
│   │   └── widgets/                  # heart, hearts/particles bg, yes/no buttons, question
│   │
│   └── planner/                  # Date planning screen
│       ├── date_planner_page.dart
│       ├── planner_notifier.dart     # Date/time/place/vibe/note state + send logic
│       ├── date_vibe.dart            # DateVibe enum
│       └── widgets/                  # date-time, place, vibe, note cards, calendar/send buttons
│
├── services/
│   ├── telegram_service.dart     # t.me deep-link hand-off
│   └── calendar_service.dart     # Google Calendar TEMPLATE URL hand-off
│
├── utils/
│   └── formatters.dart           # Shared date/time formatting
│
├── resource/
│   └── app_theme.dart            # Dark ThemeData + color scheme
│
├── gen/                          # flutter_gen output (assets, colors, fonts)
└── generated/                    # easy_localization output (locale keys + loader)
```

**Data flow** (planner → outside world):

```text
User input (cards)
   ↓
PlannerNotifier  (ChangeNotifier — holds date, time, place, vibe, note)
   ↓
buildTelegramMessage() / addToCalendar()
   ↓
TelegramService → t.me deep link        CalendarService → Google Calendar URL
   ↓                                          ↓
url_launcher (externalApplication) → Telegram app / Calendar
```

| Concern | Pattern |
|---|---|
| State management | `ChangeNotifier` view-models (`NoButtonNotifier`, `PlannerNotifier`) exposed via `MultiProvider`; widgets read with `context.watch` |
| UI organization | Feature-first folders (`request`, `planner`), each with its own page + widgets |
| External integration | Stateless `*Service` classes that build URIs and launch them via `url_launcher` — no backend |
| Design system | Colors, fonts, and assets generated from source files by `flutter_gen` |
| Localization | `easy_localization` + generated type-safe `LocaleKeys` |

---

## 🛠️ Tech Stack

### Core
| Library | Purpose |
|---|---|
| `flutter` (SDK `^3.12.0`) | UI framework and rendering |
| `cupertino_icons` `^1.0.8` | iOS-style icon set |

### State Management
| Library | Purpose |
|---|---|
| `provider` `^6.1.5+1` | Dependency injection and `ChangeNotifier` wiring for the two view-models |

### Integration / Intents
| Library | Purpose |
|---|---|
| `url_launcher` `^6.3.2` | Launches Telegram `t.me` deep links and Google Calendar template URLs |

### UI & Fonts
| Library | Purpose |
|---|---|
| `google_fonts` `^6.2.1` | Web/Google font support alongside the bundled Playfair Display family |

### Localization
| Library | Purpose |
|---|---|
| `easy_localization` `^3.0.8` | Runtime translation loading and locale switching (EN / UK) |
| `intl` `^0.20.2` | Date/time formatting in `Formatters` |

### Build Tools & Codegen
| Library | Purpose |
|---|---|
| `flutter_gen_runner` `^5.11.0` | Generates type-safe assets, colors (`colors.xml`), and fonts into `lib/gen/` |
| `build_runner` `^2.4.13` | Runs the code generators |
| `flutter_launcher_icons` `^0.14.4` | Generates Android/iOS launcher icons from `app_icon.png` |
| `flutter_lints` `^6.0.0` | Recommended lint rules |
| `flutter_test` (SDK) | Unit testing |

---

## 🚀 Getting Started

**Prerequisites**

- Flutter SDK with Dart `^3.12.0` (Flutter 3.24+ recommended)
- Android Studio / Xcode for device or emulator targets
- A connected device or running emulator/simulator

**Quick setup**

```bash
# 1. Install dependencies
flutter pub get

# 2. Generate localization keys (easy_localization)
flutter pub run easy_localization:generate -S assets/translations
flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart

# 3. Generate assets / colors / fonts (flutter_gen) and launcher icons
dart run build_runner build --delete-conflicting-outputs
dart run flutter_launcher_icons

# 4. Run
flutter run
```

**Full clean build**

```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

> ⚙️ Before shipping, set your own Telegram handle in `lib/config.dart` (`telegramUsername`).

---

## 📦 Build

### Android

```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle for Play Store
flutter build appbundle --release
```

### iOS

```bash
# Build for a connected device / simulator
flutter build ios --release

# Then archive & distribute via Xcode
open ios/Runner.xcworkspace
```

---

## 🧪 Code Quality

```bash
# Static analysis (uses flutter_lints)
flutter analyze

# Run the unit tests (formatters + both notifiers)
flutter test
```

Tests live in `test/`:

- `formatters_test.dart` — date/time formatting
- `no_button_notifier_test.dart` — runaway button + message rotation
- `planner_notifier_test.dart` — planner state and `canSend` gating

---

## 📄 License

Released under the **MIT License** — see [`LICENSE`](LICENSE). © 2026 Vlad Semeniuk.

---

## 👨‍💻 Author

<div align="center">

**Vlad Semeniuk**

*Flutter developer — built this one with ❤️ (and a little chaos in the No button)*

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Vlad200815)

</div>

---

<div align="center">Made with ❤️ using <b>Flutter</b></div>
