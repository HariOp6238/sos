import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sos/controller/provider/newsapi.dart';

import 'package:sos/utils/constant/colorconstant/colors.dart';
import 'package:url_launcher/url_launcher.dart';

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
    Provider.of<NewsProvider>(context, listen: false).fetchdata();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isloading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newprovider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: Text(
          "Real Time News",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // for better visualization shimmer is used
            _isloading
                ? Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => Shimmer.fromColors(
                            baseColor: Colors.grey[400]!,
                            highlightColor: Colors.grey[300]!,
                            child: newscardskeleton()),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 16,
                            ),
                        itemCount: 7))
                : Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: newprovider.Newapi?.articles?.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            launchUrl(
                                Uri.parse(newprovider
                                        .Newapi?.articles?[index].url
                                        .toString() ??
                                    ''),
                                mode: LaunchMode.externalApplication);
                          },
                          child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colorconstant.containerbox),
                              child: Row(
                                children: [
                                  Container(
                                      width: 100,
                                      height: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: newprovider
                                                  .Newapi
                                                  ?.articles?[index]
                                                  .urlToImage ==
                                              null
                                          ? Image.network(
                                              'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                                              fit: BoxFit.fill,
                                            )
                                          : Image.network(
                                              newprovider
                                                      .Newapi
                                                      ?.articles?[index]
                                                      .urlToImage
                                                      .toString() ??
                                                  '',
                                              fit: BoxFit.fill,
                                            )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width: 190,
                                        padding: EdgeInsets.all(10),
                                        child: Expanded(
                                          child: Text(
                                            newprovider.Newapi?.articles?[index]
                                                    .title
                                                    .toString() ??
                                                '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
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
                                        width: 190,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          newprovider.Newapi?.articles?[index]
                                                  .description
                                                  .toString() ??
                                              '',
                                          overflow: TextOverflow.ellipsis,
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
                  ),
          ],
        ),
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
              height: 10,
              width: 200,
            ),
            SizedBox(
              height: 10,
            ),
            skeleton(
              width: 200,
              height: 20,
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
          color: Colors.grey, borderRadius: BorderRadius.circular(16)),
    );
  }
}
