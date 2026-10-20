
import 'package:equatable/equatable.dart';

import '../../events/domain/event.dart';

class DemoBooking extends Equatable {
  const DemoBooking({
    required this.id,
    required this.event,
    required this.bookedAt,
    required this.ticketCode,
  });

  final String id;
  final Event event;
  final DateTime bookedAt;
  final String ticketCode;

  @override
  List<Object?> get props => [
        id,
        event,
        bookedAt,
        ticketCode,
      ];
}
