import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerScreen extends StatefulWidget {
  const ColorPickerScreen({Key? key}) : super(key: key);

  @override
  State<ColorPickerScreen> createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  Color currColor = Colors.teal;

  void changeColor(Color c) => setState(() {
        currColor = c;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Picker Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: currColor),
          child: const Text('Change my color'),
          onPressed: () {
            showDialog(context: context, builder: (BuildContext ctx) {
              return AlertDialog(
                title: const Text('Select a color, please'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      child: MaterialPicker(
                        //availableColors: _defaultColors,for block picker
                        enableLabel: true,
                        pickerColor: currColor,
                        onColorChanged: changeColor,//the new color in the context it will not called in the function
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pop(ctx);
                    }, child: const Text('Close')),
                  ],
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
