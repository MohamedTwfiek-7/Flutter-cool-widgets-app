import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cool_widgets/CheckBoxScreen.dart';
import 'package:flutter_cool_widgets/DropDownButtonScreen.dart';
import 'package:flutter_cool_widgets/ExpandableListScreen.dart';
import 'package:flutter_cool_widgets/form_screen.dart';
import 'package:flutter_cool_widgets/image_picker_screen.dart';
import 'package:flutter_cool_widgets/image_slider_screen.dart';
import 'package:flutter_cool_widgets/list_wheel_scroll_view_screen.dart';
import 'package:flutter_cool_widgets/parcent_indicatior_screen.dart';
import 'package:flutter_cool_widgets/switch_screen.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_cool_widgets/radio_button_screen.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'color_picker_screen.dart';
import 'dismissible_screen.dart';

void main() {
  runApp(const SplashScreenPage());
}

ThemeMode tm = ThemeMode.light;

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
        '/Check-Box-Screen': (ctx) => const CheckBoxScreen(),
        '/Switch-Screen': (ctx) => const SwitchScreen(),
        '/Drop-Down-Button-Screen': (ctx) => const DropDownButtonScreen(),
        '/Expandable-List-Screen': (ctx) => const ExpandableListscreen(),
        '/Image-Picker-Screen': (ctx) => const ImagePickerScreen(),
        '/Color-Picker-Screen': (ctx) => const ColorPickerScreen(),
        '/Dismissible-Screen': (ctx) => const DismissibleScreen(),
        '/Percent_Indicator-Screen': (ctx) => const PercantIndicatorScreen(),
        '/ListWheel-ScrollView-Screen': (ctx) => const ListWheelScrollViewscreen(),
        '/Form-Screen': (ctx) => const FormScreen(),
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
                              child: Text('show toast',
                                  textAlign: TextAlign.center),
                            ),
                          ), //toast
                          ElevatedButton(
                            onPressed: () {
                              final alert = AlertDialog(
                                content: Container(
                                  height: 100,
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
                                barrierColor:
                                Colors.blueAccent.withOpacity(0.5),
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
                          ), //image slider
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
                          ), //radio buttons
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/Check-Box-Screen');
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text('Check Box Screen',
                                  textAlign: TextAlign.center),
                            ),
                          ), //check box
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/Switch-Screen');
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text('Switch Screen',
                                  textAlign: TextAlign.center),
                            ),
                          ), //Switch
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/Drop-Down-Button-Screen');
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text('DropDown Button Screen',
                                  textAlign: TextAlign.center),
                            ),
                          ), //DropDown button
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/Expandable-List-Screen');
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text('Expandable List Screen',
                                  textAlign: TextAlign.center),
                            ),
                          ), //Expandable list
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/Image-Picker-Screen');
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text('Image Picker Screen',
                                  textAlign: TextAlign.center),
                            ),
                          ), //Image  picker
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/Color-Picker-Screen');
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text('Color Picker Screen',
                                  textAlign: TextAlign.center),
                            ),
                          ), //Color  picker
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/Dismissible-Screen');
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text('Dismissible Screen',
                                  textAlign: TextAlign.center),
                            ),
                          ), //Dismissible
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/Percent_Indicator-Screen');
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text('Percent Indicator Screen',
                                  textAlign: TextAlign.center),
                            ),
                          ), // percent indication
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/ListWheel-ScrollView-Screen');
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text('ListWheel ScrollView Screen',
                                  textAlign: TextAlign.center),
                            ),
                          ), // ListWheel-ScrollView
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('/Form-Screen');
                            },
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text('Form Screen',
                                  textAlign: TextAlign.center),
                            ),
                          ), // ListWheel-ScrollView
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
