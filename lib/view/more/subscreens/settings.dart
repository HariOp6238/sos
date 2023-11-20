import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos/controller/themecontroller.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class settings extends StatelessWidget {
  const settings({super.key});

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
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/men profile.jpg'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
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
                leading: Icon(Icons.light_mode,color: colorconstant.font,),
                title: Text("Theme",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                trailing: CupertinoSwitch(
                  activeColor: Colors.black,
                  trackColor: Colors.white60,
                  value: Provider.of<ThemeProvider>(context).isDarkMode,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: colorconstant.containerbox,
                leading: Icon(Icons.location_on,color: colorconstant.font),
                title: Text("Location",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                        trailing: CupertinoSwitch(
                          activeColor: Colors.black,
                          trackColor: Colors.white,
                          value: false, onChanged: (value) {
                        },),
              )),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: colorconstant.containerbox,
                leading: Icon(Icons.call ,color: colorconstant.font),
                title: Text("Calls",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                        trailing: CupertinoSwitch(
                          activeColor: Colors.black,
                          trackColor: Colors.white,
                          value: false, onChanged: (value) {
                        },),
              )),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: colorconstant.containerbox,
                leading: Icon(Icons.message,color: colorconstant.font),
                title: Text("Messages",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                        trailing: CupertinoSwitch(
                          activeColor: Colors.black,
                          trackColor: Colors.white,
                          value: false, onChanged: (value) {
                        },),
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
