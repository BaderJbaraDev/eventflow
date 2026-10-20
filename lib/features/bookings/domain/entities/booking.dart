
import 'package:equatable/equatable.dart';

import '../../../events/domain/entities/event.dart';

class Booking extends Equatable {
  const Booking({
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
