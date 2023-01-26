import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  final bool isActive;
  const Dots({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).focusColor : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
