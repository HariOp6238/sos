import 'package:flutter/material.dart';

class allergy extends StatefulWidget {
  const allergy({super.key});

  @override
  State<allergy> createState() => _allergyState();
}

class _allergyState extends State<allergy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: Center(
            child: Text(
          "Allergic Reactions",
          style: TextStyle(color: Colors.white, fontSize: 25),
        )),
      ),
    );
  }
}
