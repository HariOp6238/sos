import 'package:flutter/material.dart';
import 'package:sos/controller/contactclass.dart';

import 'package:sos/view/splashscreen/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HomePageController.initDb();
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
