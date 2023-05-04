import 'dart:developer';
import 'dart:io';

import 'package:contact/Components/my_text_form_field.dart';
import 'package:contact/HelperFunctions/my_image_crop.dart';
import 'package:contact/Screens/select_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Components/choose_option_card.dart';
import '../Components/choose_options_bottom_sheet.dart';
import '../Constants/color_const.dart';
import '../HelperFunctions/choose_photo.dart';
import '../HelperFunctions/my_text_style.dart';
import 'Components/select_group_btn.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<String> mySelectedGroup = [];
  File? imageFile;

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
            InkWell(
              onTap: () async {
                File? file = await showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  context: context,
                  builder: (context) {
                    return const ChooseOptionsBottomSheet();
                  },
                );
                if (file != null) {
                 File? croppedFile =  await  myImageCropper(
                    file: file,
                    context: context,
                  );

                  if(croppedFile!=null){
                    setState(() {
                      imageFile = croppedFile;
                    });

                  }

                }
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.black.withOpacity(0.2),
                ),
                child: ClipOval(
                  child: imageFile != null
                      ? Image.file(
                          imageFile!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/Images/placeholder.jpg",
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
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
                      return SelectGroup(list: mySelectedGroup);
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
