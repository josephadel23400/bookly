import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/widgets/custom_icon_button.dart';

class NewPasswordAppBar extends StatelessWidget {
  const NewPasswordAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          onPressed: () {
            context.pop();
          },
          size: 25.sp,
          icon: Icons.arrow_back,
        ),
        SizedBox(height: 80.h),
      ],
    );
  }
}
