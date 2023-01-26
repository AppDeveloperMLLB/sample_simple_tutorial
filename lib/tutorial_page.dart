import 'package:flutter/material.dart';
import 'package:sample_simple_tutorial/dots_indicator.dart';
import 'package:sample_simple_tutorial/tutorial_view.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  int currentIndex = 0;
  late final PageController pageController;
  final pageViewList = const [
    TutorialView(
      imagePath: "assets/images/tutorial1.png",
      title: "チュートリアル1",
      body: "チュートリアル1です",
    ),
    TutorialView(
      imagePath: "assets/images/tutorial2.png",
      title: "チュートリアル2",
      body: "チュートリアル2です",
    ),
    TutorialView(
      imagePath: "assets/images/tutorial3.png",
      title: "チュートリアル3",
      body: "チュートリアル3です",
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: onPageChanged,
                children: pageViewList,
              ),
            ),
            DotsIndicator(
              dotsCount: pageViewList.length,
              currentIndex: currentIndex,
            ),
            const SizedBox(
              height: 32,
            ),
            buildButton(),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget buildButton() {
    if (currentIndex == pageViewList.length - 1) {
      return Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content: Text("チュートリアルは終わりです"),
                  );
                });
          },
          child: const Text("Finish"),
        ),
      );
    }
    return MaterialButton(
      color: Theme.of(context).buttonTheme.colorScheme!.primary,
      height: 56,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.navigate_next,
        color: Colors.white,
      ),
      onPressed: () {
        pageController.nextPage(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut);
      },
    );
  }
}
