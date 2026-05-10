import 'package:bookly/core/resources/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/book_details/views/book_details.dart';
import '../../features/books_home/views/books_page.dart';


class Routes {
  static const String booksPage = '/';
  static const String bookDetails = '/bookDetails';
}

class RoutsManager {
  final GoRouter goRouter = GoRouter(
    initialLocation: Routes.booksPage,

    routes: [
      GoRoute(
        path: Routes.booksPage,
        builder: (context, state) {
          return BooksPage();
        },
      ),
      GoRoute(
        path: Routes.bookDetails,
        builder: (context, state) {
          return BookDetails();
        },
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text(StringManager.errorRouteMessage))),
  );
}
