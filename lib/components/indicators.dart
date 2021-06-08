import 'package:auttu_test/providers/dot_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DotIndicators extends ConsumerWidget {
  final _minWidth = 8.0;
  final _maxWidth = 32.0;

  @override
  Widget build(BuildContext context, watch) {
    final currentIndex = watch(currentIndexProvider).state;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (index) =>
            index == currentIndex ? buildDot(_maxWidth) : buildDot(_minWidth),
      ),
    );
  }

  AnimatedContainer buildDot(double width) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      duration: Duration(milliseconds: 400),
      width: width,
      height: _minWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffC4C4C4),
      ),
    );
  }
}
