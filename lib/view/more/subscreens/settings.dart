import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos/controller/provider/themeprovider.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';
import 'package:sos/view/more/subscreens/profile.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  File? _image;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadImageFromPrefs();
  }

  Future<void> _loadImageFromPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    final String? imagePath = _prefs.getString('profile_image');

    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // logout permission
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Alert !',
              style: TextStyle(color: colorconstant.mybutton),
            ),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Do You Want to Logout'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'Approve',
                  style: TextStyle(color: colorconstant.mybutton),
                ),
                onPressed: () async {
                  final SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.remove('username');
                  preferences.remove('profile_image');

                  SystemNavigator.pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: _image != null
                  ? CircleAvatar(
                      radius: 70,
                      backgroundImage: FileImage(_image!),
                    )
                  : CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/men profile.jpg'),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => profilePage(),
                    ));
              },
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorconstant.containerbox),
                child: Center(
                  child: Text("Edit Profile",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(color: colorconstant.font),
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: colorconstant.containerbox,
                leading: Icon(
                  Icons.light_mode,
                  color: colorconstant.font,
                ),
                title: Text("Theme",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                trailing: CupertinoSwitch(
                  activeColor: Colors.black,
                  trackColor: Colors.white60,
                  value: Provider.of<ThemeProvider>(context).isdakmode,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .Toggletheme();
                  },
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: colorconstant.containerbox,
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text("Logout",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  _showMyDialog();
                },
              )),
        ],
      ),
    );
  }
}
