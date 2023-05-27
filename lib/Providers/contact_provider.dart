import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> contactList = [];

  // create new user
  void createContact({required Map<String, dynamic> contact}) {
    debugPrint('ProviderClass : contact => $contact');
    contactList.add(contact);
    notifyListeners();
  }

  // delete user
  void deleteContact({required Map<String, dynamic> contact}) {
    contactList.remove(contact);
    notifyListeners();
  }

  // updateContact
  void updateContact({
    required int index,
    required Map<String, dynamic> contact,
  }) {
    debugPrint('index : $index -> $contact');
    contactList[index] = contact;
    notifyListeners();
  }
}
