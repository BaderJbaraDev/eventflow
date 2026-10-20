import '../../domain/entities/event.dart';
import '../../domain/repositories/events_repository.dart';
import '../datasources/demo_events_data_source.dart';

class EventsRepositoryImpl implements EventsRepository {
  const EventsRepositoryImpl({required DemoEventsDataSource dataSource})
      : _dataSource = dataSource;

  final DemoEventsDataSource _dataSource;

  @override
  Future<List<Event>> getEvents() => _dataSource.fetchEvents();
}
