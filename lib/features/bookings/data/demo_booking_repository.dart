
import '../domain/demo_booking.dart';

class DemoBookingRepository {
  final List<DemoBooking> _bookings = [];

  List<DemoBooking> getBookings() {
    return List.unmodifiable(_bookings);
  }

  DemoBooking createBooking(DemoBooking booking) {
    _bookings.insert(0, booking);
    return booking;
  }
}
