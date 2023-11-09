import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  Iterable<Contact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  Future<void> _getContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  Future<void> _addContact() async {
    Contact newContact = Contact(
      givenName: 'John',
      familyName: 'Doe',
      emails: [Item(label: 'work', value: 'john.doe@example.com')],
      phones: [Item(label: 'mobile', value: '+1234567890')],
    );

    await ContactsService.addContact(newContact);
    _getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _addContact,
            child: Text('Add Contact'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                Contact contact = _contacts.elementAt(index);
                return ListTile(
                  title: Text('${contact.givenName} ${contact.familyName}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}