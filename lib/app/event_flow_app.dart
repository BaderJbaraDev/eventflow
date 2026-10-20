
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/theme/app_theme.dart';
import '../features/bookings/logic/bookings_cubit.dart';
import '../features/events/logic/events_cubit.dart';
import 'home_shell.dart';

class EventFlowApp extends StatelessWidget {
  const EventFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => EventsCubit()..loadEvents(),
        ),
        BlocProvider(
          create: (_) => BookingsCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'EventFlow',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const HomeShell(),
      ),
    );
  }
}
