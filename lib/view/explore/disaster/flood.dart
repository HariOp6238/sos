import 'package:flutter/material.dart';
import 'package:sos/database/safetytip/disasterdb/disasterdb.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class flood extends StatefulWidget {
  const flood({super.key});

  @override
  State<flood> createState() => _floodState();
}

class _floodState extends State<flood> {
  final List<Map<String, dynamic>> data = Database.getfloodData();
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
                    image: AssetImage('assets/3.jpg'), fit: BoxFit.fill)),
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
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  decoration: BoxDecoration(
                      color: colorconstant.containerbox,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index]['title'],
                        style: TextStyle(
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
                        style:
                            TextStyle(fontSize: 16, color: colorconstant.font),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data[index]['description'],
                        textAlign: TextAlign.justify,
                        style:
                            TextStyle(fontSize: 16, color: colorconstant.font),
                      ),
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
                    'Remember to adapt these precautions based on your specific location and the type of flooding that may occur in your area. Always follow the guidance of local authorities during a flood emergency.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: colorconstant.secondoryfont),
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
