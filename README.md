# AGC Art Gallery

A modern Flutter application that showcases an artist's portfolio with a beautiful UI. The app displays artwork images from JSONPlaceholder API in a responsive grid layout and features an artist profile with statistics. The app follows MVVM architecture with clean code principles and dependency injection.

## Features

- **Artist Profile**: Display artist avatar, username, and statistics (followers, artworks, exhibitions)
- **Engagement Metrics**: Shows likes, views, and shares for the artist's work
- **Color Palette**: Visual representation of the artist's color theme
- **Modern Navigation**: Easy access to Uploads, Exhibitions, and Revenue sections
- **Responsive Gallery Grid**: Beautiful 2-column image grid displaying artwork
- **Image Caching**: Improved performance with cached images
- **Pull-to-refresh**: Update content with a simple pull gesture
- **Infinite Scrolling**: Load more images as you scroll
- **Error Handling**: Graceful error states and loading indicators
- **Clean Architecture**: MVVM pattern with dependency injection

## Architecture

The project follows the MVVM (Model-View-ViewModel) architecture pattern with clean code principles:

- **Core**: Contains network services, dependency injection setup, and utilities
- **Data**: Contains data sources, models, and repository implementations
- **Domain**: Contains entities, repository interfaces, and use cases
- **Presentation**: Contains UI components (pages, widgets) and BLoCs

## Project Structure

```
lib/
├── core/
│   ├── di/              # Dependency injection
│   ├── network/         # API client and network utilities
│   └── utils/           # Utility classes and functions
├── data/
│   ├── datasources/     # Remote and local data sources
│   ├── models/          # Data models
│   └── repositories/    # Repository implementations
├── domain/
│   ├── entities/        # Business entities
│   ├── repositories/    # Repository interfaces
│   └── usecases/        # Use cases
└── presentation/
    ├── blocs/           # BLoCs for state management
    ├── pages/           # UI screens
    └── widgets/         # Reusable UI components
```

## Dependencies

- **flutter_bloc**: State management
- **get_it** & **injectable**: Dependency injection
- **dio**: HTTP client for API requests
- **equatable**: Value equality
- **cached_network_image**: Image caching
- **flutter_staggered_grid_view**: Staggered grid layout
- **google_fonts**: Custom typography

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

1. **Flutter SDK**: Follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install)
2. **Dart SDK**: Usually comes with Flutter installation
3. **IDE**: Visual Studio Code or Android Studio with Flutter plugins
4. **Git**: For version control (optional)

### Setup Instructions

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd AGC-Art-Gallery
   ```

   Or download and extract the ZIP file if you don't use Git.

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   For Chrome (Web):
   ```bash
   flutter run -d chrome
   ```

   For Android:
   ```bash
   flutter run -d <android-device-id>
   ```
   You can get the device ID by running `flutter devices`

   For iOS (requires macOS):
   ```bash
   flutter run -d <ios-device-id>
   ```

   For Windows:
   ```bash
   flutter run -d windows
   ```
   Note: For Windows, you need to enable Developer Mode in Windows settings.

### Troubleshooting

- If you encounter CORS issues when running on web, try using a CORS browser extension or run Chrome with web security disabled:
  ```bash
  flutter run -d web-server --web-browser-flag="--disable-web-security"
  ```

- If you see package compatibility issues, check your Flutter version with `flutter --version` and update the packages in pubspec.yaml accordingly.

## Project Structure Explanation

- **lib/core/**: Contains foundational code like network configuration and dependency injection
- **lib/data/**: Handles data operations including API calls and model transformations
- **lib/domain/**: Contains business logic and entity definitions
- **lib/presentation/**: Contains all UI components and state management

## Development Notes

- The app uses the JSONPlaceholder API for demo purposes
- Images are loaded from picsum.photos to avoid CORS issues
- The app demonstrates clean architecture principles with separation of concerns for gallery

## Additional Resources

If you're new to Flutter, here are some helpful resources:

- [Flutter Documentation](https://docs.flutter.dev/)
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter Community](https://flutter.dev/community)

## Screenshots

The AGC Art Gallery app features a modern UI with the following screens:

- **Artist Profile**: Shows user avatar, statistics, and color palette
- **Gallery Grid**: Displays artwork in a responsive 2-column layout
- **Navigation**: Easy access to Uploads, Exhibitions, and Revenue sections

*Note: The app UI is designed to match the mockup shown in the project requirements.*

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
