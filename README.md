# Siksha360 - Fee Payment Flow

Siksha360 Fee Payment Flow is a Clean Architecture Flutter application designed for an assignment checkout flow. It allows parents to view pending education fees and complete a simulated, mock fee payment flow utilizing Riverpod for state management and GoRouter for navigation.

---

## 🎨 UI/UX Reasoning
*Placeholder for UI/UX reasoning, design decisions, typography, color palettes, and user flows.*

- **Design Choices**: _[Describe the chosen design aesthetics, custom cards, styling choice, etc.]_
- **Navigation Flow**: _[Describe how navigation behaves between the screens.]_
- **State Handling & Feedback**: _[Describe validations and state feedback (e.g. error, success, loading state behavior).]_

---

## 🛠️ Tech Stack Used
*Placeholder for the full list of tools, libraries, and frameworks.*

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **State Management**: [Riverpod (flutter_riverpod)](https://riverpod.dev/) with [Riverpod Generator](https://pub.dev/packages/riverpod_generator) (Code Generation)
- **Routing**: [GoRouter (go_router)](https://pub.dev/packages/go_router)
- **Architecture**: Clean Architecture (Feature-first approach)
- **Local/Mock Storage**: _[Specify local data storage strategy here once implemented]_
- **Fonts & Assets**: _[List any custom fonts, icons, or assets used]_

---

## 📸 Screenshots
*Placeholder for screenshots of the 3 required screens.*

| Home Screen | Payment Details Screen | Payment Success Screen |
| :---: | :---: | :---: |
| *[Screenshot Home]* | *[Screenshot Payment Details]* | *[Screenshot Payment Success]* |

---

## 🔗 Demo Link
*Placeholder for demo resources.*

- **Mockup / Video Demo**: _[Link to video walkthrough or web demo if applicable]_
- **APK Download**: _[Link to downloadable APK or instructions to build APK]_

---

## 📂 Project Structure

This project follows a **Feature-First Clean Architecture** structure combined with **Riverpod** for state management:

```
lib/
├── core/                        # Shared/cross-cutting concerns
│   ├── error/                   # Failure and Exception handling classes
│   ├── network/                 # Network clients, API endpoints, connection checkers
│   ├── routing/                 # GoRouter navigation setup and route definitions
│   └── theme/                   # App styling, themes, colors, typography
│
└── features/                    # Feature modules (Domain-driven)
    ├── home/                    # Home screen & Fee payment card overview
    │   ├── data/                # Data layer: Datasources, Models, Repository implementations
    │   │   ├── datasources/
    │   │   ├── models/
    │   │   └── repositories/
    │   ├── domain/              # Domain layer (Business logic): Entities, Repository contracts, Usecases
    │   │   ├── entities/
    │   │   ├── repositories/
    │   │   └── usecases/
    │   └── presentation/        # Presentation layer: Screens, custom widgets, state providers
    │       ├── providers/
    │       ├── screens/
    │       └── widgets/
    │
    └── payment/                 # Payment details & success confirmation flow
        ├── data/
        │   ├── datasources/
        │   ├── models/
        │   └── repositories/
        ├── domain/
        │   ├── entities/
        │   ├── repositories/
        │   └── usecases/
        └── presentation/
            ├── providers/
            ├── screens/
            └── widgets/
```

### Architectural Layers Explained

1. **Domain Layer**: The core business logic. It contains **Entities** (business objects), **Repository Interfaces** (data access contracts), and **Usecases** (encapsulated business logic tasks). This layer is completely independent of Flutter, UI frameworks, or external databases.
2. **Data Layer**: The implementation of data access. Contains **Models** (data structures that extend Entities and add serialization/deserialization logic), **Datasources** (local databases or network endpoints), and **Repository Implementations** (concrete classes fulfilling the domain repository contracts).
3. **Presentation Layer**: UI and state management. Contains **Screens/Pages** (views), **Widgets** (reusable UI elements), and **Providers/Controllers** (Riverpod providers managing UI state and interacting with Domain Usecases).

---

## ⚙️ Setup Steps

Follow these steps to set up and run the application locally:

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Ensure you are on a stable channel)
- Dart SDK
- Android SDK / Xcode (for running on emulators/simulators)

### Installation

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd siksha360_task
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Verify analyzer & build:**
   ```bash
   flutter analyze
   ```

4. **Run the application:**
   - For Android/iOS:
     ```bash
     flutter run
     ```
   - For Web:
     ```bash
     flutter run -d chrome
     ```

---

## ⚠️ Important Topics & Considerations

- **Mock Data Handling**: The application relies entirely on mock local data; no network backend or gateway integrations are implemented.
- **Strict Lint Rules**: Built under standard Flutter lints to ensure clean, readable, and consistent code guidelines.
