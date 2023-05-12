import 'dart:developer';
import 'dart:io';
import 'package:contact/HelperFunctions/my_text_style.dart';
import 'package:contact/Screens/contact_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/custom_icon_btn.dart';
import '../Constants/color_const.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final File file = File(
    "/data/user/0/com.example.contact/cache/image_cropper_1683898733356.jpg",
  );

  List<Map<String, dynamic>> contactList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      floatingActionButton: InkWell(
        onTap: () async {
          Map<String, dynamic>? userInfo = await Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ContactInput(),
            ),
          );

          if (userInfo != null) {
            contactList.add(userInfo);
            setState(() {});
          }

          log('contactList => $contactList');
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 13,
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 55),
          itemCount: contactList.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic> contact = contactList.elementAt(index);
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: ColorConst.grey400,
                    width: 0.45,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: contact["profile"] != null
                          ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: ColorConst.appPrimary,
                            width: 0.75,
                          ),
                        ),
                            child: ClipOval(
                              child: Image.file(
                                contact["profile"],
                              ),
                            ),
                          )
                          : Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.35),
                                border: Border.all(
                                  width: 0.35,
                                  color: Colors.black,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  contact['name']
                                      .substring(0, 1)
                                      .toString()
                                      .toUpperCase(),
                                  style: MyTextStyle.bold.copyWith(
                                    color: ColorConst.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contact['name'],
                          style: MyTextStyle.semiBold.copyWith(
                            color: ColorConst.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          contact['mobile'],
                          style: MyTextStyle.regular.copyWith(
                            color: ColorConst.grey,
                            fontSize: 13.5,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomIconBtn(
                      svgPath: "assets/icons/sms.svg",
                      onTap: () {},
                    ),
                    const SizedBox(width: 15),
                    CustomIconBtn(
                      svgPath: "assets/icons/phone.svg",
                      size: 0,
                      onTap: () {},
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
