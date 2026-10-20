
import 'package:equatable/equatable.dart';

class Event extends Equatable {
  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.venue,
    required this.city,
    required this.startsAt,
    required this.price,
    required this.imageUrl,
    required this.organizer,
    this.isFeatured = false,
  });

  final String id;
  final String title;
  final String description;
  final String category;
  final String venue;
  final String city;
  final DateTime startsAt;
  final double price;
  final String imageUrl;
  final String organizer;
  final bool isFeatured;

  bool get isFree => price == 0;

  String get formattedPrice =>
      isFree ? 'Free' : '\$${price.toStringAsFixed(2)}';

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        venue,
        city,
        startsAt,
        price,
        imageUrl,
        organizer,
        isFeatured,
      ];
}
