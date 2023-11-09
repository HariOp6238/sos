import 'package:flutter/material.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';
import 'package:sos/view/contacts/contacts.dart';
import 'package:sos/view/explore/explore.dart';
import 'package:sos/view/homepage/homepage.dart';
import 'package:sos/view/more/more.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';

import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _selectedIndex = 0; // Index of the selected tab

  // List of widgets that correspond to each tab
  List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    Contact(),
    Explore(),
    More()
  ];

  // Function to handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        backgroundColor: Colors.grey.shade300,
        option: AnimatedBarOptions(
          iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.home,
            ),
            selectedIcon: const Icon(Icons.home),
            selectedColor: Colors.red,
            //backgroundColor: Colors.black,
            title: const Text('Home'),
          ),
          BottomBarItem(
            icon: const Icon(Icons.phone),
            selectedIcon: const Icon(Icons.phone),
            selectedColor: Colors.red,
            // unSelectedColor: Colors.purple,
            // backgroundColor: Colors.orange,
            title: const Text('Contacts'),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.explore_outlined,
              ),
              selectedIcon: const Icon(
                Icons.explore_outlined,
              ),
              //backgroundColor: Colors.amber,
              selectedColor: Colors.red,
              title: const Text('Explore')),
          BottomBarItem(
              icon: const Icon(
                Icons.menu,
              ),
              selectedIcon: const Icon(
                Icons.menu,
              ),
              //backgroundColor: Colors.purpleAccent,
              selectedColor: Colors.red,
              title: const Text('More')),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Text(
          'SoS',
          style: TextStyle(color: colorconstant.myprimary),
        ),
        backgroundColor: colorconstant.inactivebutton,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
