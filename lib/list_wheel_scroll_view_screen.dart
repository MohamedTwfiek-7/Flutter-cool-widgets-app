import 'package:flutter/material.dart';

class ListWheelScrollViewscreen extends StatefulWidget {
  const ListWheelScrollViewscreen({Key? key}) : super(key: key);

  @override
  State<ListWheelScrollViewscreen> createState() =>
      _ListWheelScrollViewscreenState();
}

class _ListWheelScrollViewscreenState extends State<ListWheelScrollViewscreen> {
  static const List<String> monthList = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec',
    'this',
    'comes',
    'to',
    'end',
  ];

  List<Color> colorList = List.generate(monthList.length, (index) => Colors.primaries[index]);

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Wheel Scroll view Screen'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: ListWheelScrollView(
          itemExtent: 100, //
          children: [
            ...monthList.map((String month) {
              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorList[i++],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.red),
                ),
                child: Center(
                  child: Text(
                    month,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
