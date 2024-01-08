import 'package:flutter/material.dart';
import 'package:sos/utils/constant/colorconstant/colors.dart';

class distressMessage extends StatelessWidget {
  const distressMessage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController messagecontroller = TextEditingController();
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
                                  color: Colors.black))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colorconstant.containerbox),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "This a Distress message please help ! i am in a Emergency situation",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.justify,
                          ),
                        )),
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
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        autofocus: true,
                        maxLines: 5,
                        textAlign: TextAlign.center,
                        controller: messagecontroller,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 50),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "enter the name"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  actions: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          messagecontroller.clear();
                        },
                        child: Text("cancel")),

                    // save button
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red[700])),
                        onPressed: () {
                          //******************** save to hive**************************//
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ))
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
                )),
                decoration: BoxDecoration(
                    color: colorconstant.inactivebutton,
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
