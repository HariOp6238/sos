import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sos/controller/themecontroller.dart';

import 'package:sos/view/splashscreen/splashscreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: Myapp()));
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light
          // light theme settings
          ),
      darkTheme: ThemeData(brightness: Brightness.dark
          // dark theme settings
          ),
      themeMode: Provider.of<ThemeProvider>(context).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
