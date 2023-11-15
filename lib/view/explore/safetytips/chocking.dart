import 'package:flutter/material.dart';

class chocking extends StatefulWidget {
  const chocking({super.key});

  @override
  State<chocking> createState() => _chockingState();
}

class _chockingState extends State<chocking> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold( appBar: AppBar(
          backgroundColor: Colors.red.shade700,
          title: Center(
              child: Text(
            "Chocking",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )),
        ),
    );
  }
}