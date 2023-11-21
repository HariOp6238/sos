import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos/controller/themecontroller.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';
import 'package:sos/view/more/subscreens/distress_message.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  String _username = "";

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'No Username';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: colorconstant.mybutton),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/men profile.jpg'),
                  radius: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                      color: colorconstant.containerbox,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      ' $_username',
                      style: TextStyle(color: colorconstant.font, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                Icons.message_outlined,
                color: colorconstant.font,
              ),
              title: Text(
                'Distress Message',
                style: TextStyle(fontSize: 16, color: colorconstant.font),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => distressMessage()));
              },
              tileColor: colorconstant.containerbox,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                Icons.light_mode,
                color: colorconstant.font,
              ),
              title: Text(
                'Theme',
                style: TextStyle(fontSize: 16, color: colorconstant.font),
              ),
              onTap: () {},
              tileColor: colorconstant.containerbox,
              trailing: CupertinoSwitch(
                activeColor: Colors.black,
                trackColor: Colors.white60,
                value: Provider.of<ThemeProvider>(context).isDarkMode,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: colorconstant.font,
              ),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 16, color: colorconstant.font),
              ),
              onTap: () {
                _showMyDialog();
              },
              tileColor: colorconstant.containerbox,
            ),
          )
        ],
      ),
    );
  }

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
}
