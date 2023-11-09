import 'package:flutter/material.dart';
// import 'package:sos/view/homepage/homepage.dart';
// import 'package:sos/view/bottomnavigation/bottombar.dart';
// import 'package:sos/view/homepage/homepage.dart';
import 'package:sos/view/introscreen/IntroScreen.dart';
// import 'package:sos/view/introscreen/introScreen.dart';
// import 'package:sos/view/introscreen/introScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => IntroScreen(),
            )));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.indigoAccent,
        ),
      ),
    );
  }
}
