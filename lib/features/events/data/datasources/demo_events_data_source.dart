import '../../domain/entities/event.dart';

class DemoEventsDataSource {
  const DemoEventsDataSource();

  Future<List<Event>> fetchEvents() async {
    final now = DateTime.now();

    return [
      Event(
        id: 'event-001',
        title: 'Summer Music Festival',
        description:
            'Experience an unforgettable night of live music, '
            'amazing artists, food, and great company.',
        category: 'Music',
        venue: 'Riverside Open Air',
        city: 'Amsterdam',
        startsAt: now.add(const Duration(days: 5)),
        price: 49.99,
        imageUrl:
            'https://images.unsplash.com/photo-1459749411175-04bf5292ceea'
            '?auto=format&fit=crop&w=1200&q=85',
        organizer: 'LiveNation Events',
        isFeatured: true,
      ),
      Event(
        id: 'event-002',
        title: 'Tech & Innovation Summit',
        description:
            'Discover emerging technologies, meet industry leaders, '
            'and explore ideas shaping the future.',
        category: 'Technology',
        venue: 'Innovation Center',
        city: 'Rotterdam',
        startsAt: now.add(const Duration(days: 9)),
        price: 79.00,
        imageUrl:
            'https://images.unsplash.com/photo-1540575467063-178a50c2df87'
            '?auto=format&fit=crop&w=1200&q=85',
        organizer: 'Future Labs',
        isFeatured: true,
      ),
      Event(
        id: 'event-003',
        title: 'Creative Design Workshop',
        description:
            'Practice modern design techniques and collaborate '
            'with other creatives in a hands-on workshop.',
        category: 'Workshop',
        venue: 'Creative Studio',
        city: 'Utrecht',
        startsAt: now.add(const Duration(days: 12)),
        price: 25.00,
        imageUrl:
            'https://images.unsplash.com/photo-1516321318423-f06f85e504b3'
            '?auto=format&fit=crop&w=1200&q=85',
        organizer: 'Design Collective',
      ),
      Event(
        id: 'event-004',
        title: 'Startup Networking Night',
        description:
            'Meet founders, developers, and investors in a relaxed '
            'environment designed for meaningful connections.',
        category: 'Networking',
        venue: 'Central Business Hub',
        city: 'Amsterdam',
        startsAt: now.add(const Duration(days: 15)),
        price: 0,
        imageUrl:
            'https://images.unsplash.com/photo-1511795409834-ef04bbd61622'
            '?auto=format&fit=crop&w=1200&q=85',
        organizer: 'Startup Community',
      ),
      Event(
        id: 'event-005',
        title: 'Food & Culture Experience',
        description:
            'Explore local flavors, discover new dishes, and enjoy '
            'an evening celebrating food and culture.',
        category: 'Food',
        venue: 'City Market Hall',
        city: 'The Hague',
        startsAt: now.add(const Duration(days: 20)),
        price: 35.00,
        imageUrl:
            'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4'
            '?auto=format&fit=crop&w=1200&q=85',
        organizer: 'Local Experiences',
      ),
      Event(
        id: 'event-006',
        title: 'Morning Yoga in the Park',
        description:
            'Start your day with a refreshing outdoor yoga session '
            'suitable for beginners and experienced participants.',
        category: 'Wellness',
        venue: 'City Park',
        city: 'Eindhoven',
        startsAt: now.add(const Duration(days: 25)),
        price: 12.50,
        imageUrl:
            'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b'
            '?auto=format&fit=crop&w=1200&q=85',
        organizer: 'Mindful Living',
      ),
    ];
  }
}
