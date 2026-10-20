# Changes in this revision

- Converted reactive feature pages to `HookWidget` and `hooked_bloc` hooks (`useBloc`, `useBlocBuilder`).
- Added a local `useOnce` hook for one-time feature initialization.
- Converted the home tab shell to `HookWidget` and `useState`.
- Added named `go_router` routes for home, event details, and booking confirmation.
- Replaced direct `Navigator` page pushes with named GoRouter navigation.
- Moved event and booking initial loading from app-level provider creation into their pages, using `useOnce`.
- Updated architecture documentation and dependencies to match the reference page-writing style.
- Preserved the existing feature-first Clean Architecture and demo/in-memory behavior.

Validation note: this environment does not have Flutter/Dart CLI available, so `flutter pub get`, `dart format`, `flutter analyze`, and `flutter test` must be run in the user's Flutter environment.


## Cubit lifecycle fix

Shared Cubits provided above `MaterialApp.router` are now retrieved with `context.read<T>()` rather than `useBloc<T>()`. This prevents a page-level hook from taking ownership of a shared Cubit and closing it when a route is disposed. `useBlocBuilder` remains in use to listen to state changes.
