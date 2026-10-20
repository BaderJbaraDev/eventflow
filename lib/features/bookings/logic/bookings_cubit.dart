import 'package:flutter_bloc/flutter_bloc.dart';

import '../../events/domain/entities/event.dart';
import '../domain/entities/booking.dart';
import '../domain/repositories/bookings_repository.dart';
import 'bookings_state.dart';

class BookingsCubit extends Cubit<BookingsState> {
  BookingsCubit({required BookingsRepository repository})
      : _repository = repository,
        super(const BookingsState());

  final BookingsRepository _repository;

  Future<void> loadBookings() async {
    emit(state.copyWith(isLoading: true, clearError: true));
    try {
      final bookings = await _repository.getBookings();
      emit(state.copyWith(
        bookings: bookings,
        isLoading: false,
        clearError: true,
      ));
    } catch (_) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Unable to load your tickets. Please try again.',
      ));
    }
  }

  Future<Booking?> bookEvent(Event event) async {
    if (state.isBooking) return null;

    emit(state.copyWith(isBooking: true, clearError: true));
    final now = DateTime.now();
    final booking = Booking(
      id: 'booking-${now.microsecondsSinceEpoch}',
      event: event,
      bookedAt: now,
      ticketCode: 'EF-${now.microsecondsSinceEpoch}',
    );

    try {
      final createdBooking = await _repository.createBooking(booking);
      final bookings = await _repository.getBookings();
      emit(state.copyWith(
        bookings: bookings,
        isBooking: false,
        clearError: true,
      ));
      return createdBooking;
    } catch (_) {
      emit(state.copyWith(
        isBooking: false,
        errorMessage: 'Unable to create the demo ticket. Please try again.',
      ));
      return null;
    }
  }
}
