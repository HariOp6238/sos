import 'package:flutter/material.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';
import 'package:sos/view/more/subscreens/about.dart';
import 'package:sos/view/more/subscreens/distress_message.dart';
import 'package:sos/view/more/subscreens/helpdesk.dart';
import 'package:sos/view/more/subscreens/privacypolicy.dart';
import 'package:sos/view/more/subscreens/settings.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  List<String> optionslist = [
    "Settings",
    "Distress Message",
    "Help and Support",
    "About",
    "Privacy and Policy",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: Text(
          "More Options",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: optionslist.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => navigateToPage(context, index),
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

void navigateToPage(BuildContext context, int pageindex) {
  switch (pageindex) {
    case 0:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => settings(),
          ));
      break;
    case 1:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DistressMessage(),
          ));
      break;
    case 2:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExpansionPanelListExample(),
          ));
      break;
    case 3:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => About(),
          ));
      break;
    case 4:
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => privacyPolicy(),
          ));
      break;
  }
}
