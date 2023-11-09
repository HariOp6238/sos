import 'package:flutter/material.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  List <String> optionslist = [
  "Settings",
  "Help and Support",
  "About",
  "Privacy and Policy",
  "Distress Message"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorconstant.mybutton,
        centerTitle: true,
        title: Text("More Options",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      backgroundColor: colorconstant.secondoryfont,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Container(
                  height: 600,
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
                            color: colorconstant.mybutton),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(optionslist[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                            ),
                      ),
                    ),
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
