import 'package:flutter/material.dart';

class Dislocated extends StatefulWidget {
  const Dislocated({super.key});

  @override
  State<Dislocated> createState() => _DislocatedState();
}

class _DislocatedState extends State<Dislocated> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold( appBar: AppBar(
          backgroundColor: Colors.red.shade700,
          title: Center(
              child: Text(
            "Dislocated Joints",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )),
        ),
    );
  }
}