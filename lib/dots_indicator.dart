import 'package:flutter/material.dart';
import 'package:sample_simple_tutorial/dots.dart';

class DotsIndicator extends StatelessWidget {
  final int dotsCount;
  final int currentIndex;
  const DotsIndicator({
    super.key,
    required this.dotsCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final dotsList = List<Widget>.generate(
      dotsCount,
      (i) => Padding(
        padding: EdgeInsets.only(right: i < dotsCount - 1 ? 10 : 0),
        child: Dots(isActive: i == currentIndex),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dotsList,
    );
  }
}
