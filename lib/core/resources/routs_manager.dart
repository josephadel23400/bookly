import 'package:bookly/core/resources/string_manager.dart';
import 'package:bookly/features/books_home/manager/home_cubit/home_cubit.dart';
import 'package:bookly/features/my_books/manager/my_books_cubit/my_books_cubit.dart';
import 'package:bookly/features/profile/manager/profile_cubit/profile_cubit.dart';
import 'package:bookly/features/profile/notifications/manager/notifications_cubit/notifications_cubit.dart';
import 'package:bookly/features/profile/notifications/views/notificatio_page.dart';
import 'package:bookly/features/profile/privacy_and_security/manager/privacy_and_security_cubit/privacy_and_security_cubit.dart';
import 'package:bookly/features/profile/privacy_and_security/views/privacy_and_security_page.dart';
import 'package:bookly/features/search_for_book/manager/search_for_book_cubit/search_for_book_cubit.dart';
import 'package:bookly/features/splash_screen/manager/splash_cubit/splash_cubit.dart';
import 'package:bookly/features/splash_screen/views/splash_screen.dart';
import 'package:bookly/features/user_book_details/book_reading/manager/book_reading_cubit/book_reading_cubit.dart';
import 'package:bookly/features/user_book_details/manager/user_book_details_cubit/user_book_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/book_details/manager/book_details_cubit/book_details_cubit.dart';
import '../../features/book_details/views/book_details.dart';
import '../../features/book_details/views/book_preview/book_preview.dart';
import '../../features/books_home/views/books_page.dart';
import '../../features/my_books/views/my_books_page.dart';
import '../../features/profile/edit_profile/manager/edit_profile_cubit/edit_profile_cubit.dart';
import '../../features/profile/edit_profile/view/edit_profile_page.dart';
import '../../features/profile/views/profile_page.dart';
import '../../features/saved_books/views/saved_books_page.dart';
import '../../features/search_for_book/view/search_page.dart';
import '../../features/user_book_details/book_reading/view/book_reading_page.dart';
import '../../features/user_book_details/views/user_book_details_page.dart';
import '../app/app_cubit/app_cubit.dart';
import '../widgets/app_shell.dart';

class Routes {
  static const String splashPage = '/';
  static const String booksPage = '/books';
  static const String bookDetails = '/bookDetails';
  static const String searchForBook = '/search';
  static const String previewBook = '/preview';
  static const String savedBooks = '/savedBooks';
  static const String myBooks = '/myBooks';
  static const String profile = '/profile';
  static const String userBookDetails = '/userBookDetails';
  static const String bookReadingPage = '/bookReadingPage';
  static const String editProfilePage = '/editProfilePage';
  static const String notificationsPage = '/notificationsPage';
  static const String privacyAndSecurityPage = '/privacyAndSecurityPage';
}

const tabRoutes = [
  Routes.booksPage,
  Routes.savedBooks,
  Routes.myBooks,
  Routes.profile,
];

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
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: Routes.booksPage,
            builder: (context, state) {
              return BlocProvider(
                create: (context) =>
                    HomeCubit(appCubit: context.read<AppCubit>()),
                child: BooksPage(),
              );
            },
          ),
          GoRoute(
            path: Routes.savedBooks,
            builder: (context, state) => SavedBooksPage(),
          ),
          GoRoute(
            path: Routes.myBooks,
            builder: (context, state) => BlocProvider(
              create: (context) =>
                  MyBooksCubit(appCubit: context.read<AppCubit>()),
              child: MyBooksPage(),
            ),
          ),
          GoRoute(
            path: Routes.profile,
            builder: (context, state) => BlocProvider(
              create: (context) => ProfileCubit(),
              child: ProfilePage(),
            ),
          ),
        ],
      ),

      GoRoute(
        path: Routes.bookDetails,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => BookDetailsCubit(),
            child: BookDetails(),
          );
        },
      ),
      GoRoute(
        path: Routes.editProfilePage,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => EditProfileCubit(),
            child: EditProfilePage(),
          );
        },
      ),
      GoRoute(
        path: Routes.userBookDetails,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                UserBookDetailsCubit(appCubit: context.read<AppCubit>())
                  ..loadingData(),
            child: UserBookDetailsPage(),
          );
        },
      ),
      GoRoute(
        path: Routes.searchForBook,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SearchForBookCubit(),
            child: SearchPage(),
          );
        },
      ),
      GoRoute(
        path: Routes.bookReadingPage,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => BookReadingCubit(),
            child: BookReadingPage(),
          );
        },
      ),
      GoRoute(
        path: Routes.notificationsPage,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => NotificationsCubit(),
            child: NotificationsPage(),
          );
        },
      ), GoRoute(
        path: Routes.privacyAndSecurityPage,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => PrivacyAndSecurityCubit(),
            child: PrivacyAndSecurityPage(),
          );
        },
      ),
      GoRoute(
        path: Routes.previewBook,
        builder: (context, state) {
          final cubit =
              state.extra as BookDetailsCubit; // 👈 receive existing cubit
          return BlocProvider.value(
            value: cubit, // 👈 .value = don't create new, use existing
            child: BookPreview(),
          );
        },
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text(StringManager.errorRouteMessage))),
  );
}
