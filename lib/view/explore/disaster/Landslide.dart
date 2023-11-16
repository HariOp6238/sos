import 'package:flutter/material.dart';
import 'package:sos/database/safetytip/disasterdb/disasterdb.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class Landslide extends StatefulWidget {
  const Landslide({super.key});

  @override
  State<Landslide> createState() => _LandslideState();
}

class _LandslideState extends State<Landslide> {
  final List<Map<String, dynamic>> data = Database.getlandslideData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Precaution'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1,
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/landslide.jpg'),
                    fit: BoxFit.fill)),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: colorconstant.containerbox,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index]['title'],
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data[index]['subtitle'],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: colorconstant.font,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Text(
                      //   data[index]['description'],
                      //   textAlign: TextAlign.justify,
                      //   style:
                      //       TextStyle(fontSize: 16, color: colorconstant.font),
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1,
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: BoxDecoration(
                  color: colorconstant.containerbox,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Text(
                    'Please Note !',
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    'Being proactive and staying informed is crucial for landslide preparedness. If you notice any signs of potential landslides or receive evacuation orders, follow them promptly to ensure your safety and the safety of your family.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: colorconstant.secondoryfont,
                      height: 1.5,
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
