import 'package:flutter/material.dart';

class Burn extends StatefulWidget {
  const Burn({super.key});

  @override
  State<Burn> createState() => _BurnState();
}

class _BurnState extends State<Burn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
          backgroundColor: Colors.red.shade700,
          title: Center(
              child: Text(
            "Burn",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )),
        ),
    );
  }
}