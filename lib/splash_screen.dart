import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cool_widgets/main.dart';
class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            child: EasySplashScreen(
              loadingText: Text('splash screen'),
              logo: Image.asset('images/image3.jpg'),
              logoWidth: 170,
              backgroundColor: Colors.blueAccent,
              showLoader: false,

              navigator: MyApp(),
            ),
          ),
        ),
      ),
    );
  }
}
