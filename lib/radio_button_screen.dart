import 'package:flutter/material.dart';

class RadioButtonScreen extends StatefulWidget {
  const RadioButtonScreen({Key? key}) : super(key: key);

  @override
  State<RadioButtonScreen> createState() => _RadioButtonScreenState();
}

class _RadioButtonScreenState extends State<RadioButtonScreen> {
  int _grpValue = 0;
  late String res;
  late Color resColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button'),
      ),
      body: Container(
        child: Column(
          children: [

            const Text('Example 1', textAlign: TextAlign.center,),
            const Text(
              'What is the answer of 4 + 4 ?',
              style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            buildRow(7),
            buildRow(8),
            buildRow(9),
            const Divider(),
            const Text('Example 2', textAlign: TextAlign.center,),
            Container(
              color: _grpValue==0? Colors.brown: Colors.green,
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  buildRadioListTile(0, 'brown', 'Change color to brown'),
                  buildRadioListTile(1, 'green', 'Change color to greed'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  RadioListTile buildRadioListTile( val, txt, subtxt) {
    return RadioListTile(
      controlAffinity: ListTileControlAffinity.trailing,
        title: Text(txt),
        subtitle: Text(subtxt),
        value: val,
        groupValue: _grpValue,
        onChanged: (value) {
          setState(() {
            _grpValue = value;
          });
        });
  }

  myDialog() {
    final ad = AlertDialog(
      content: Container(
        height: 100,
        child: Column(
          children: [
            Text(
              '$res',
              style: TextStyle(color: resColor),
            ),
            Divider(),
            Text('Answer is: 8'),
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (ctx) {
          return ad;
        });
  }

  Row buildRow(int val) {
    return Row(
      children: [
        Radio(
            value: val,
            groupValue: _grpValue,
            onChanged: (value) {
              setState(() {
                _grpValue = value!;
                res = val == 8 ? 'Right answer' : 'Wrong answer';
                resColor = val == 8 ? Colors.green : Colors.red;
                myDialog();
              });
            }),
        Text('$val'),
      ],
    );
  }
}
