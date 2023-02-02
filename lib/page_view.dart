import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cool_widgets/splash_screen.dart';

class Data {
  final String title;
  final String description;
  final String imageURL;
  final IconData iconData;

  Data(
      {required this.title,
      required this.description,
      required this.imageURL,
      required this.iconData});
}

class Pview extends StatefulWidget {
  const Pview({Key? key}) : super(key: key);

  @override
  State<Pview> createState() => _PviewState();
}

class _PviewState extends State<Pview> {
  int _currInx = 0;
  final List<Data> myData = [
    Data(
        title: 'Title 1',
        description: 'we are gonna little trip in my favorite rocket ship',
        imageURL: 'images/q1.jpg',
        iconData: Icons.add_box),
    Data(
        title: 'Title 2',
        description: 'we are gonna little trip in my favorite rocket ship',
        imageURL: 'images/q2.jpg',
        iconData: Icons.add_circle),
    Data(
        title: 'Title 3',
        description: 'we are gonna little trip in my favorite rocket ship',
        imageURL: 'images/q3.jpg',
        iconData: Icons.add_card_outlined),
    Data(
        title: 'Title 4',
        description: 'we are gonna little trip in my favorite rocket ship',
        imageURL: 'images/q4.jpg',
        iconData: Icons.add_comment),
  ];

  final PageController _controller = PageController();

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 6), (timer) {
      if (_currInx < 3) _currInx++;
      _controller.animateToPage(_currInx,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/SplashScreen': (ctx) => const SplashScreenPage(),
      },
      home: Scaffold(
        body: Stack(
          children: [
            Builder(
              builder: (ctx) => PageView(
                controller: _controller,
                children: [
                  ...myData.map((item) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(item.imageURL),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item.iconData,
                            size: 130,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            item.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            item.description,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  })
                ],
                onPageChanged: (val) {
                  setState(() {
                    _currInx = val;
                    if (_currInx == 3) {
                      Future.delayed(
                          const Duration(seconds: 2),
                          () => Navigator.of(ctx)
                              .pushReplacementNamed('/SplashScreen'));
                    }
                  });
                },
              ),
            ),
            PageIndicator(_currInx),
            Builder(
              //will not get a context error when u navigate
              builder: (ctx) => Align(
                alignment: const Alignment(0, 0.95), //center x=0, y=0
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: const EdgeInsets.all(7),
                    ),
                    onPressed: () {
                      Navigator.of(ctx).pushReplacementNamed('/SplashScreen');
                    },
                    child: const Text('Get Started'),
                  ),
                ),
              ),
            ), //get start button
          ],
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final int inx;

  PageIndicator(this.inx);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContainer(0),
          buildContainer(1),
          buildContainer(2),
          buildContainer(3),
        ],
      ),
    );
  }

  Widget buildContainer(int i) {
    return inx != i
        ? Container(
            margin: EdgeInsets.all(4),
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
            ),
          )
        : Icon(Icons.star,color: Colors.deepOrangeAccent,);
  }
}
