import 'package:bookly/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bookshelf_card.dart';
//

class HorizontalBooksAds extends StatefulWidget {
  const HorizontalBooksAds({super.key});
  @override
  State<HorizontalBooksAds> createState() => _HorizontalBooksAdsState();
}

class _HorizontalBooksAdsState extends State<HorizontalBooksAds> {
  late final PageController _controller;
  double _currentPage = 0;
  final double _viewportFraction = 0.43;
  final List<String> images = [
    ImageManager.bookImage,
    ImageManager.bookI2mage,
    ImageManager.bookI3mage,
    ImageManager.bookImage,
    ImageManager.bookI2mage,
    ImageManager.bookI3mage,
    ImageManager.bookImage,
    ImageManager.bookI2mage,
    ImageManager.bookI3mage,
    ImageManager.bookImage,
    ImageManager.bookI2mage,
    ImageManager.bookI3mage,
  ];
  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: _viewportFraction, // shows part of next card
      initialPage: 0,
    );
    _controller.addListener(() {
      setState(() => _currentPage = _controller.page ?? 0);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.h),
      height: 240.h,
      child: PageView.builder(
        controller: _controller,
        //
        itemCount: images.length,
        padEnds: false,
        itemBuilder: (context, index) {
          final distance = (_currentPage - index).abs().clamp(0.0, 1.0);
          final scale = 1.0 - (distance * 0.11);

          return Transform.scale(
            scale: scale,
            alignment: Alignment.centerRight, // ← changed from centerLeft
            child: BookshelfCard(image: images[index],bookId: index,),
          );
        },
      ),
    );
  }
}
