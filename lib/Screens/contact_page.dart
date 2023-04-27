import 'package:contact/Components/my_text_form_field.dart';
import 'package:contact/Screens/select_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/color_const.dart';
import '../HelperFunctions/my_text_style.dart';
import 'Components/select_group_btn.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<String> mySelectedGroup = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 13,
        ),
        child: Column(
          children: [
            const MyTextFormField(
              label: "Name",
              hintText: "Enter your name",
            ),
            const SizedBox(height: 20),
            const MyTextFormField(
              label: "Mobile Number",
              hintText: "Enter your mobile number",
            ),
            const SizedBox(height: 20),
            const MyTextFormField(
              label: "Email",
              hintText: "Enter your email",
            ),
            SelectGroupBtn(
              onTap: () async {
                final selected = await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return  SelectGroup(list: mySelectedGroup);
                    },
                  ),
                );

                mySelectedGroup = selected;

                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
