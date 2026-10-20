
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/empty_state.dart';
import '../logic/events_cubit.dart';
import '../logic/events_state.dart';
import 'event_detail_page.dart';
import 'widgets/event_card.dart';

class SavedEventsPage extends StatelessWidget {
  const SavedEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsCubit, EventsState>(
      builder: (context, state) {
        final cubit = context.read<EventsCubit>();
        final events = state.savedEvents;

        if (events.isEmpty) {
          return const EmptyState(
            icon: Icons.favorite_border,
            title: 'No saved events yet',
            message:
                'Save events you like and they will appear here.',
          );
        }

        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Your favorites',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${events.length} saved events',
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 22),
            for (final event in events)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: EventCard(
                  event: event,
                  isSaved: true,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => EventDetailPage(event: event),
                      ),
                    );
                  },
                  onSaveTap: () => cubit.toggleSaved(event),
                ),
              ),
          ],
        );
      },
    );
  }
}
