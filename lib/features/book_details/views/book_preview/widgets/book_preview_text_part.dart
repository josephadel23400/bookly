import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../../../../core/resources/size_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class BookPreviewTextPart extends StatelessWidget {
  const BookPreviewTextPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chapter 1 — Mowgli\'s Brothers',
                style: TextStylesManager.displaySmall(
                  context,
                  color: ColorsManager.orangeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                textAlign: TextAlign.justify,
                '''disney\'s The Jungle Book is getting a makeover — the 1967 animated classic is going live action in 2016.
In order to get the look right, Director John Favreau is using many of the same techniques James Cameron made famous in Avatar, and the trailer shows gorgeous landscapes and life-like jungle animals.
The Jungle Book\'s characters are voiced by top-tier talent, with Bill Murray, Scarlett Johannson, Idris Elba, Sir Ben Kingsley, Lupita Nyong\'o, and Christopher Walken playing roles. Protagonist Mowgli, will be played by newcomer Neel Seth. Johannson, who plays the sinister Kaa, is speaking to Mowgli during the trailer.
Set for an April 2016 release date, Disney\'s The Jungle Book isn\'t the only take on the stories of Rudyard Kipling, as Warner Brothers will release Jungle Book: Origins in 2017. Origins, directed by Andy Serkis, will feature voices from Christian Bale and Cate Blanchett.''',
                style: TextStylesManager.titleMedium(
                  context,
                  size: SizeManager.smallFontSize16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
