import '../../domain/entities/booking.dart';
import '../../domain/repositories/bookings_repository.dart';
import '../datasources/in_memory_bookings_data_source.dart';

class BookingsRepositoryImpl implements BookingsRepository {
  const BookingsRepositoryImpl({required InMemoryBookingsDataSource dataSource})
      : _dataSource = dataSource;

  final InMemoryBookingsDataSource _dataSource;

  @override
  Future<List<Booking>> getBookings() => _dataSource.fetchBookings();

  @override
  Future<Booking> createBooking(Booking booking) =>
      _dataSource.insertBooking(booking);
}
