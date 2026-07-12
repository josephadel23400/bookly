import 'package:bookly/core/app/app_cubit/app_cubit.dart';
import 'package:bookly/core/data/book_model.dart';
import 'package:bookly/core/data/user_book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../../../../core/data/pdf_data_model.dart';
part 'user_book_details_state.dart';

class UserBookDetailsCubit extends Cubit<UserBookDetailsState> {
  final AppCubit appCubit;
  UserBookDetailsCubit({required this.appCubit})
    : super(UserBookDetailsInitial());

  late BookModel? book = appCubit.state.selectedBook;
  late UserBookModel? userBookModel = appCubit.state.selectedUserBook;
  PdfDocument? document;
  late PdfDataModel pdfData;
  Future<void> loadingData() async {
    print('emit loading \n');
    emit(UserBookDetailsLoading());
    try {
      print('after emit loading \n');

      final ByteData data = await rootBundle.load(
        userBookModel!.bookPdfLocation,
      );
      print('afterbyte data \n');

      final Uint8List bytes = data.buffer.asUint8List();
      final result = await compute(_parsePdf, bytes);
      if (isClosed) return;
      pdfData = result;
      emit(UserBookDetailsSuccess());
      print(' emit success \n');

      //document!.dispose();
    } catch (e) {
      (emit(UserBookDetailsFailer(e.toString())));
      document!.dispose();
    }
  }

  @override
  Future<void> close() {
    document?.dispose();
    return super.close();
  }

  PdfDataModel getPdfDetails() {
    final int pageCount = document!.pages.count;
    final PdfBookmarkBase bookmarks = document!.bookmarks;
    //final int chaptersCount = bookmarks.count;
    final String readTime = getReadTime();
    return PdfDataModel(
      bookMarks: bookmarks,
      pageCount: pageCount,
      readTime: readTime,
    );
  }

  String getReadTime() {
    final int wordCount = PdfTextExtractor(document!)
        .extractText()
        .trim()
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .length;
    final int minutes = (wordCount / 225).ceil();
    return '${minutes ~/ 60}h ${minutes % 60}m';
  }
}

PdfDataModel _parsePdf(Uint8List bytes) {
  final doc = PdfDocument(inputBytes: bytes);
  final int pageCount = doc.pages.count;
  final PdfBookmarkBase bookmarks = doc.bookmarks;

  final int wordCount = PdfTextExtractor(doc)
      .extractText()
      .trim()
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .length;
  final int minutes = (wordCount / 225).ceil();
  final String readTime = '${minutes ~/ 60}h ${minutes % 60}m';

  return PdfDataModel(
    bookMarks: bookmarks,
    pageCount: pageCount,
    readTime: readTime,
  );
}
