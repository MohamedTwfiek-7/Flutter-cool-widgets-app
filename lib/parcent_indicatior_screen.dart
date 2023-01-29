import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercantIndicatorScreen extends StatefulWidget {
  const PercantIndicatorScreen({Key? key}) : super(key: key);

  @override
  State<PercantIndicatorScreen> createState() => _PercantIndicatorScreenState();
}

class _PercantIndicatorScreenState extends State<PercantIndicatorScreen> {
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percent Indicator Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 130.0,
              animation: true,
              animationDuration: 700,
              lineWidth: 15.0,
              percent: value,
              center: Text(
                'Percent Indicator',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.square,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
            Slider(
                divisions: 10,
                min: 0.0,
                max: 1.0,
                value: value,
                onChanged: (val) => setState(() {
                      value = val;
                    })),
          ],
        ),
      ),
    );
  }
}
