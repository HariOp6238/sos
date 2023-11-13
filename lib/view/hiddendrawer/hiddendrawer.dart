import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sos/controller/themecontroller.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';
import 'package:sos/view/more/subscreens/distress_message.dart';
import 'package:sos/view/more/subscreens/settings.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colorconstant.myprimary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: colorconstant.mybutton),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.cyan,
                  radius: 30,
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
                      'User',
                      style: TextStyle(color: colorconstant.font),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Edit Profile',
                style: TextStyle(fontSize: 16, color: colorconstant.font),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => settings(),
                    ));
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
              leading: Icon(Icons.light_mode),
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
              leading: Icon(Icons.message),
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
          )
        ],
      ),
    );
  }
}
