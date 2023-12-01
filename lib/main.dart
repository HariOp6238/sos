import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sos/controller/provider/Contactprovider.dart';
import 'package:sos/controller/provider/newsapi.dart';
import 'package:sos/controller/provider/themeprovider.dart';
import 'package:sos/model/model.dart';

import 'package:sos/view/splashscreen/splashscreen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(contactmodelAdapter());
  await Hive.openBox<contactmodel>('contact');

  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ContactProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => NewsProvider(),
          ),
        ],
        child: Builder(builder: (BuildContext context) {
          final themechanger = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            themeMode:
                themechanger.isdakmode ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: Splashscreen(),
          );
        }));
  }
}
