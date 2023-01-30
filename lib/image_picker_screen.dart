import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;

  fitchImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      pickedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fitchImage();
        },
        tooltip: 'Add photo',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Image Picker Screen'),
      ),
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: EdgeInsets.all(20),
          scaleEnabled: true,
            maxScale: 50.0,
            minScale: 0.1,
            child: pickedImage == null
                ? const Text('please, add image')
                : Image.file(pickedImage!)),
      ),
    );
  }
}
