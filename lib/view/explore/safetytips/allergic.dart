import 'package:flutter/material.dart';
import 'package:sos/database/safetytip/safetytipdb.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class allergy extends StatefulWidget {
  const allergy({super.key});

  @override
  State<allergy> createState() => _allergyState();
}

class _allergyState extends State<allergy> {
  final List<Map<String, dynamic>> data = SafetyDatabase.getallergic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: Text(
          "Allergic Reactions",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              separatorBuilder: (context, index) => Container(
                  height: 240,
                  width: double.infinity,
                  child: Image.asset(
                    data[index]['image'],
                    fit: BoxFit.fill,
                  )),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]['title'],
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Text(data[index]['title']),
                        Text(
                          data[index]['description'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    height: MediaQuery.sizeOf(context).height * 0.25,
                    width: 300,
                    color: colorconstant.containerbox),
              ),
            )
          ],
        ),
      ),
    );
  }
}
