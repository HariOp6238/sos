import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class DistressMessage extends StatefulWidget {
  const DistressMessage({Key? key}) : super(key: key);

  @override
  State<DistressMessage> createState() => _DistressMessageState();
}

class _DistressMessageState extends State<DistressMessage> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
        title: Text(
          "Message Options",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          text: "Your Message",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colorconstant.containerbox,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ValueListenableBuilder(
                              valueListenable: Hive.box<String>('distress_messages').listenable(),
                              builder: (context, Box<String> box, _) {
                                var savedMessage = box.get('message', defaultValue: '');
                                return Text(
                                  savedMessage.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.justify,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(child: Text("Edit Message")),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  scrollable: true,
                  content: Column(
                    children: [
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        autofocus: true,
                        maxLines: 5,
                        textAlign: TextAlign.center,
                        controller: messageController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 50),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Enter the message",
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  actions: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        messageController.clear();
                      },
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.red[700] ?? Colors.red),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        saveMessage(messageController.text);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              child: Container(
                width: 200,
                height: 50,
                child: Center(
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: colorconstant.inactivebutton,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveMessage(String message) async {
    var box = await Hive.openBox<String>('distress_messages');
    await box.put('message', message);
    print("Message saved: $message");
  }
}
