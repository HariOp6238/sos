// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:sos/controller/contactclass.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

import 'package:tab_container/tab_container.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  String phoneNumber = '8590207046';
  HomePageController controllerObj = HomePageController();

  @override
  void initState() {
    //for fetching initial data
    fetchData();
    super.initState();
  }

  fetchData() async {
    //get all data form datbase
    await controllerObj.getAllDataFromDb();
    setState(() {});
  }

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List myGenaralcontactnumber = [
      "100",
      "101",
    ];
    List mypersonalcontatsname = ["mom", "dad", "friend"];
    List mypersonalcontactnumber = ["9497654426", "9887638790", "8848253276"];

    return Scaffold(
      backgroundColor: Colors.red.shade700,
      appBar: AppBar(
        title: Text(
          "Emergency Contacts",
        ),
        backgroundColor: Colors.red.shade700,
        actions: [
          IconButton(
            icon: Icon(Icons.contact_emergency),
              onPressed: () => showDialog(context: context, builder: (context) => AlertDialog(
                title: Center(child: Text("ADD CONTACTS")),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  
                ),
                scrollable: true,
                content: Column(
                  children: [
                    CircleAvatar(radius: 30,),
                    SizedBox(height: 10,),
                    TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "enter the name"),
                          ),
                          SizedBox(height: 10,),
                    TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "enter the phone number"),
                          ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("personal"),
                            Checkbox(
                              value: false,
                              onChanged: (value) => true,
                            ),
                            Text("general"),
                            Checkbox(
                              value: false,
                              onChanged: (value) => true,
                            ),
                          ],
                        ),
                  ],
                ),
                actions: [
                  
                  OutlinedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("cancel")),
                  ElevatedButton(
                            onPressed: () async {
                              {
                                  Navigator.pop(context);
                                //funciton to add employee to database
                                await HomePageController.addDatatoDb(
                                    name: nameController.text);

                                // funciton to get data from data base after adding new data
                                await controllerObj.getAllDataFromDb();
                                setState(() {});
                              }
                              ;
                            },
                            child: Text("save"))
                ],

              ),),
              )
        ],
        elevation: 0,
      ),
      body: TabContainer(
        color: colorconstant.myprimary,
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: controllerObj.myModelList.length,
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
                          (controllerObj.myModelList[index].name),
                          style: TextStyle(
                              color: colorconstant.font,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        IconButton(
                          onPressed: () => _makePhoneCall(
                              phone: controllerObj.myModelList[index].name),
                          icon: Icon(Icons.call, color: colorconstant.font),
                        ),
                        IconButton(
                            onPressed: () {
                              _launchSMS();
                            },
                            icon: Icon(Icons.message))
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
                        ),
                        IconButton(
                            onPressed: () {
                              _launchSMS();
                            },
                            icon: Icon(Icons.message))
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

  _makePhoneCall({required String phone}) async {
    // The phone number you want to call
    final String phoneNumber = 'tel:+${phone}';

    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      print('Could not launch $phoneNumber');
    }
  }

  _launchSMS() async {
    //String phoneNumber = '8590207046';
    final String message =
        'Hello, this is a sample text message!'; // Replace with your desired message

    // Construct the SMS URL with the recipient's phone number and the message

    final Uri uri = Uri.parse('sms:$phoneNumber,?body=$message');

    // Check if the URL can be launched
    if (await canLaunch(uri.toString())) {
      // Launch the messaging app
      await launch(uri.toString());
    } else {
      // Handle error
      print('Could not launch SMS');
    }
  }
}
