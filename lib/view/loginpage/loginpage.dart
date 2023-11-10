// import 'package:flutter/foundation.dart';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sos/view/introscreen/IntroScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
            height: 120,
            width: 120,
            child: Image.asset(
              "assets/logo.png",
              fit: BoxFit.cover,
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey.shade300,
                filled: true,
                hintText: "Name",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey.shade300,
                filled: true,
                hintText: "Phone No",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IntroScreen(),
                  ));
            },
            child: Text("Next"),
          )
        ],
      ),
    );
  }
}
