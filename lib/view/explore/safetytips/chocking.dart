import 'package:flutter/material.dart';
import 'package:sos/database/safetytip/safetytipdb.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class chocking extends StatefulWidget {
  const chocking({super.key});

  @override
  State<chocking> createState() => _chockingState();
}

class _chockingState extends State<chocking> {
  final List<Map<String, dynamic>> data = chokedatabase.getchoke();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: Text(
          "Chocking",
          style: TextStyle(color: Colors.white, fontSize: 18),
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
                        Text(
                          data[index]['subtitle1'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data[index]['description1'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                        Text(
                          data[index]['subtitle2'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data[index]['description2'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                        Text(
                          data[index]['subtitle3'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data[index]['description3'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                        Text(
                          data[index]['subtitle4'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data[index]['description4'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
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
