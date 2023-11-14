// import 'package:flutter/foundation.dart';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';
import 'package:sos/view/introscreen/IntroScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Lottie.asset('assets/animations/welcome.json',
                    repeat: false, height: 300, width: 300),
              ),
              Text(
                'Welcome !',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                ''' Let's Create An Account''',
                style:
                    TextStyle(fontSize: 15, color: colorconstant.secondoryfont),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: namecontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade400,
                    hintText: 'Enter Your Name',
                    hintStyle: TextStyle(color: Colors.grey.shade800),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: phonecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade400,
                    hintText: 'Enter Your Phone Number',
                    hintStyle: TextStyle(color: Colors.grey.shade800),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => IntroScreen()));
                },
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                      color: colorconstant.inactivebutton,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(color: colorconstant.myprimary),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
