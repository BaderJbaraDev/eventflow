import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/empty_state.dart';
import '../../logic/events_cubit.dart';
import '../../logic/events_state.dart';
import '../widgets/event_card.dart';

/// Renders the result portion of the discovery page for the current view state.
/// Keeps loading, error, empty and populated states out of the page composition.
class EventsResultsBody extends StatelessWidget {
  const EventsResultsBody({
    required this.state,
    required this.cubit,
    super.key,
  });

  final EventsState state;
  final EventsCubit cubit;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.errorMessage != null) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: EmptyState(
          icon: Icons.wifi_off_outlined,
          title: 'Something went wrong',
          message: state.errorMessage!,
        ),
      );
    }

    if (state.filteredEvents.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: EmptyState(
          icon: Icons.search_off,
          title: 'No events found',
          message: 'Try another search or choose a different category.',
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final event = state.filteredEvents[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: EventCard(
                event: event,
                isSaved: cubit.isSaved(event.id),
                onTap: () => context.pushNamed('event-detail', extra: event),
                onSaveTap: () => cubit.toggleSaved(event),
              ),
            );
          },
          childCount: state.filteredEvents.length,
        ),
      ),
    );
  }
}
