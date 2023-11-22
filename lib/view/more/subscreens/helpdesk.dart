import 'package:flutter/material.dart';
import 'package:sos/view/more/subscreens/about.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<String> helpList = [
  "I am not able to send messages.",
  "I am not able to call.",
  "My app is not working correctly.",
  "SMS,Phone,Email.",
  "Other.",
];

List<String> dropDownList = [
  "If you cannot send text messages to one person on your Android device and they are not blocked from messages or calls, try clearing your messaging apps cache. This will delete the apps temp data and hopefully fix the issue..",
  "Because your Android smartphone won’t make or receive calls, you might find yourself in the middle of nowhere when it comes to contacting friends and family. There can be a number of reasons and we have created this article to go over a few potential causes and workarounds for why that occurs. Since there are a lot of smartphones from various brands, we have especially taken care of providing solutions to work on most Android devices.",
  "Apps not working on Android phones could be a result of various issues. However, it is caused by bad updates in most cases.  Apps are updated frequently to introduce new features, improve on the existing ones, fix known issues, and improve security. However, updates can introduce deadly bugs sometimes too, causing the app or your phone to malfunction.",
  "If you are having trouble sending texts on your Android phone, it could be that something is wrong with your Android, the recipient, or the mobile service provider.Fortunately, fixing the problem is usually pretty easy. In fact, the first thing you should do is ensure that you have a decent signal — without network connectivity, those texts aren't going anywhere. If the signal is good and the messages still aren't going through, there are a few troubleshooting steps you can do to fix an Android that won't send texts.",
  "Apps not working on Android phones could be a result of various issues. However, it is caused by bad updates in most cases.   Apps are updated frequently to introduce new features, improve on the existing ones, fix known issues, and improve security. However, updates can introduce deadly bugs sometimes too, causing the app or your phone to malfunction.",
];

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: helpList[index],
      expandedValue: dropDownList[index],
    );
  });
}

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({super.key});

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  final List<Item> _data = generateItems(helpList.length);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: _buildPanel(),
            ),
            Container(
              width: double.infinity,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Still have a question?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextButton(
                      child: Text(
                        "Contact",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => About(),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item.headerValue,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          },
          body: ListTile(
              title: Text(
                item.expandedValue,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.send),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
