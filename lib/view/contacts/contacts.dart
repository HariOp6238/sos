// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';


import 'package:tab_container/tab_container.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    List myGenralcontatsname = [
      "police",
      "fire",
    ];
    List myGenaralcontactnumber = [
      "100",
      "101",
    ];
    List mypersonalcontatsname = ["mom", "dad", "friend"];
    List mypersonalcontactnumber = ["9497654426", "9887638790", "8848253276"];

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(
          "Emergency Contacts",
        ),
        backgroundColor: Colors.red.shade700,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 500,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text("Add Contact"),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("personal"),
                            Checkbox(value: false, onChanged:(value) => true,),
                            Text("general"),
                            Checkbox(value: false, onChanged:(value) => true,),
                            CircleAvatar(
                              child: Image.asset(""),
                            )
                            
                          ],
                        )
                        
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(Icons.contact_emergency))
        ],
        elevation: 0,
      ),
      body: TabContainer(
        color: colorconstant.myprimary,
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: myGenaralcontactnumber.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorconstant.containerbox,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          myGenaralcontactnumber[index],
                          style: TextStyle(
                              color: colorconstant.font,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        IconButton(
                          onPressed: () => _makePhoneCall(
                              phone: myGenaralcontactnumber[index]),
                          icon: Icon(Icons.call, color: colorconstant.font),
                        )
                      ],
                    ),
                    height: 70,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: mypersonalcontatsname.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorconstant.containerbox,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          mypersonalcontatsname[index],
                          style: TextStyle(
                              color: colorconstant.font,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        IconButton(
                          onPressed: () => _makePhoneCall(
                              phone: mypersonalcontactnumber[index]),
                          icon: Icon(Icons.call, color: colorconstant.font),
                        )
                      ],
                    ),
                    height: 70,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ),
        ],
        tabs: [
          'General',
          'Personal',
        ],
      ),
    );
  }
}

_makePhoneCall({required String phone}) async {
  // The phone number you want to call
  final String phoneNumber = 'tel:+${phone}';

  if (await canLaunch(phoneNumber)) {
    await launch(phoneNumber);
  } else {
    print('Could not launch $phoneNumber');
  }
}
