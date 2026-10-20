
import 'package:equatable/equatable.dart';
import '../domain/entities/event.dart';

class EventsState extends Equatable {
  const EventsState({
    this.events = const [],
    this.savedEventIds = const {},
    this.searchQuery = '',
    this.selectedCategory = 'All',
    this.isLoading = false,
    this.errorMessage,
  });

  final List<Event> events;
  final Set<String> savedEventIds;
  final String searchQuery;
  final String selectedCategory;
  final bool isLoading;
  final String? errorMessage;

  static const categories = [
    'All',
    'Music',
    'Technology',
    'Workshop',
    'Networking',
    'Food',
    'Wellness',
  ];

  List<Event> get filteredEvents {
    return events.where((event) {
      final matchesSearch =
          event.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          event.city.toLowerCase().contains(searchQuery.toLowerCase()) ||
          event.category.toLowerCase().contains(searchQuery.toLowerCase());

      final matchesCategory = selectedCategory == 'All' ||
          event.category == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  List<Event> get savedEvents => events
      .where((event) => savedEventIds.contains(event.id))
      .toList();

  EventsState copyWith({
    List<Event>? events,
    Set<String>? savedEventIds,
    String? searchQuery,
    String? selectedCategory,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return EventsState(
      events: events ?? this.events,
      savedEventIds: savedEventIds ?? this.savedEventIds,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        events,
        savedEventIds,
        searchQuery,
        selectedCategory,
        isLoading,
        errorMessage,
      ];
}
