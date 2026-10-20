# EventFlow architecture

EventFlow follows a feature-first, layered architecture and uses the page-writing pattern from the supplied reference project.

- `presentation/`: page composition, dedicated body widgets and reusable widgets. Reactive pages use `HookWidget`, `useBloc`, and `useBlocBuilder`; `useOnce` is used for one-time initialization.
- `logic/`: Cubits and immutable state objects. UI code calls Cubit methods instead of embedding business operations in widgets.
- `domain/entities/`: framework-independent `Event` and `Booking` entities.
- `domain/repositories/`: contracts used by the logic layer.
- `data/datasources/`: demo event and in-memory booking sources.
- `data/repositories/`: implementations of domain contracts.
- `app/`: dependency wiring and named navigation routes using `go_router`.

The project includes `flutter_hooks`, `hooked_bloc`, and `go_router` to align reactive page composition and navigation with the supplied reference style. Keep view-building state separate from one-off navigation/dialog effects as new features are added; do not use persistent state fields as one-shot events.

## Current demo constraints

Events are hard-coded demo data; bookings and favorites are not persisted; QR codes are demo-only and not valid tickets; Supabase is not connected. The supplied source archive omits native platform folders such as `android/`, `ios/`, and `web/`.

## Validation

Run `flutter pub get`, `dart format lib test`, `flutter analyze`, and `flutter test` in a Flutter environment, then smoke-test event discovery, event details, favorites, booking, and ticket navigation.
