
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/demo_event_repository.dart';
import '../domain/event.dart';
import 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit({
    this._repository = const DemoEventRepository(),
  })  : super(const EventsState());

  final DemoEventRepository _repository;

  Future<void> loadEvents() async {
    emit(state.copyWith(isLoading: true, clearError: true));

    try {
      final events = await _repository.getEvents();

      emit(state.copyWith(
        events: events,
        isLoading: false,
        clearError: true,
      ));
    } catch (_) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Unable to load events. Please try again.',
      ));
    }
  }

  void search(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void selectCategory(String category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void toggleSaved(Event event) {
    final updatedIds = Set<String>.from(state.savedEventIds);

    if (!updatedIds.add(event.id)) {
      updatedIds.remove(event.id);
    }

    emit(state.copyWith(savedEventIds: updatedIds));
  }

  bool isSaved(String eventId) {
    return state.savedEventIds.contains(eventId);
  }
}
