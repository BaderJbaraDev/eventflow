import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/empty_state.dart';
import '../logic/events_cubit.dart';
import '../domain/entities/event.dart';
import 'widgets/event_card.dart';

class SavedEventsPage extends HookWidget {
  const SavedEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EventsCubit>();
    final state = useBlocBuilder(cubit);
    final events = state.savedEvents;

    return _builder(context, cubit, events);
  }

  Widget _builder(BuildContext context, EventsCubit cubit, List<Event> events) {
    if (events.isEmpty) {
      return const EmptyState(
        icon: Icons.favorite_border,
        title: 'No saved events yet',
        message: 'Save events you like and they will appear here.',
      );
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text('Your favorites', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
        const SizedBox(height: 6),
        Text('${events.length} saved events', style: const TextStyle(color: AppColors.textSecondary)),
        const SizedBox(height: 22),
        for (final event in events)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: EventCard(
              event: event,
              isSaved: cubit.isSaved(event.id),
              onTap: () => context.pushNamed('event-detail', extra: event),
              onSaveTap: () => cubit.toggleSaved(event),
            ),
          ),
      ],
    );
  }
}
