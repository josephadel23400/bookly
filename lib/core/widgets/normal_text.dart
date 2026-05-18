import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  const NormalText({super.key, required this.color, required this.text, required this.size});
  final Color color ;
  final String text ;
  final double size ;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontSize: size),);
  }
}
