import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit() : super(BookDetailsInitial()) ;
  String fullText =
      '''disney\'s The Jungle Book is getting a makeover — the 1967 animated classic is going live action in 2016.
In order to get the look right, Director John Favreau is using many of the same techniques James Cameron made famous in Avatar, and the trailer shows gorgeous landscapes and life-like jungle animals.
The Jungle Book\'s characters are voiced by top-tier talent, with Bill Murray, Scarlett Johannson, Idris Elba, Sir Ben Kingsley, Lupita Nyong\'o, and Christopher Walken playing roles. Protagonist Mowgli, will be played by newcomer Neel Seth. Johannson, who plays the sinister Kaa, is speaking to Mowgli during the trailer.
Set for an April 2016 release date, Disney\'s The Jungle Book isn\'t the only take on the stories of Rudyard Kipling, as Warner Brothers will release Jungle Book: Origins in 2017. Origins, directed by Andy Serkis, will feature voices from Christian Bale and Cate Blanchett.'''; // from JSON

  String dropCapLetter = '';
  late String remainingText = fullText;
  void setDropCapLetter() {
    for (int i = 0; i < fullText.length; i++) {
      if (fullText[i].trim().isNotEmpty) {
        dropCapLetter = fullText[i]; // "D"
        remainingText = fullText.substring(i + 1);
        // "isney first made..."
        break;
      }
    }
    emit(BookDetailsReady());
  }

  // Find the first actual letter (ignores leading spaces)
}
