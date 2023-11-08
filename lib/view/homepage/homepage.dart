import 'package:flutter/material.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            color: colorconstant.mybutton,
          )
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: colorconstant.mybutton,
        ),
      ),
      backgroundColor: colorconstant.myprimary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 400,
              height: 100,
              child: Column(
                children: [
                  Text(
                    'Are You In An Emergency ?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      '''Press the SoS button Your distresss message and Location  will be sent to emergency contacts and personal contacts''',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: colorconstant.inactivebutton,
              radius: 100,
              child: Center(
                child: Text(
                  'SoS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              width: 400,
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your current Location..📌',
                    style: TextStyle(
                        color: colorconstant.font, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'India,kerala,Kochi kakkanad L16..📍,',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Whats your Emergency ?',
              style: TextStyle(
                  color: colorconstant.font,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Container(
              height: 50,
              width: 150,
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
