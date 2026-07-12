import 'package:bookly/features/profile/views/widgets/profile_app_bar.dart';
import 'package:bookly/features/profile/views/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: Column(children: [ProfileAppBar(), ProfileBody()])));
  }
}
