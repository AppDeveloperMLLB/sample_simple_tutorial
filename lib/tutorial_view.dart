import 'package:flutter/material.dart';

class TutorialView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String body;

  const TutorialView({
    super.key,
    required this.imagePath,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 7,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(
          flex: 3,
          child: Container(),
        )
      ],
    );
  }
}
