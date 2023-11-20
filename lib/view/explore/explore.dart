import 'package:flutter/material.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';
import 'package:sos/view/explore/disaster/disaster.dart';
import 'package:sos/view/explore/health/health.dart';
import 'package:sos/view/explore/realtime/realtime.dart';
import 'package:sos/view/explore/safetytips/safetytips.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<String> optionslist = [
    "Safety Tips",
    "Disaster preparednes",
    "Health centers around me",
    "Real time incidents",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: Text(
          "Explore",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: optionslist.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => navigate(context, index),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorconstant.containerbox),
              child: Center(
                  child: Text(optionslist[index],
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))),
            ),
          ),
        ),
      )),
    );
  }
}

void navigate(BuildContext context, int pageindex) {
  switch (pageindex) {
    case 0:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Safety(),
          ));
      break;
    case 1:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Disaster(),
          ));
      break;
    case 2:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Health(),
          ));
      break;
    case 3:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Real(),
          ));
      break;
  }
}
