# EventFlow

EventFlow is a Flutter event-discovery and demo-ticket application. This archive contains the Dart source, tests, analysis options and package manifest from the supplied project, reorganized around feature-first Clean Architecture.

## Architecture

```text
lib/
  main.dart
  app/
    event_flow_app.dart       # Dependency composition and app entry widget
    home_shell.dart           # Bottom navigation shell
  core/
    theme/                    # Shared colors and theme
    widgets/                  # Shared UI components
  features/
    events/
      presentation/           # Pages, page bodies and reusable widgets
      logic/                  # EventsCubit and immutable EventsState
      domain/
        entities/             # Event domain entity
        repositories/         # EventsRepository contract
      data/
        datasources/          # Demo event source
        repositories/         # Concrete repository implementation
    bookings/
      presentation/           # Ticket list and booking confirmation
      logic/                  # BookingsCubit and BookingsState
      domain/
        entities/             # Booking domain entity
        repositories/         # BookingsRepository contract
      data/
        datasources/          # In-memory booking source
        repositories/         # Concrete repository implementation
```

## Responsibilities

- **Presentation:** builds widgets and forwards user actions. `EventsPage` composes the discovery screen, while `EventsResultsBody` renders loading, error, empty and populated result states.
- **Logic:** Cubits coordinate operations and expose immutable state objects to the UI.
- **Domain:** contains entities and repository contracts; it does not depend on Flutter UI or concrete data sources.
- **Data:** provides demo/in-memory sources and repository implementations. Replace these implementations with API/Supabase-backed implementations later without coupling the Cubits to a specific backend.
- **App:** wires dependencies using `RepositoryProvider` and `BlocProvider`.

## Current limitations

- Events are hard-coded demo data.
- Bookings exist in memory only and disappear when the app process restarts.
- Saved event IDs are held in the Cubit state and are not persisted.
- QR codes are demo-only and are not valid for entry or verification.
- Supabase is listed as a dependency but is not initialized or connected to these repositories.

## Open and validate in your existing Flutter environment

1. Extract the archive.
2. Open the extracted folder in VS Code.
3. Run `flutter pub get` from the VS Code terminal.
4. Run `dart format lib test`.
5. Run `flutter analyze` and `flutter test`.
6. Launch the app on an emulator or device and check discovery, saved events, booking and ticket screens.
