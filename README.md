# AGC Gallery

Single-screen Flutter app implementing the Dashboard from the assignment and loading photos from JSONPlaceholder.

## Run

```
flutter pub get
flutter run
```

## Build release APK

```
flutter build apk --release
```
Output: build/app/outputs/flutter-apk/app-release.apk

## Tech

- MVVM (ChangeNotifier + Provider)
- Injectable + GetIt for DI
- Dio for HTTP

## Structure

```
lib/
  core/di, core/network
  data/ (datasources, models, repositories)
  domain/ (entities, repositories, usecases)
  presentation/pages, presentation/viewmodels, presentation/widgets
```

Notes
- API: https://jsonplaceholder.typicode.com/photos?_page=1&_limit=10
- Avatar asset: assets/images/avatter.jpeg

