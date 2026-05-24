import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeManager {
  //screen size
  static double get blockSizeH => .01.sh; // 1% of screen height
  static double get blockSizeV => .01.sw;

  // text size get
  static double get smallFontSize13 => 13.sp;
  static double get smallFontSize14 => 14.sp;
  static double get smallFontSize16 => 16.sp;
  static double get mediumFontSize20 => 20.sp;
  static double get mediumFontSize18 => 18.sp;
  static double get largeFontSize30 => 30.sp;

  //widget size get
  static double get screenSizeH50 => .5.sh;
  static double get screenSizeH25 => .25.sh;
  static double get screenSizeH80 => .80.sh;
  static double get screenSizeH90 => .90.sh;
  static double get screenSizeH15 => .15.sh;
  static double get screenSizeH5 => .05.sh;
  static double get screenSizeH10 => .10.sh;
  static double get screenSizeH100 => 1.sh;
  static double get screenSizeW50 => .5.sw;
  static double get screenSizeW25 => .25.sw;
  static double get screenSizeW80 => .80.sw;
  static double get screenSizeW90 => .90.sw;
  static double get screenSizeW15 => .15.sw;
  static double get screenSizeW5 => .05.sw;
  static double get screenSizeW10 => .10.sw;
  static double get screenSizeW100 => 1.sw;

  //border radius
  static double get radiusSm => 8.r;
  static double get radiusMd => 12.r;
  static double get radiusLg => 16.r;
  static double get radiusFull => 999.r;

  //padding
  static double get paddingSm => 8.h;
  static double get paddingXSm => 6.h;
  static double get paddingMd => 12.h;
  static double get paddingLg => 16.h;
  static double get paddingXLg => 18.h;
  static double get paddingXXLg => 20.h;
}
