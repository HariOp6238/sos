// import 'package:flutter/material.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
// import 'package:sos/view/bottomnavigation/bottombar.dart';

// import 'package:sos/view/more/more.dart';

// class drawer extends StatefulWidget {
//   const drawer({super.key});

//   @override
//   State<drawer> createState() => _drawerState();
// }

// class _drawerState extends State<drawer> {
//   List<ScreenHiddenDrawer> _pages = [];

//   @override
//   void initState() {
//     super.initState();

//     _pages = [
//       ScreenHiddenDrawer(
//           ItemHiddenMenu(
//               name: 'Home', baseStyle: TextStyle(), selectedStyle: TextStyle()),
//           Bottombar()),
//       ScreenHiddenDrawer(
//           ItemHiddenMenu(
//               name: 'More', baseStyle: TextStyle(), selectedStyle: TextStyle()),
//           More()),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HiddenDrawerMenu(
//       backgroundColorMenu: Colors.red,
//       screens: _pages,
//       initPositionSelected: 0,
//     );
//   }
// }
