import 'package:flutter/material.dart';

import '../resources/routs_manager.dart';

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: RoutsManager().goRouter);
  }
}
