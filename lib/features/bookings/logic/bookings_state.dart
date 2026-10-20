import 'package:equatable/equatable.dart';

import '../domain/entities/booking.dart';

class BookingsState extends Equatable {
  const BookingsState({
    this.bookings = const [],
    this.isLoading = false,
    this.isBooking = false,
    this.errorMessage,
  });

  final List<Booking> bookings;
  final bool isLoading;
  final bool isBooking;
  final String? errorMessage;

  BookingsState copyWith({
    List<Booking>? bookings,
    bool? isLoading,
    bool? isBooking,
    String? errorMessage,
    bool clearError = false,
  }) {
    return BookingsState(
      bookings: bookings ?? this.bookings,
      isLoading: isLoading ?? this.isLoading,
      isBooking: isBooking ?? this.isBooking,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [bookings, isLoading, isBooking, errorMessage];
}
