part of 'app_cubit.dart';

class AppState extends Equatable {
  final BookModel? selectedBook;
  final UserBookModel? selectedUserBook;
  final List<BookModel> bookStack;
  final int currentTabIndex;

  const AppState({
    this.selectedBook,
    this.bookStack = const [],
    this.currentTabIndex = 0,
    this.selectedUserBook,
  });

  AppState copyWith({
    BookModel? selectedBook,
    UserBookModel? selectedUserBook,
    List<BookModel>? bookStack,
    int? currentTabIndex,
  }) {
    return AppState(
      bookStack: bookStack ?? this.bookStack,
      selectedBook: selectedBook ?? this.selectedBook,
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      selectedUserBook: selectedUserBook ?? this.selectedUserBook,
    );
  }

  @override
  List<Object?> get props => [
    selectedBook,
    bookStack,
    currentTabIndex,
    selectedUserBook,
  ];
}
