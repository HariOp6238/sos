import 'package:flutter/material.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> settingsList = ["Theme", "Logout"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 320),
          //   child: Container(height: 70,width: 70,child: Image.asset("assets/logo.png"),),
          // ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/men profile.jpg'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 250,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorconstant.containerbox),
              child: Center(
                child: Text("Edit Profile",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(color: colorconstant.font),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorconstant.containerbox),
              child: Center(
                  child: Text("Theme",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorconstant.containerbox),
              child: Center(
                  child: Text("Logout",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))),
            ),
          ),
        ],
      ),
    );
  }
}
