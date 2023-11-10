import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';



class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact> _contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: FutureBuilder(
        future: _getContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                Contact contact = _contacts[index];
                return ListTile(
                  title: Text(contact.displayName ?? ''),
                  subtitle: Text("gjhvhfh"
                      ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchContactsAppToAddContact();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _getContacts() async {
    // Request permission to access contacts
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      // Get the contacts
      Iterable<Contact> contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts.toList();
      });
    } else {
      // Permission denied
      print('Permission denied');
    }
  }

  void _launchContactsAppToAddContact() async {
    const url = 'content://com.android.contacts/contacts/new';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch contacts app');
    }
  }
}
