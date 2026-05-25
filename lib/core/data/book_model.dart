import 'package:bookly/core/resources/assets_manager.dart';

class BookModel {
  final String? bookName;
  final String? author;
  final String? image;
  final String? bookPreview;
  final double? rate;
  final double? price;
  final int? reviews;
  final int id;
  BookModel({
    this.bookName,
    this.author,
    this.image,
    this.rate,
    this.reviews,
    this.price,
    this.bookPreview,
    required this.id,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      bookPreview: json['bookPreview'],
      bookName: json['bookName'],
      author: json['author'],
      image: json['image'],
      rate: json['rate'],
      price: json['price'],
      reviews: json['reviews'],
    );
  }
}

List<BookModel> books = [
  BookModel(
    bookPreview: '',
    bookName: 'The Jungle Book',
    id: 654684351,
    author: 'Rudyard Kipling',
    image: ImageManager.bookI1mage,
    rate: 3.9,
    price: 10.2,
    reviews: 2568,
  ),
  BookModel(
    bookPreview: '',
    bookName: 'King Kong',
    id: 654684234,
    author: 'Merian C. Cooper',
    image: ImageManager.bookI2mage,
    rate: 4.7,
    price: 17.2,
    reviews: 11505,
  ),
  BookModel(
    bookPreview: '',
    bookName: 'My Neighbor Totoro',
    id: 654684754,
    author: 'Hayao Miyazaki',
    image: ImageManager.bookI3mage,
    rate: 4.9,
    price: 5.99,
    reviews: 1182,
  ),
  BookModel(
    bookPreview: '',
    bookName: 'Harry Potter and the Goblet of Fire',
    id: 654684351,
    author: 'J.K. Rowling',
    image: ImageManager.bookI4mage,
    rate: 4.8,
    price: 19.99,
    reviews: 2390,
  ),
  BookModel(
    bookPreview: '',
    bookName: 'Star Wars: Return of the Jedi',
    id: 654684111,
    author: 'George Lucas',
    image: ImageManager.bookI5mage,
    rate: 4,
    price: 12.4,
    reviews: 12005,
  ),
  BookModel(
    bookPreview: '',
    bookName: 'Batman The Dark Knight Rises',
    id: 654684564,
    author: 'David S. Goyer',
    image: ImageManager.bookI6mage,
    rate: 4.9,
    price: 7.8,
    reviews: 15421,
  ),
  BookModel(
    bookPreview: '',
    bookName: 'Harry Potter and the Deathly Hallows',
    id: 654684975,
    author: 'J.K. Rowling',
    image: ImageManager.bookI7mage,
    rate: 4.2,
    price: 19.99,
    reviews: 2648,
  ),
  BookModel(
    bookPreview: '',
    bookName: 'Harry Potter and the Half-Blood Prince',
    id: 654684351,
    author: 'J.K. Rowling',
    image: ImageManager.bookI8mage,
    rate: 4,
    price: 19.99,
    reviews: 4750,
  ),
];
