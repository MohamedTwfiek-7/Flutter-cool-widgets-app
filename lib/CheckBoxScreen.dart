import 'package:flutter/material.dart';

class CheckBoxScreen extends StatefulWidget {
  const CheckBoxScreen({Key? key}) : super(key: key);

  @override
  State<CheckBoxScreen> createState() => _CheckBoxScreenState();
}

class _CheckBoxScreenState extends State<CheckBoxScreen> {
  bool js = false;
  bool cSharp = false;
  bool python = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chech Box Example'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Please, select Programming languages'),
            CheckboxListTile(
                title: Text('JS'),
                value: js,
                onChanged: (value) {
                  setState(() {
                    js = value!;
                  });
                }),
            CheckboxListTile(
                title: Text('C#'),
                value: cSharp,
                onChanged: (value) {
                  setState(() {
                    cSharp = value!;
                  });
                }),
            CheckboxListTile(
                title: Text('python'),
                value: python,
                onChanged: (value) {
                  setState(() {
                    python = value!;
                  });
                }),
            ElevatedButton(
              onPressed: () {
                myDialog();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  myDialog() {
    String dialogContent = '';
    if (js == true) {
      dialogContent += 'Java script, ';
    }
    if (cSharp == true) {
      dialogContent += 'C#, ';
    }
    if (python == true) {
      dialogContent += 'python, ';
    } else if (dialogContent == '') {
      dialogContent += 'No selections?\n         Wierd!!';
    }
    final ad = AlertDialog(
      content: Container(
        height: 100,
        child: Column(
          children: [
            const Text(
              'You have selected:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(dialogContent),
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
}
