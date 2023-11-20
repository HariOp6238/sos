import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:sos/model/newsmodels.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';
import 'package:http/http.dart' as http;

class Real extends StatefulWidget {
  const Real({super.key});

  @override
  State<Real> createState() => _RealState();
}

class _RealState extends State<Real> {
  late bool _isloading;
  @override
  void initState() {
    _isloading = true;
    fetchdata();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isloading = false;
      });
    });

    super.initState();
  }

  Publicapiresponse? Newapi;

  fetchdata() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=rain&apiKey=c5e2f5e2b2c04bdfa3105fbc6e239c89');

    var response = await http.get(url);
    var decodedata = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print('status code = ${response.statusCode}');
    } else {
      print('Error loading data');
    }
    setState(() {
      Newapi = Publicapiresponse.fromJson(decodedata);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: Text(
          "Real time News",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // for better visualization shimmer is used
          _isloading
              ? Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => newscardskeleton(),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 16,
                          ),
                      itemCount: 6))
              : Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: Newapi?.articles?.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorconstant.containerbox),
                          child: Row(
                            children: [
                              Container(
                                  width: 100,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(
                                    Newapi?.articles?[index].urlToImage
                                            .toString() ??
                                        'https://st3.depositphotos.com/1322515/35964/v/600/depositphotos_359648638-stock-illustration-image-available-icon.jpg',
                                    fit: BoxFit.fill,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: 200,
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        Newapi?.articles?[index].title
                                                .toString() ??
                                            '',
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: colorconstant.mybutton),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 220,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      Newapi?.articles?[index].description
                                              .toString() ??
                                          '',
                                      maxLines: 5,
                                      style: TextStyle(
                                          height: 1.5,
                                          color: colorconstant.font),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class newscardskeleton extends StatelessWidget {
  const newscardskeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        skeleton(
          height: 120,
          width: 120,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            skeleton(
              height: 30,
              width: 200,
            ),
            SizedBox(
              height: 10,
            ),
            skeleton(
              width: 200,
              height: 60,
            )
          ],
        ))
      ],
    );
  }
}

class skeleton extends StatelessWidget {
  const skeleton({super.key, this.height, this.width});
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16)),
    );
  }
}
