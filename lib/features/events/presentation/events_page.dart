import 'package:eventflow/features/events/logic/events_cubit.dart';
import 'package:eventflow/features/events/logic/events_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

import '../../../core/hooks/use_once.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/concept_notice.dart';
import 'body/events_results_body.dart';

class EventsPage extends HookWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EventsCubit>();
    final state = useBlocBuilder(cubit);

    useOnce(() => cubit.loadEvents());

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Discover', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                          SizedBox(height: 5),
                          Text('Amazing events', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 23,
                      backgroundColor: Color(0xFFEAE8FF),
                      child: Icon(Icons.event_available, color: AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const ConceptNotice(),
                const SizedBox(height: 20),
                TextField(
                  onChanged: cubit.search,
                  decoration: const InputDecoration(hintText: 'Search events or cities...', prefixIcon: Icon(Icons.search)),
                ),
                const SizedBox(height: 22),
                const Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                const SizedBox(height: 12),
                SizedBox(
                  height: 42,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: EventsState.categories.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final category = EventsState.categories[index];
                      final selected = category == state.selectedCategory;
                      return ChoiceChip(
                        label: Text(category),
                        selected: selected,
                        onSelected: (_) => cubit.selectCategory(category),
                        selectedColor: AppColors.primary,
                        backgroundColor: Colors.white,
                        labelStyle: TextStyle(color: selected ? Colors.white : AppColors.textSecondary, fontWeight: FontWeight.w600, fontSize: 12),
                        side: BorderSide(color: selected ? AppColors.primary : AppColors.border),
                        showCheckmark: false,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Expanded(child: Text('Upcoming events', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: AppColors.textPrimary))),
                    Text('${state.filteredEvents.length} events', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  ],
                ),
                const SizedBox(height: 14),
              ],
            ),
          ),
        ),
        EventsResultsBody(state: state, cubit: cubit),
      ],
    );
  }
}
