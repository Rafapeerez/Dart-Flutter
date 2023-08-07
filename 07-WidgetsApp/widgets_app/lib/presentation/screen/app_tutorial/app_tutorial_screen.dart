import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidesInfo {
  final String title;
  final String caption;
  final String imageURL;

  SlidesInfo(
    this.title,
    this.caption,
    this.imageURL,
  );
}

final slides = <SlidesInfo>{
  SlidesInfo(
      'Search food', 'In officia qui anim laborum.', 'assets/Images/1.png'),
  SlidesInfo(
      'Fast delivery',
      'Ea cillum aliquip consectetur est duis sunt dolor ullamco veniam ad.',
      'assets/Images/2.png'),
  SlidesInfo(
      'Enjoy your email',
      'Deserunt et dolor reprehenderit mollit esse eu est dolor proident.',
      'assets/Images/3.png')
};

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
      print('${pageViewController.page}');
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        PageView(
          controller: pageViewController,
          physics: const BouncingScrollPhysics(),
          children: slides
              .map((slideData) => _Slide(
                  title: slideData.title,
                  caption: slideData.caption,
                  imageURL: slideData.imageURL))
              .toList(),
        ),
        Positioned(
          right: 20,
          top: 50,
          child: ElevatedButton(
            onPressed: () => context.pop(), 
            child: const Text('Skip')
          )
        ),
        endReached
            ? Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight( //animate_do
                  from: 15,
                  delay: const Duration(seconds: 1),
                  child: FilledButton(
                    child: const Text('Start'),
                    onPressed: () => context.pop(),
                  ),
                )
              ): const SizedBox()
      ]),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageURL;

  const _Slide(
      {required this.title, required this.caption, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.titleMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageURL),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
