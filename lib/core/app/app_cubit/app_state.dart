part of 'app_cubit.dart';

class AppState extends Equatable {
  final BookModel? selectedBook;
  final List<BookModel> bookStack;
  final int currentTabIndex;

  const AppState({
    this.selectedBook,
    this.bookStack = const [],
    this.currentTabIndex = 0,
  });

  AppState copyWith({
    BookModel? selectedBook,
    List<BookModel>? bookStack,
    int? currentTabIndex,
  }) {
    return AppState(
      bookStack: bookStack ?? this.bookStack,
      selectedBook: selectedBook ?? this.selectedBook,
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
    );
  }

  @override
  List<Object?> get props => [selectedBook, bookStack,currentTabIndex];
}
