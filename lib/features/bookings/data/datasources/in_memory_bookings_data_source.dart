import '../../domain/entities/booking.dart';

/// Temporary in-memory source used by the portfolio demo.
/// Data is intentionally lost when the application process is restarted.
class InMemoryBookingsDataSource {
  final List<Booking> _bookings = [];

  Future<List<Booking>> fetchBookings() async => List.unmodifiable(_bookings);

  Future<Booking> insertBooking(Booking booking) async {
    _bookings.insert(0, booking);
    return booking;
  }
}
