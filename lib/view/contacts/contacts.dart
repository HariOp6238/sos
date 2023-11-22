// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

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
  HomePageController controllerObj = HomePageController();

  get selectedOption => null;

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
  final numberController = TextEditingController();
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    List mypersonalcontatsname = [
      "Police",
      "Ambalance",
      "Fireforce",
      "National Emergency ",
      "Disaster Management "
    ];
    List mypersonalcontactnumber = [
      "100",
      "102",
      "101",
      "112",
      "108",
    ];
    int? number;
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
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(child: Text("ADD CONTACTS")),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                scrollable: true,
                content: Column(
                  children: [
                    CircleAvatar(
                      child: Image.asset("assets/emergency_contact.jpg"),
                      radius: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "enter the name"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: numberController,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "enter the phone number"),
                    ),
                  ],
                ),
                actions: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("cancel")),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red[700])),
                      onPressed: () async {
                        {
                          setState(() {
                            number = int.parse(numberController.text);
                            print(number);
                          });

                          Navigator.pop(context);
                          //funciton to add employee to database
                          await HomePageController.addDatatoDb(
                              name: nameController.text, number: number!);

                          // funciton to get data from data base after adding new data
                          await controllerObj.getAllDataFromDb();
                          setState(() {});
                        }
                        ;
                      },
                      child: Text("save"))
                ],
              ),
            ),
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
                          width: 5,
                        ),
                        Text(
                          (controllerObj.myModelList[index].name),
                          style: TextStyle(
                              color: colorconstant.font,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        IconButton(
                          onPressed: () {
                            _makePhoneCall(
                                phone: controllerObj.myModelList[index].number
                                    .toString());
                            print(controllerObj.myModelList[index].name);
                          },
                          icon: Icon(Icons.call, color: colorconstant.font),
                        ),
                        IconButton(
                            onPressed: () {
                              _launchSMS(
                                  phone: controllerObj.myModelList[index].number
                                      .toString());
                            },
                            icon: Icon(Icons.message)),
                        IconButton(onPressed: () {
                      HomePageController.delectdata(id:index);
                      setState(() {
                        fetchData();
                      });
                        }, icon: Icon(Icons.delete)),
                        
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
                        SizedBox(width: 20,),
                        Text(
                          mypersonalcontatsname[index],
                          style: TextStyle(
                              color: colorconstant.font,
                              fontWeight: FontWeight.bold),
                        ),
                       Spacer(),
                        IconButton(
                          onPressed: () => _makePhoneCall(
                              phone: mypersonalcontactnumber[index]),
                          icon: Icon(Icons.call, color: colorconstant.font),
                        ),
                        IconButton(
                            onPressed: () {
                              _launchSMS(phone: mypersonalcontactnumber[index]);
                            },
                            icon: Icon(Icons.message)),
                            SizedBox(width: 10,)
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
          'Personal',
          'General',
        ],
      ),
    );
  }

  _makePhoneCall({required String phone}) async {
    // The phone number you want to call
    final String phoneNumber = 'tel:${phone}';

    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      print('Could not launch $phoneNumber');
    }
  }

  _launchSMS({required String phone}) async {
    String phoneNumber = 'tel:${phone}';
    final String message =
        'An emergency situation is when a crime is actually happening, whether that is violence or threatened violence, or any form of danger to a life.'; // Replace with your desired message

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
