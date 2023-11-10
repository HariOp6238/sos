import 'package:flutter/material.dart';

class distressMessage extends StatelessWidget {
  const distressMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: Text(
          "Message Options",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
