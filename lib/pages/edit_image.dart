import 'package:flutter/material.dart';
import 'package:flutter_user_profile/user/user_data.dart';
import 'package:flutter_user_profile/widgets/appbar_widget.dart';

class EditImagePage extends StatefulWidget {
  const EditImagePage({Key? key}) : super(key: key);

  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  var user = UserData.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(10),
        child:Column(
        children: <Widget>[
          Image.network(user.image),
          Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 375,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                            },
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
}
