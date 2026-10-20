
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../events/domain/event.dart';
import '../data/demo_booking_repository.dart';
import '../domain/demo_booking.dart';

class BookingsCubit extends Cubit<List<DemoBooking>> {
  BookingsCubit({
    DemoBookingRepository? repository,
  }) : this._(repository ?? DemoBookingRepository());

  BookingsCubit._(DemoBookingRepository repository)
      : _repository = repository,
        super(repository.getBookings());

  final DemoBookingRepository _repository;

  DemoBooking bookEvent(Event event) {
    final now = DateTime.now();

    final booking = DemoBooking(
      id: 'booking-${now.microsecondsSinceEpoch}',
      event: event,
      bookedAt: now,
      ticketCode: 'EF-${now.microsecondsSinceEpoch}',
    );

    _repository.createBooking(booking);
    emit(_repository.getBookings());

    return booking;
  }
}
