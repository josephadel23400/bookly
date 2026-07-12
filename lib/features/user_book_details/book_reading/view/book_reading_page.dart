import 'package:bookly/core/app/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookReadingPage extends StatelessWidget {
  const BookReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedBook = context.read<AppCubit>().state.selectedUserBook;

    final PdfViewerController controller = PdfViewerController();
    return SafeArea(
      child: SfPdfViewer.asset(
        selectedBook!.bookPdfLocation,
        controller: controller,
        onDocumentLoaded: (PdfDocumentLoadedDetails details) {
          print('Pages: ${details.document.pages.count}');
        },
        onPageChanged: (PdfPageChangedDetails details) {
          print('Now on page: ${details.newPageNumber}');
        },
        enableTextSelection: true,
        scrollDirection: PdfScrollDirection.vertical,
        pageLayoutMode: PdfPageLayoutMode.continuous,
      ),
    );
  }
}
