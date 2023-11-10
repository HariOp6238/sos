import 'package:flutter/material.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

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
          style: TextStyle(fontSize: 25),
        ),
      ),
      backgroundColor: colorconstant.myprimary,
      body: SafeArea(
          child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: optionslist.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
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
      )),
    );
  }
}
