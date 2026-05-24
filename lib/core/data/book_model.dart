class BookModel {
  final String? bookName;
  final String? author;
  final String? image;
  final String? bookPreview;
  final double? rate;
  final int? review;
  final int id;
  BookModel({
    this.bookName,
    this.author,
    this.image,
    this.rate,
    this.review,
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
      review: json['review'],
    );
  }
}
