import 'package:flutter/material.dart';

class safetydb extends StatefulWidget {
  const safetydb({super.key});

  @override
  State<safetydb> createState() => _safetydbState();
}

class _safetydbState extends State<safetydb> {
  List<String> safetytips = [
    "Allergic reactions",
    "Burn",
    "Chocking",
    "Cuts and wounds",
    "Dislocated joints",
    "Drowning",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
              "If you or someone you know has known allergies, it's important to take certain safety precautions to minimize the risk of allergic reactions. Here are some safety tips for dealing with allergic reactions:"),
          Text(
            "1.	Know Your Allergens:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          Text(
            "2.	Carry Medications:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          Text(
            "3.	Wear Medical Alert Identification:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          Text(
            "4.	Educate Others:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          Text(
            "5.	Read Labels:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          Text(
            "6.	Communicate with Restaurants and Food Providers:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          Text(
            "7.	Plan for Travel:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          Text(
            "8.	Allergy Testing:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          Text(
            "9.	Read Labels:",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          
          
        ],
      ),
    );
  }
}
