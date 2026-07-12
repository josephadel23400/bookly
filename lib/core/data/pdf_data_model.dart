import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfDataModel {
  final String? readTime;
  final int? pageCount;
  final PdfBookmarkBase? bookMarks;
  PdfDataModel({
    required this.readTime,
    required this.pageCount,
    required this.bookMarks,
  });
}
