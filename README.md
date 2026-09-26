# Resgo - Ecommerce App

Flutter ecommerce app for **Resgo**, a food / product ordering platform with categories, cart, checkout, and order history.

This project is a functional customer-side app focused on real workflows: authentication, product browsing, cart management, checkout with payment receipt upload, and order tracking.

Built with **Flutter**, **Riverpod**, and a live **REST API**.

---

## Features

- User register / login / logout (token-based auth)
- Splash screen with session routing
- Home with featured products and product grid
- Product detail page
- Cart (add, update quantity, remove items)
- Checkout with payment receipt upload
- Orders list (history, status, cancel)
- Cart auto-clears after successful order
- Logout with confirmation dialog
- Basic language option on Login (English / Nepali)
- Loading, empty, and error states

---

## How to Run the Project

### Prerequisites

- Flutter SDK installed
- Android Studio / VS Code
- Chrome or Android emulator / physical device

### Steps

1. Clone the repository:

```bash
git clone <your-repo-url>
cd resgo
```

2. Install dependencies:

```bash
flutter pub get
```

3. Generate Freezed / JSON files (if needed):

```bash
dart run build_runner build --delete-conflicting-outputs
```

4. Run the app:

```bash
flutter run
```

5. Build a release APK:

```bash
flutter build apk --release
```

> Note: Ensure the `INTERNET` permission is enabled in `AndroidManifest.xml` for API calls on real devices.

---

## Flutter / Dart Version

- **Flutter:** 3.x (stable)
- **Dart:** 3.x

Check your local version:

```bash
flutter --version
```

---

## Packages Used

| Package                         | Purpose                                      |
| ------------------------------- | -------------------------------------------- |
| `flutter_riverpod`              | State management                             |
| `go_router`                     | Navigation                                   |
| `dio`                           | HTTP client for REST API calls               |
| `pretty_dio_logger`             | Request/response logging in debug mode       |
| `dartz`                         | Functional error handling (`Either`)         |
| `freezed` / `json_serializable` | Immutable models + JSON parsing              |
| `shared_preferences`            | Local storage for auth token                 |
| `internet_connection_checker`   | Connectivity checks                          |
| `google_fonts`                  | Custom typography                            |
| `flutter_screenutil`            | Responsive UI                                |
| `cached_network_image`          | Product image caching                        |
| `image_picker`                  | Payment receipt upload                       |
| `awesome_dialog`                | Confirmation dialogs                         |
| `intl`                          | Formatting + localization support            |
| `flutter_localizations`         | Official Flutter localization                |

---

## State-Management Approach

This project uses **Riverpod**.

### Why Riverpod?

- Clear and explicit state management
- Better testability and scalability
- Compile-safe dependency injection
- Clean handling of async API states

### Architecture flow

```text
UI (Screens)
    ↓
Providers / Notifiers (AsyncNotifier / StateNotifier)
    ↓
Repositories (abstract contracts in domain)
    ↓
Repository Implementations (data layer + Dio)
    ↓
REST API
```

- **Screens** only handle UI and user interaction
- **Providers / Controllers** manage state and business actions
- **Repositories** communicate with the backend
- **Models** map API responses into Dart objects (Freezed)

---

## Project Structure

```text
lib/
├── main.dart
├── core/
│   ├── api/
│   │   ├── base/              # BaseRemoteSource
│   │   └── error/             # AppError, ErrorHandler
│   ├── constants/             # API endpoints, storage keys
│   ├── network/               # Dio auth interceptor, NetworkInfo
│   ├── providers/             # Core providers (Dio, session, locale)
│   ├── router/                # GoRouter routes
│   ├── session/               # SessionService
│   ├── theme/                 # Colors, typography, dimensions
│   └── typedef/               # FutureEither aliases
├── features/
│   ├── app/                   # Root MaterialApp
│   ├── auth/                  # Login, register, logout
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── product/               # Home, product detail, categories
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── cart/                  # Cart list, add/update/remove
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── order/                 # Checkout, orders history
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── splash/                # Session routing
└── l10n/                      # Localization (.arb files)
```

### Folder responsibilities

- `core/` → shared infrastructure (theme, network, session, errors, router)
- `features/<feature>/data/` → models + repository implementations
- `features/<feature>/domain/` → abstract repository contracts
- `features/<feature>/presentation/` → providers, screens, widgets
- `l10n/` → English / Nepali translation files

Each feature follows a lightweight clean architecture:

```text
feature/
├── data/           # Freezed models + remote repository implementations
├── domain/         # Repository contracts
└── presentation/   # Riverpod providers, screens, widgets
```

---

## API

- **Base URL:** `https://ecommerce.codeitappsware.com/api`
- Auth uses **Bearer token** stored in `SharedPreferences`
- Token is attached automatically via Dio `AuthInterceptor`

### Main endpoints

| Method | Endpoint              | Description                |
| ------ | --------------------- | -------------------------- |
| POST   | `/register`           | Create account             |
| POST   | `/login`              | Login                      |
| POST   | `/logout`             | Logout                     |
| GET    | `/products`           | List products              |
| GET    | `/product/{id}`       | Product detail             |
| GET    | `/featured-products`  | Featured products          |
| GET    | `/categories`         | List categories            |
| GET    | `/carts`              | Get cart items             |
| POST   | `/cart`               | Add to cart                |
| PATCH  | `/cart/{id}`          | Update cart item qty       |
| DELETE | `/cart/{id}`          | Remove cart item           |
| GET    | `/orders`             | List orders                |
| POST   | `/order`              | Place order (multipart)    |
| PATCH  | `/order/{id}`         | Cancel / update order      |

---

## Assumptions Made

- Backend API is provided and reachable during development
- User credentials are required for cart, checkout, and orders
- Some API responses use inconsistent key names (e.g. `"sucess"`, `"order id"`) and are handled in models/repositories
- `total_amt` and similar fields may arrive as String or num; models convert safely
- Order placement requires a payment receipt image (`multipart/form-data`)
- Cart is cleared client-side by deleting each item after a successful order
- Language support is implemented as a working demo on the Login screen, not full app-wide translation
- Temporary backend downtime may affect live login and API testing
```
