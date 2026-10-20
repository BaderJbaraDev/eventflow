import '../entities/event.dart';

/// Domain contract for retrieving events.
///
/// Implementations may read from memory, a REST API, or Supabase. The logic
/// layer depends only on this abstraction, never on a concrete data source.
abstract interface class EventsRepository {
  Future<List<Event>> getEvents();
}
