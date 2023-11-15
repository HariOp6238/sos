import 'package:flutter/material.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class Disaster extends StatefulWidget {
  const Disaster({super.key});

  @override
  State<Disaster> createState() => _DisasterState();
}

class _DisasterState extends State<Disaster> {
   List<String> Disasterlist = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: Text(
          "Disaster preparedeness",
          style: TextStyle(fontSize: 25),
        ),
      ),
      backgroundColor: colorconstant.myprimary,
      body: SafeArea(
          child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: Disasterlist.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          // child: InkWell(
          //   onTap: () => navigates(context, index),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorconstant.containerbox),
              child: Center(
                  child: Text(Disasterlist[index],
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))),
            ),
          ),
        ),
      ),
    );
  }
}

// void navigates(BuildContext context, int pageindex) {
//   switch (pageindex) {
//     case 0:
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => allergy(),
//           ));
//       break;
//     case 1:
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Burn(),
//           ));
//       break;
//     case 2:
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => chocking()));
//       break;
//     case 3:
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => cutswoods(),
//           ));
//       break;
//     case 4:
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => Dislocated()));

//       break;
//     case 5:
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Drowning(),
//           ));
//       break;
//   }
// }