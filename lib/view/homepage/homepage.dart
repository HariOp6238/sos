import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';
import 'package:sos/view/hiddendrawer/hiddendrawer.dart';
import 'package:sos/view/notification/noti.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

AudioPlayer audioPlayer = AudioPlayer();

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    _requestLocationPermission();
    _getcurrentlocation();

    setState(() {});
    super.initState();
  }

  bool isAnimating = false;

  //location access
  String locationtext = 'Location: N/A';

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
                  setState(() {
                    isAnimating = !isAnimating;
                  });
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
                      Container(
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
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 50,
                          color: colorconstant.containerbox,
                          child: Center(
                              child: Text(
                            'Medical...🏥',
                            style: TextStyle(
                                color: colorconstant.secondoryfont,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )))
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
                      Container(
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
                      SizedBox(
                        width: 10,
                      ),
                      Container(
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
                          )))
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
                      Container(
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
                      SizedBox(
                        width: 10,
                      ),
                      Container(
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
                          )))
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

  //location permission
  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      _getcurrentlocation();
    } else {}
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
}
