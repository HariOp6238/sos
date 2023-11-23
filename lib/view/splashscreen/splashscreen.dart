import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';
import 'package:sos/view/bottomnavigation/bottombar.dart';

import 'package:sos/view/loginpage/loginpage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  //** using shared_pref username is checked null or not  using validation function below**//

  String? finalusername;
  @override
  void initState() {
    Getvalidate().whenComplete(() {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      finalusername == null ? LoginPage() : Bottombar())));
    });

    super.initState();
  }

//** using shared pref username is obtained and assigned to final username**//
  Future<void> Getvalidate() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var obtainedname = preferences.getString('username');
    setState(() {
      finalusername = obtainedname;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Image.asset(
                "assets/logo.png",
                color: Colors.red,
              ),
              height: 120,
              width: 120,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "RAPID",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  // fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(width: 10),
              Text(
                "RESPONCE",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  // fontStyle: FontStyle.italic
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "YOUR SAFETY IS OUR PRIORITY !",
            style: TextStyle(color: colorconstant.secondoryfont),
          )
        ],
      ),
    );
  }
}
