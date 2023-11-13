import 'package:flutter/material.dart';

class helpDesk extends StatefulWidget {
  const helpDesk({super.key});

  @override
  State<helpDesk> createState() => _helpDeskState();
}

class _helpDeskState extends State<helpDesk> {
  State<helpDesk> createState() => _helpDeskState();
  List<String> helpList = [
    "I am not able to send messages.",
    "I am not able to call.",
    "My app is working correctly.",
    "SMS,Phone,Email.",
    "Other.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: Text(
          "Help Desk",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.6,
            child: ListView.builder(
              itemCount: helpList.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(helpList[index],
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.keyboard_arrow_down_outlined),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 3,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 147),
            child: Container(
              width: double.infinity,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Still have a question?",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("CONTACT",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
