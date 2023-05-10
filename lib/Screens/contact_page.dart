import 'dart:developer';

import 'package:contact/Screens/contact_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/color_const.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      floatingActionButton: InkWell(
        onTap: () async {
         Map<String,dynamic>? userInfo = await Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ContactInput(),
            ),
          );

         log('userInfo => $userInfo');
        },
        borderRadius: BorderRadius.circular(60),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConst.appPrimary,
          ),
          child: const Icon(
            Icons.add_call,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
