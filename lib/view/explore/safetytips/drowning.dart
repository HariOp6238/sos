import 'package:flutter/material.dart';

class Drowning extends StatefulWidget {
  const Drowning({super.key});

  @override
  State<Drowning> createState() => _DrowningState();
}

class _DrowningState extends State<Drowning> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold( appBar: AppBar(
          backgroundColor: Colors.red.shade700,
          title: Center(
              child: Text(
            "Drowning",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )),
        ),
    );
  }
}