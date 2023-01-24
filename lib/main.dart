import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cool_widgets/image_slider_screen.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_cool_widgets/radio_button_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(),
      routes: {
        '/Image-Slider-Screen': (ctx) => const ImageSliderScreen(),
        '/Radio-Button-Screen': (ctx) => const RadioButtonScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String str = 'Flutter Cool Widgets';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 50,
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.leaderboard),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.pending_actions),
                )
              ],
              centerTitle: true,
              title: Text(
                str,
                style: const TextStyle(color: Colors.black),
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurpleAccent,
                      Colors.redAccent,
                      Colors.deepPurpleAccent,
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            showToast(
                              'This is normal toast with animation',
                              context: context,
                              animation: StyledToastAnimation.scale,
                              reverseAnimation: StyledToastAnimation.fade,
                              position: StyledToastPosition.bottom,
                              animDuration: const Duration(seconds: 4),
                              duration: const Duration(seconds: 8),
                              curve: Curves.elasticOut,
                              reverseCurve: Curves.linear,
                            );
                          },
                          child: const SizedBox(
                            width: double.infinity,
                            child:
                                Text('show toast', textAlign: TextAlign.center),
                          ),
                        ), //toast
                        ElevatedButton(
                          onPressed: () {
                            final alert = AlertDialog(
                              content: Container(
                                height: 80,
                                child: Column(
                                  children: [
                                    const Divider(color: Colors.black),
                                    const Text("Alert dialog Content"),
                                    const SizedBox(height: 7),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              title: const Text('Alert title'),
                            );
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return alert;
                              },
                              barrierDismissible: false,
                              barrierColor: Colors.blueAccent.withOpacity(0.5),
                            );
                          },
                          child: const SizedBox(
                            width: double.infinity,
                            child: Text('show Alert dialog',
                                textAlign: TextAlign.center),
                          ),
                        ), //alert dialog
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              str = 'you pressed snack bar ';
                            });
                            final snackBar = SnackBar(
                              duration: const Duration(seconds: 8),
                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              content: const Text('Snack bar content'),
                              action: SnackBarAction(
                                textColor: Colors.black,
                                label: 'Undo',
                                onPressed: () {
                                  setState(() {
                                    str = 'Flutter Cool Widgets';
                                  });
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: const SizedBox(
                            width: double.infinity,
                            child: Text('show Snack-bar',
                                textAlign: TextAlign.center),
                          ),
                        ), //snack-bar
                        ElevatedButton(
                          onPressed: () {
                            Flushbar(
                              duration: const Duration(seconds: 3),
                              flushbarPosition: FlushbarPosition.TOP,
                              mainButton: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Close',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              icon: const Icon(
                                Icons.info,
                                color: Colors.red,
                              ),
                              backgroundColor: Colors.amber,
                              title: 'Flush-bar title',
                              //message: 'Flush-Bar message',
                              messageText: const Text(
                                'Flush-Bar Message text with style',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ).show(context);
                          },
                          child: const SizedBox(
                            width: double.infinity,
                            child: Text('show Flush-Bar',
                                textAlign: TextAlign.center),
                          ),
                        ), //flush-bar
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/Image-Slider-Screen');
                          },
                          child: const SizedBox(
                            width: double.infinity,
                            child: Text('Image Slider Screen',
                                textAlign: TextAlign.center),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/Radio-Button-Screen');
                          },
                          child: const SizedBox(
                            width: double.infinity,
                            child: Text('Radio Button Screen',
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
