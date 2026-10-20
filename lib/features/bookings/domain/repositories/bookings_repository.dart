import '../entities/booking.dart';

/// Domain contract for reading and creating bookings.
abstract interface class BookingsRepository {
  Future<List<Booking>> getBookings();

  Future<Booking> createBooking(Booking booking);
}
