import 'package:flutter/material.dart';

class cutswoods extends StatefulWidget {
  const cutswoods({super.key});

  @override
  State<cutswoods> createState() => _cutswoodsState();
}

class _cutswoodsState extends State<cutswoods> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold( appBar: AppBar(
          backgroundColor: Colors.red.shade700,
          title: Center(
              child: Text(
            "Cuts and Woods",
            style: TextStyle(color: Colors.white, fontSize: 25),
          )),
        ),
    );
  }
}