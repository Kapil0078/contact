import 'dart:convert';
import 'package:flutter/material.dart';
import '../HelperFunctions/shered_pref.dart';

class ContactProvider extends ChangeNotifier {
  // final List<Map<String, dynamic>> contactList = [];

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

  // ===== with sheredPrefrences

  List<Map<String, dynamic>> contactList = List<Map<String, dynamic>>.from(
      sheredPref.contact.map((e) => jsonDecode(e))).toList();
}

/*

{name: સાહિલ, mobile: 9977885500, email: sahiltechnism@gmail.com, dob: , group: [], profile: File: '/data/user/0/com.example.contact/cache/image_cropper_1685368524678.jpg'}
 */
