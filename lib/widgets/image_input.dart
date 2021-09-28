import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  // const ImageInput({Key? key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  XFile? _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final _imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600.0,
    );

    setState(() {
      _storedImage = _imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100.0,
          width: 200.0,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  File(_storedImage!.path),  // _stored image changes from xfile to file
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Found',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.camera),
            label: Text(
              'Take picture',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
