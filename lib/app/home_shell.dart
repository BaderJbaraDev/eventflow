import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../core/theme/app_colors.dart';
import '../features/bookings/presentation/my_tickets_page.dart';
import '../features/events/presentation/events_page.dart';
import '../features/events/presentation/saved_events_page.dart';

class HomeShell extends HookWidget {
  const HomeShell({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    const pages = [EventsPage(), SavedEventsPage(), MyTicketsPage()];

    return Scaffold(
      body: SafeArea(child: IndexedStack(index: selectedIndex.value, children: pages)),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex.value,
        onDestinationSelected: (index) => selectedIndex.value = index,
        backgroundColor: Colors.white,
        indicatorColor: AppColors.primary.withValues(alpha: 0.12),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite), label: 'Saved'),
          NavigationDestination(icon: Icon(Icons.confirmation_number_outlined), selectedIcon: Icon(Icons.confirmation_number), label: 'My tickets'),
        ],
      ),
    );
  }
}
