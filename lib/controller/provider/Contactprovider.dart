import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sos/model/model.dart';

class ContactProvider with ChangeNotifier {
  static List datalist = [];
  List<contactmodel> mymodellist = [];
  late Box<contactmodel> _contactsBox;

  ContactProvider() {
    _contactsBox = Hive.box<contactmodel>('contacts');
  }

  List<contactmodel> get contacts => _contactsBox.values.toList();

  void addContact(contactmodel newContact) {
    _contactsBox.add(newContact);
    notifyListeners();
  }

  void updateContact(contactmodel updatedContact) {
    updatedContact.save();
    notifyListeners();
  }

  void deleteContact(contactmodel deletedContact) {
    deletedContact.delete();
    notifyListeners();
  }
}
