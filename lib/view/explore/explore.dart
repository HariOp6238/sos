import 'package:flutter/material.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    List mycontats = [
      "Safety tips",
      "Disaster preparedeness",
      "Health centers around me",
      "Real time incidents"
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade700,
          title: Center(child: Text("Explore",style: TextStyle(color: Colors.white,fontSize: 25),)),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Get acess to some information on how to attend to emergency",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colorconstant.secondoryfont, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.white,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: mycontats.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorconstant.containerbox,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                mycontats[index],
                                style: TextStyle(color:colorconstant.font),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward,
                                color: colorconstant.font,
                              ),
                            )
                          ],
                        ),
                        height: 60,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
