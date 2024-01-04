// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sos/model/model.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';
import 'package:sos/view/explore/safetytips/safetytips.dart';
import 'package:sos/view/hiddendrawer/hiddendrawer.dart';
import 'package:sos/view/notification/noti.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  _makePhoneCall(String phoneNumber) async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  void initState() {
    _requestLocationPermission();
    _getcurrentlocation();

    setState(() {});
    super.initState();
  }

  bool isAnimating = false;

  //location access
  String locationtext = 'Location:Fetching....';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => noti()));
            },
            icon: Icon(Icons.notifications),
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 400,
                height: MediaQuery.sizeOf(context).width * 0.4,
                child: Column(
                  children: [
                    Text(
                      'Are You In An Emergency ?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        '''Press the SoS button Your distresss message and Location  will be sent to emergency contacts and personal contacts''',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showDialogWithTimer(context);
                  startAnimation();
                },
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 100,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Lottie.asset(
                            'assets/animations/Animation - 1699885262478.json',
                            animate: isAnimating),
                        Positioned(
                            child: Text(
                          'SoS',
                          style: TextStyle(color: colorconstant.myprimary),
                        ))
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: colorconstant.containerbox,
                    borderRadius: BorderRadius.circular(20)),
                width: 400,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '  Your current Location..📌',
                      style: TextStyle(
                          color: colorconstant.font,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      locationtext,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Whats your Emergency ?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  //  first line emergency column
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _makePhoneCall('tel:101');
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 50,
                            color: colorconstant.containerbox,
                            child: Center(
                                child: Text(
                              'Fire...🔥',
                              style: TextStyle(
                                  color: colorconstant.secondoryfont,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Safety(),
                              ));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50,
                            color: colorconstant.containerbox,
                            child: Center(
                                child: Text(
                              'Safety Tips🦺',
                              style: TextStyle(
                                  color: colorconstant.secondoryfont,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))),
                      )
                    ],
                  ),
                  //  second line emergency column
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          _makePhoneCall("tel:100");
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50,
                            color: colorconstant.containerbox,
                            child: Center(
                                child: Text(
                              'Police...👮',
                              style: TextStyle(
                                  color: colorconstant.secondoryfont,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _makePhoneCall("tel:102");
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 50,
                            color: colorconstant.containerbox,
                            child: Center(
                                child: Text(
                              'Ambulance...🚑',
                              style: TextStyle(
                                  color: colorconstant.secondoryfont,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))),
                      )
                    ],
                  ),
                  // third line emergency coloumn
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _makePhoneCall("tel:112");
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 50,
                            color: colorconstant.containerbox,
                            child: Center(
                                child: Text(
                              'Rescue...🚨',
                              style: TextStyle(
                                  color: colorconstant.secondoryfont,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _makePhoneCall("tel:04711070");
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 50,
                            color: colorconstant.containerbox,
                            child: Center(
                                child: Text(
                              'Earthquake...🌏',
                              style: TextStyle(
                                  color: colorconstant.secondoryfont,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

//*************Button animation****************//
  void startAnimation() {
    setState(() {
      isAnimating = true;
    });

    // Delay for 3 seconds and then stop the animation
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isAnimating = false;
      });
    });
  }

// Location permission
  Future<void> _requestLocationPermission() async {
    // Request location permission
    final status = await Permission.location.request();

    // Check if permission is granted
    if (status == PermissionStatus.granted) {
      // Permission granted, proceed with getting the current location
      _getcurrentlocation();
    } else {
      // Permission not granted, handle the case accordingly (e.g., show a message to the user)
      print('Location permission not granted');
      // You may want to show an error message or take some other action here
    }
  }

  Future<void> _getcurrentlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      setState(() {
        locationtext = 'Location:${place.locality},${place.country}';
      });
    } catch (e) {
      print('Error Getting Location: $e');
    }
  }

  void _showDialogWithTimer(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialog();
      },
    );
  }
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  List mylist = [];
  loaddata() async {
    Box<contactmodel> mybox = Hive.box<contactmodel>('contact');

    for (int i = 0; i < mybox.length; i++) {
      mylist.add(mybox.getAt(i)?.Phonenumber.toString());
    }
    print(mylist);
  }

  late Timer _timer;
  int _secondsRemaining = 5; // Set the duration of the timer in seconds

  @override
  void initState() {
    super.initState();

    // Initialize the timer
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_secondsRemaining == 0) {
        // When the timer reaches 0, close the dialog
        Navigator.of(context).pop();
        _timer.cancel();
        _showsnackbar('message canceled'); // Cancel the timer
      } else {
        // Update the remaining time
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Caution!',
        style: TextStyle(color: Colors.red),
      ),
      content: Text(
        'Press confrim to sent message in $_secondsRemaining seconds.',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            // Manually close the dialog and cancel the timer
            Navigator.of(context).pop();
            _timer.cancel();
            ScaffoldMessenger(child: SnackBar(content: Text('canceled')));
            _showsnackbar('Message cancelled');
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            // Manually close the dialog and cancel the timer
            Navigator.of(context).pop();
            _showsgreennackbar('Message Sent');
            _launchSMS(['9847889637', '8590207046']);
          },
          child: Text(
            'Confirm',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  void _showsnackbar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        content: Center(child: Text(value))));
  }

  void _showsgreennackbar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
        content: Center(child: Text(value))));
  }

  _launchSMS(List<String> phoneNumbers) async {
    final String message =
        'This a Distress message please help ! i am in an emergency situation'; // Replace with your desired message

    // Construct the SMS URL with the recipient's phone numbers and the message
    final Uri uri = Uri.parse('sms:${phoneNumbers.join(',')}?body=$message');

    // Check if the URL can be launched
    if (await canLaunchUrl(uri)) {
      // Launch the messaging app
      await launchUrl(uri);
    } else {
      // Handle error
      print('Could not launch SMS');
    }
  }
}
