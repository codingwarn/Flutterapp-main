# AGC Gallery App – Beginner-Friendly Project Overview

---

## Welcome!

This document is designed to help **any new developer** (even if you’re new to Flutter or mobile development) quickly understand, run, and contribute to the AGC Gallery App. If you’re preparing for a job or joining a team, this guide will walk you through everything step by step.

---

## 1. What is This Project?

**AGC Gallery App** is a simple, modern Flutter app that shows a user dashboard and a gallery of photos. It fetches images from a public API and displays them in a beautiful, responsive layout. The app is built using best practices so you can learn how real-world Flutter apps are structured.

**Key goals:**
- Show how to organize a Flutter project for real jobs
- Demonstrate clean code, architecture, and state management
- Make it easy for new developers to understand and extend

---

## 2. What Does the App Do?

- Shows a user profile (avatar, username, stats)
- Displays a dashboard with navigation and stats
- Loads and shows a grid of photos from the internet
- Handles loading, error, and empty states gracefully
- Uses modern Flutter UI and architecture patterns

---

## 3. How Does the App Work? (Big Picture)

Here’s a simple diagram of the app’s flow:

```
+-------------------+
|   User Launches   |
|      the App      |
+-------------------+
          |
          v
+-------------------+
|  Main App Widget  |
+-------------------+
          |
          v
+-------------------+
|  Dashboard Page   |
+-------------------+
          |
          v
+-------------------+
|  Photo ViewModel  | <--- Fetches photos from API
+-------------------+
          |
          v
+-------------------+
|  API Client (Dio) |
+-------------------+
          |
          v
+-------------------+
| JSONPlaceholder   |
|   (Public API)    |
+-------------------+
```

- The app starts at `main.dart`, sets up dependencies, and shows the dashboard.
- The dashboard asks the ViewModel to fetch photos.
- The ViewModel uses a repository, which talks to a remote data source, which uses an API client (Dio) to fetch data from the internet.
- The UI updates automatically when new data arrives or if there’s an error.

---

## 4. Tech Stack (What Tools Are Used?)

- **Flutter**: The main framework for building cross-platform apps.
- **Dart**: The programming language used by Flutter.
- **Provider**: For simple state management (MVVM pattern).
- **BLoC**: For more advanced state management (not required to use both, but both are shown for learning).
- **Injectable + GetIt**: For dependency injection (makes code modular and testable).
- **Dio**: For making HTTP requests to APIs.
- **Equatable**: For comparing objects easily.
- **Google Fonts**: For custom text styles.
- **Flutter Staggered Grid View**: For the gallery layout.

---

## 5. Project Structure (Where is Everything?)

Here’s a simplified map of the `lib/` folder:

```
lib/
  core/           # App-wide utilities (DI, networking)
    di/           # Dependency injection setup
    network/      # API client
  data/           # Data layer (models, repositories, datasources)
    datasources/  # How we fetch data (from API)
    models/       # Data models (e.g., PhotoModel)
    repositories/ # Implementation of repositories
  domain/         # Business logic (entities, usecases, repository interfaces)
    entities/     # Core data types (e.g., Photo)
    repositories/ # Abstract repository contracts
    usecases/     # Business actions (e.g., GetPhotos)
  presentation/   # UI layer (pages, widgets, viewmodels, blocs)
    blocs/        # BLoC state management
    pages/        # Screens (e.g., Dashboard)
    viewmodels/   # MVVM state management
    widgets/      # Reusable UI components
  main.dart       # App entry point
```

**How to read this:**
- If you want to change the UI, look in `presentation/pages` and `presentation/widgets`.
- If you want to change how data is fetched, look in `data/` and `core/network`.
- If you want to add new business logic, look in `domain/`.

---

## 6. How to Run the App (Step by Step)

1. **Install Flutter** (if you haven’t already):
   - [Flutter Install Guide](https://docs.flutter.dev/get-started/install)
2. **Clone the project**:
   ```sh
   git clone <repo-url>
   cd Flutterapp-main
   ```
3. **Install dependencies**:
   ```sh
   flutter pub get
   ```
4. **Run the app**:
   ```sh
   flutter run
   ```
   - You can run on an emulator or a real device.
5. **Build a release APK** (for Android):
   ```sh
   flutter build apk --release
   # Output: build/app/outputs/flutter-apk/app-release.apk
   ```

---

## 7. How Does Data Flow? (Step by Step)

Let’s say the app needs to show photos:

1. **UI (DashboardPage)** asks the **ViewModel** to fetch photos.
2. **ViewModel** calls a **UseCase** (GetPhotosUseCase) to get photos.
3. **UseCase** calls the **Repository** (PhotoRepository) to fetch data.
4. **Repository** decides where to get data (here, always from the remote API).
5. **RemoteDataSource** uses **ApiClient** (Dio) to make an HTTP request.
6. **ApiClient** fetches data from the internet.
7. Data flows back up: API → RemoteDataSource → Repository → UseCase → ViewModel → UI.
8. UI updates automatically when data arrives.

---

## 8. Key Concepts Explained Simply

### a. **MVVM (Model-View-ViewModel)**
- **Model**: The data (e.g., Photo)
- **View**: The UI (e.g., DashboardPage)
- **ViewModel**: The glue between UI and data. Handles fetching, error handling, and notifies the UI when things change.

### b. **BLoC (Business Logic Component)**
- A more advanced way to manage state. Useful for complex flows or when you want to separate business logic from UI even more.

### c. **Dependency Injection (DI)**
- Instead of creating objects everywhere, we "inject" them. This makes code easier to test and change.
- Example: Instead of `var api = ApiClient();`, we use `getIt<ApiClient>()`.

### d. **Repository Pattern**
- All data access goes through a repository. This means you can swap out where data comes from (API, local DB, etc.) without changing the rest of your code.

### e. **Error Handling**
- All network calls are wrapped in try/catch. If something goes wrong, the UI shows a friendly error message.

---

## 9. Example: Fetching Photos (Code Walkthrough)

**PhotoViewModel (simplified):**
```dart
@injectable
class PhotoViewModel extends ChangeNotifier {
  final GetPhotosUseCase _getPhotosUseCase;
  PhotoVmStatus _status = PhotoVmStatus.initial;
  List<Photo> _photos = <Photo>[];
  String? _errorMessage;

  Future<void> fetch({int page = 1, int limit = 10}) async {
    _status = PhotoVmStatus.loading;
    notifyListeners();
    try {
      final result = await _getPhotosUseCase.execute(page: page, limit: limit);
      _photos = result;
      _status = PhotoVmStatus.success;
    } catch (e) {
      _status = PhotoVmStatus.error;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }
}
```

- The UI listens to the ViewModel. When `fetch()` is called, it updates the UI as loading, then with data or error.

---

## 10. How to Learn This Codebase

1. **Start at `main.dart`** – see how the app is started and dependencies are set up.
2. **Open `presentation/pages/dashboard_page.dart`** – this is the main screen.
3. **Look at `presentation/viewmodels/photo_view_model.dart`** – see how data is fetched and state is managed.
4. **Check `data/` and `domain/`** – see how data flows from the API to the UI.
5. **Experiment!** Try changing the UI, adding a new button, or modifying the API call.
6. **Read code comments** – they explain why things are done a certain way.

---

## 11. Frequently Asked Questions (FAQ)

**Q: I’m new to Flutter. Where should I start?**
A: Start with `main.dart` and follow the flow into `dashboard_page.dart`. Use the Flutter docs for widgets and layout basics.

**Q: How do I add a new feature?**
A: Add a new page or widget in `presentation/pages` or `presentation/widgets`. If it needs data, create a new ViewModel and UseCase.

**Q: How do I test the app?**
A: Run `flutter test` to run widget and unit tests. See `test/widget_test.dart` for an example.

**Q: How do I change the API or add local storage?**
A: Update or add a new data source in `data/datasources` and update the repository.

**Q: What if I break something?**
A: Use version control (git) to revert changes. Ask for help or check the code comments.

---

## 12. Final Tips for New Developers
- Don’t be afraid to experiment! Flutter has hot reload, so you can see changes instantly.
- Read the code comments and follow the structure – it’s designed to be clear and modular.
- If you’re stuck, search for the file or class name in the project.
- Ask questions! No one expects you to know everything on day one.

---

**Welcome to the AGC Gallery App!**

If you have suggestions for improving this guide, add them here or ask your team lead.
