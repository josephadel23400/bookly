import 'package:flutter/material.dart';

import 'float_navigation_bar.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            child, // 👈 only this changes
            FloatNavigationBar(), // 👈 always alive, never rebuilds
          ],
        ),
      ),
    );
  }
}
