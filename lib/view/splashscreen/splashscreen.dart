import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.red,
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.indigoAccent,
        ),
      ),
=======
      backgroundColor: Colors.amber,
>>>>>>> 97a4ac58fea8fec5d3739c11980b4663006bf98e
    );
  }
}
