import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_user_profile/user/user_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter_user_profile/widgets/appbar_widget.dart';
import 'package:flutter_user_profile/widgets/display_image_widget.dart';
import 'package:image_picker/image_picker.dart';

class EditImagePage extends StatefulWidget {
  const EditImagePage({Key? key}) : super(key: key);

  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  var user = UserData.myUser;
   late File _image;
  
  void updateUserValue(File value) {
    user.image = value as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _showPicker(context);
                }, child: Image.network(user.image),
              ),


              // DisplayImage(
              //   imagePath: user.image,
              //   onPressed: () async {
              //     final image =
              //         await ImagePicker().getImage(source: ImageSource.gallery);

              //     if (image == null) return;

              //     final location = await getApplicationDocumentsDirectory();
              //     final name = basename(image.path);
              //     final imageFile = File('${location.path}/$name');
              //     final newImage =
              //           await File(image.path).copy(imageFile.path);

              //     setState(() => updateUserValue(newImage));
              //   },
              // ),
              Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 375,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Update',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )))
            ],
          )),
    );
  }

  _imgFromCamera() async {
  File image = (await ImagePicker.pickImage(
    source: ImageSource.camera, imageQuality: 50
  )) as File;

  setState(() {
    _image = image;
  });
}

_imgFromGallery() async {
  File image = (await  ImagePicker.pickImage(
      source: ImageSource.gallery, imageQuality: 50
  )) as File;

  setState(() {
    _image = image;
  });
}
void _showPicker(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
}
}
