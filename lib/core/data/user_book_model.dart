//TODO: use HIVE to build it in the future -> https://ms3byoussef.medium.com/hive-in-flutter-a-detailed-guide-with-injectable-freezed-and-cubit-in-clean-architecture-c5c12ce8e00c
import 'package:bookly/core/resources/assets_manager.dart';

class UserBookModel {
  final int bookId;
  final String bookPdfLocation;
  final double readingPercentage;
  final int lastPageRead;
  UserBookModel({
    required this.bookPdfLocation,
    required this.readingPercentage,
    required this.lastPageRead,
    required this.bookId,
  });
}

List<UserBookModel> userBooks = [
  UserBookModel(
    bookId: 654684234,
    bookPdfLocation: ImageManager.book1Pdf,
    readingPercentage: 0.68,
    lastPageRead: 102,
  ),
  UserBookModel(
    bookId: 654684754,
    bookPdfLocation: ImageManager.book1Pdf,
    readingPercentage: 1.0,
    lastPageRead: 210,
  ),
  UserBookModel(
    bookId: 654684111,
    bookPdfLocation: ImageManager.book1Pdf,
    readingPercentage: 0,
    lastPageRead: 44,
  ),
  UserBookModel(
    bookId: 654684564,
    bookPdfLocation: ImageManager.book1Pdf,
    readingPercentage: 0.45,
    lastPageRead: 89,
  ),
  UserBookModel(
    bookId: 654684975,
    bookPdfLocation: ImageManager.book1Pdf,
    readingPercentage: 0.91,
    lastPageRead: 578,
  ),
];
