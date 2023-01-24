import 'package:flutter/material.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool swVal = false;
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swich screen'),
      ),
      body: Container(
        color: bgColor,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(40.0),
                child: Text('Light'),
              ),
              Switch(
                  activeColor: Colors.black54,
                  inactiveThumbColor: Colors.blue,
                  value: swVal,
                  onChanged: (bool value) {
                    setState(() {
                      swVal = value;

                      if (swVal == false)
                        bgColor = Colors.white;
                      else
                        bgColor = Colors.black54;
                    });
                  }),
              const Padding(
                padding: EdgeInsets.all(40.0),
                child: Text('Dark'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
