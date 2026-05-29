import 'package:bookly/core/widgets/logo_and_button_app_bar.dart';
import 'package:bookly/core/widgets/search_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/routs_manager.dart';

class MyBooksAppBar extends StatelessWidget {
  const MyBooksAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LogoAndButtonAppBar(
      widgetIcon: IconButton(
        onPressed: () {
          context.push(Routes.searchForBook);
        },
        icon: Icon(
          CupertinoIcons.search,
          color: ColorsManager.whiteColor.withValues(alpha: .7),
        ),
      ),
    );
  }
}
