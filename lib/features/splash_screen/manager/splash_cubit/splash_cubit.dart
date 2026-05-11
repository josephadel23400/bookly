import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  PageController controller = PageController();

  SplashCubit() : super(SplashInitial());
  int pageNum = 0;
  void nextPage() {
    if (pageNum == 2) {
      print('\n \n next == 2 $pageNum \n\n');
      pageNum = 0;
      print('\n \n next == 2 $pageNum after \n\n');

    } else {
      print('\n \n next else $pageNum  \n\n');

      pageNum += 1;
      print('\n \n next else $pageNum after \n\n');

    }
    controller.animateToPage(
      pageNum,
      duration: Duration(milliseconds: 10),
      curve: Curves.bounceInOut,
    );
    print('\n \n next go to page $pageNum  \n\n');

    emit(SplashPageChanged(pageNum));
  }

  void previousPage() {
    if (pageNum == 0) {
      print('\n \n pre == 0 $pageNum \n\n');
      pageNum = 2;
      print('\n \n pre == 0 after $pageNum \n\n');
    } else {
      print('\n \n prev else  $pageNum \n\n');
      pageNum -= 1;
      print('\n \n prev else  $pageNum  after \n\n');
    }
    controller.animateToPage(
      pageNum,
      duration: Duration(milliseconds: 10),
      curve: Curves.bounceInOut,
    );
    print('\n \n prev go to page  $pageNum \n\n');

    emit(SplashPageChanged(pageNum));
  }


}
