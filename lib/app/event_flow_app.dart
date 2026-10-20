import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/theme/app_theme.dart';
import '../features/bookings/data/datasources/in_memory_bookings_data_source.dart';
import '../features/bookings/data/repositories/bookings_repository_impl.dart';
import '../features/bookings/domain/entities/booking.dart';
import '../features/bookings/domain/repositories/bookings_repository.dart';
import '../features/bookings/logic/bookings_cubit.dart';
import '../features/bookings/presentation/booking_success_page.dart';
import '../features/events/data/datasources/demo_events_data_source.dart';
import '../features/events/data/repositories/events_repository_impl.dart';
import '../features/events/domain/entities/event.dart';
import '../features/events/domain/repositories/events_repository.dart';
import '../features/events/logic/events_cubit.dart';
import '../features/events/presentation/event_detail_page.dart';
import 'home_shell.dart';

class EventFlowApp extends StatelessWidget {
  const EventFlowApp({super.key});

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(name: 'home', path: '/', builder: (context, state) => const HomeShell()),
      GoRoute(
        name: 'event-detail',
        path: '/event-detail',
        builder: (context, state) => EventDetailPage(event: state.extra! as Event),
      ),
      GoRoute(
        name: 'booking-success',
        path: '/booking-success',
        builder: (context, state) => BookingSuccessPage(booking: state.extra! as Booking),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<EventsRepository>(
          create: (_) => EventsRepositoryImpl(dataSource: const DemoEventsDataSource()),
        ),
        RepositoryProvider<BookingsRepository>(
          create: (_) => BookingsRepositoryImpl(dataSource: InMemoryBookingsDataSource()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => EventsCubit(repository: context.read<EventsRepository>())),
          BlocProvider(create: (context) => BookingsCubit(repository: context.read<BookingsRepository>())),
        ],
        child: MaterialApp.router(
          title: 'EventFlow',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          routerConfig: _router,
        ),
      ),
    );
  }
}
