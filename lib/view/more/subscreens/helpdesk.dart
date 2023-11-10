import 'package:flutter/material.dart';

class helpDesk extends StatelessWidget {
  const helpDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: Text(
          "Help Desk",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}