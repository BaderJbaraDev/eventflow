import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/event.dart';
import '../domain/repositories/events_repository.dart';
import 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit({required EventsRepository repository})
      : _repository = repository,
        super(const EventsState());

  final EventsRepository _repository;

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

  void search(String query) => emit(state.copyWith(searchQuery: query));

  void selectCategory(String category) =>
      emit(state.copyWith(selectedCategory: category));

  void toggleSaved(Event event) {
    final updatedIds = Set<String>.from(state.savedEventIds);
    final wasSaved = updatedIds.contains(event.id);

    if (wasSaved) {
      updatedIds.remove(event.id);
    } else {
      updatedIds.add(event.id);
    }

    emit(state.copyWith(savedEventIds: updatedIds));
  }

  bool isSaved(String eventId) => state.savedEventIds.contains(eventId);
}
