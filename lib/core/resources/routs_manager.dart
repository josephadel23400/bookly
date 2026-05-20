import 'package:bookly/core/resources/string_manager.dart';
import 'package:bookly/features/splash_screen/manager/splash_cubit/splash_cubit.dart';
import 'package:bookly/features/splash_screen/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/book_details/views/book_details.dart';
import '../../features/books_home/views/books_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String booksPage = '/books';
  static const String bookDetails = '/bookDetails';
}

class RoutsManager {
  static final RoutsManager _instance = RoutsManager._internal();
  factory RoutsManager() => _instance;
  RoutsManager._internal();
  final GoRouter goRouter = GoRouter(
    initialLocation: Routes.splashPage,

    routes: [
      GoRoute(
        path: Routes.splashPage,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SplashCubit(),
            child: SplashScreen(),
          );
        },
      ),
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
