# EventFlow — Flutter Event Booking App

**EventFlow** is a Flutter portfolio project that demonstrates a modern event discovery and ticket booking experience. It was built to showcase Flutter development skills, clean code organization, and state management.

> **Project status:** Portfolio demo. Some features use mock data and are not connected to a production backend.

## Features

- **Event Discovery:** Browse a collection of sample events.
- **Event Details:** View event information and details.
- **Saved Events:** Save events for quick access.
- **Ticket Booking Flow:** Explore a simulated booking experience.
- **My Tickets:** View demo bookings.
- **QR Code Tickets:** Generate QR codes for demonstration purposes.
- **Modern UI:** A consistent theme and reusable UI components.
- **Modular Architecture:** Organized code across feature, data, domain, and presentation layers.

## Tech Stack

- **Flutter** — Cross-platform UI development
- **Dart** — Application programming language
- **flutter_bloc** — State management
- **Equatable** — Value equality
- **qr_flutter** — QR code generation
- **Supabase** — Planned backend integration

## Project Structure

```text
lib/
├── app/
├── core/
│   ├── theme/
│   └── widgets/
└── features/
    ├── events/
    │   ├── data/
    │   ├── domain/
    │   ├── logic/
    │   └── presentation/
    └── bookings/
        ├── data/
        ├── domain/
        ├── logic/
        └── presentation/

supabase/
└── schema.sql
```

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or VS Code

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/BaderJbaraDev/eventflow.git
   ```

2. Navigate to the project directory:

   ```bash
   cd eventflow
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

## Current Limitations

This project is a demonstration application and is not intended for production use.

- Event and booking data use demo repositories.
- Saved events and bookings are not persisted across app restarts.
- QR codes are for demonstration only and do not represent validated tickets.
- Authentication, payment processing, and production backend integration are not implemented.
- The Supabase schema is a starting point for future backend development.

## Future Improvements

- Integrate Supabase for authentication and persistent data.
- Add real-time event discovery and search.
- Implement secure ticket booking and payment workflows.
- Add persistent saved events and booking history.
- Introduce automated unit and widget tests.
- Add CI/CD workflows and release builds.

## Purpose

This project demonstrates practical Flutter development, feature-based code organization, state management, reusable widgets, and the design of an event booking workflow.

## Author

**Bader Jbara**

Flutter & Cross-Platform Developer | Backend Engineer

GitHub: [@baderjbaradev](https://github.com/baderjbaradev)

---

*Built with Flutter as a software development portfolio project.*