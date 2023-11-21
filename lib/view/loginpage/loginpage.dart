import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (!isKeyboard) SizedBox(),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autofillHints: [AutofillHints.name],
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  controller: namecontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      hintText: 'Enter Your Name',
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autofillHints: [AutofillHints.telephoneNumber],
                  controller: phonecontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade400,
                      hintText: 'Enter Your Phone Number',
                      hintStyle: TextStyle(color: Colors.grey.shade800),
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: _login,
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

  void _login() async {
    // Get the values from the text controllers
    String name = namecontroller.text;
    String password = phonecontroller.text;

    // Validate the fields
    if (name.isEmpty ||
        password.isEmpty ||
        password.length < 10 ||
        password.length > 10 ||
        !RegExp('[0-9]').hasMatch(password)) {
      _showValidationMessage("Username and PhoneNumber are required.");
      return;
    }

    // Save the values to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', name);
    prefs.setString('PhoneNumber', password);

    // Navigate to the HomeScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => IntroScreen()),
    );
  }

  void _showValidationMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
