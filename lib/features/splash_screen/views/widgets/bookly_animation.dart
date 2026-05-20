import 'dart:math';

import 'package:bookly/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BooklyAnimation extends StatefulWidget {
  const BooklyAnimation({super.key});

  @override
  _BooklyAnimationState createState() => _BooklyAnimationState();
}

class _BooklyAnimationState extends State<BooklyAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _jump;
  late Animation<double> _rotation;
  late Animation<double> _scale;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
    // JUMP: rise → hold at peak → fall → two small bounces
    _jump = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0,
          end: -120,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 30, // 0%–30% → rising
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -120,
          end: 0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 35, // 30%–65% → falling
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0,
          end: -20,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 9, // 65%–74% → bounce 1 up
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -20,
          end: 0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 9, // 74%–82% → bounce 1 down
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0,
          end: -10,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 8, // 82%–91% → bounce 2 up
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: -10,
          end: 0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 9, // 91%–100% → bounce 2 down
      ),
    ]).animate(_controller);

    // ROTATION: stays 0 while rising, flips mid-air, stays 0 after landing
    _rotation = TweenSequence<double>([
      TweenSequenceItem(
        tween: ConstantTween(0),
        weight: 30, // no spin while rising
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0,
          end: 2 * pi,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 35, // flip during fall
      ),
      TweenSequenceItem(
        tween: ConstantTween(0),
        weight: 35, // no spin during bounces
      ),
    ]).animate(_controller);

    // SCALE: normal → squash on landing → back to normal
    _scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: ConstantTween(1.0),
        weight: 63, // normal size until just before landing
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 1.4,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 4, // squash wide on impact
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.4,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.elasticOut)),
        weight: 33, // spring back during bounces
      ),
    ]).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _jump.value),
          child: Transform.rotate(
            angle: _rotation.value,
            child: Transform.scale(
              scale: _scale.value,
              child: SvgPicture.asset(ImageManager.logoSvg, height: 25.h),
            ),
          ),
        );
      },
    );
  }
}
