import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app/app_cubit/app_cubit.dart';
import '../resources/routs_manager.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.child,
    this.alwaysFullOpacity = false, // 👈 add this
  });
  final int index;
  final int currentIndex;
  final Widget child;
  final bool alwaysFullOpacity;
  @override
  Widget build(BuildContext context) {
    final isSelected = index == currentIndex;

    return IconButton(
      onPressed: () {
        context.read<AppCubit>().changeTab(index); // 👈 update state
        context.go(tabRoutes[index]); // 👈 navigate
      },
      icon: Opacity(
        opacity: alwaysFullOpacity
            ? 1
            : isSelected
            ? 1.0
            : 0.5, // 👈 active/inactive
        child: child,
      ),
    );
  }
}
