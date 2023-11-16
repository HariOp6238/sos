import 'package:flutter/material.dart';
import 'package:sos/database/safetytip/disasterdb/disasterdb.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class tusnami extends StatelessWidget {
  const tusnami({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = Database.gettsunamiData();
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
                    image: AssetImage('assets/tsunami.jpg'), fit: BoxFit.fill)),
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
              padding: EdgeInsets.all(10),
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
                    'Being prepared and staying informed are crucial elements of tsunami safety. Regular practice of evacuation plans and awareness of community resources will contribute to a more effective response in the event of a tsunami.',
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
