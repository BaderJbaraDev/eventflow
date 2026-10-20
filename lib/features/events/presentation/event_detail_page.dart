

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/concept_notice.dart';
import '../domain/entities/event.dart';
import '../logic/events_cubit.dart';
import '../../bookings/logic/bookings_cubit.dart';
import '../../bookings/logic/bookings_state.dart';

class EventDetailPage extends HookWidget {
  const EventDetailPage({
    required this.event,
    super.key,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    final eventsCubit = context.read<EventsCubit>();
    final eventsState = useBlocBuilder(eventsCubit);
    final bookingsCubit = context.read<BookingsCubit>();
    final bookingState = useBlocBuilder(bookingsCubit);

    useBlocListener<BookingsCubit, BookingsState>(
      bookingsCubit,
      (cubit, state, context) {
        final message = state.errorMessage;
        if (message == null) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      },
      listenWhen: (state) => state.errorMessage != null,
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withValues(alpha: 0.95),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => eventsCubit.toggleSaved(event),
                icon: Icon(
                  eventsState.savedEventIds.contains(event.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: eventsState.savedEventIds.contains(event.id)
                      ? AppColors.error
                      : AppColors.textPrimary,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: 0.95),
                ),
              ),
              const SizedBox(width: 12),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                event.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  child: const Icon(Icons.event, size: 70),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.09),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      event.category,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 27,
                    height: 1.25,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 22),
                _InfoRow(
                  icon: Icons.calendar_month_outlined,
                  title: _formatDate(event.startsAt),
                  subtitle: 'Event date',
                ),
                const SizedBox(height: 18),
                _InfoRow(
                  icon: Icons.location_on_outlined,
                  title: event.venue,
                  subtitle: event.city,
                ),
                const SizedBox(height: 18),
                _InfoRow(
                  icon: Icons.person_outline,
                  title: event.organizer,
                  subtitle: 'Organizer',
                ),
                const SizedBox(height: 28),
                const Text(
                  'About this event',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  event.description,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.8,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 24),
                const ConceptNotice(),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: AppColors.border),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ticket price',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      event.formattedPrice,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: bookingState.isBooking
                      ? null
                      : () async {
                          final booking = await bookingsCubit.bookEvent(event);
                          if (!context.mounted) return;
                          if (booking == null) return;
                          context.pushNamed('booking-success', extra: booking);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: bookingState.isBooking
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : const Text('Book ticket', style: TextStyle(fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April',
      'May', 'June', 'July', 'August',
      'September', 'October', 'November', 'December',
    ];

    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
