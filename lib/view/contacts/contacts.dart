import 'package:flutter/material.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

import 'package:sos/view/contacts/detailsScreen.dart';
import 'package:tab_container/tab_container.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    List mycontats = ["police", "fire", "mom", "dad", "friend"];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Emergency Contacts",
        ),
        backgroundColor: colorconstant.mybutton,
        actions: [
         IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ContactList(),));
         }, icon:Icon(Icons.contact_emergency))
        ],
        elevation: 0,
      ),
      body: TabContainer(
        radius: 0,
        color: Colors.grey[800],
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: mycontats.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorconstant.mybutton,
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 40,),
                        Text(
                          mycontats[index],
                          style: TextStyle(color: colorconstant.myprimary),
                        ),
                        SizedBox(width: 200,),
                        IconButton(onPressed: () {}, icon: Icon(Icons.call,color: colorconstant.myprimary),)
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
                  itemCount: mycontats.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colorconstant.mybutton,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 40,),
                          Text(
                            mycontats[index],
                            style: TextStyle(color: colorconstant.myprimary),
                          ),
                          SizedBox(width: 200,),
                          IconButton(onPressed: () {}, icon: Icon(Icons.call,color: colorconstant.myprimary),)
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
