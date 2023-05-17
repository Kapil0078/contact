import 'package:contact/Components/custom_icon_btn.dart';
import 'package:contact/Components/leading_icon_btn.dart';
import 'package:contact/HelperFunctions/my_text_style.dart';
import 'package:flutter/material.dart';
import '../../Constants/color_const.dart';

class UserDetails extends StatelessWidget {
  final Map<String, dynamic> contact;
  const UserDetails({
    super.key,
    required this.contact,
  });

  Widget keyValue({
    required String key,
    required String value,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "\u2739 ",
                  style: MyTextStyle.bold.copyWith(
                    color: Colors.black.withOpacity(0.30),
                  ),
                ),
                TextSpan(
                  text: key,
                  style: MyTextStyle.medium.copyWith(
                    color: ColorConst.grey400,
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.5),
            child: Text(
              value,
              style: MyTextStyle.bold.copyWith(
                color: ColorConst.black,
                fontSize: 15.5,
              ),
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const LeadingIconBtn(),
        title: Text("${contact["name"]}'s details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 13,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 80,
                height: 80,
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
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Image.asset(
                          "assets/Images/placeholder.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomIconBtn(
                    svgPath: "assets/icons/phone.svg",
                    iconColor: Colors.blueAccent,
                    background: Colors.blueAccent.withOpacity(0.1),
                    size: 35,
                    onTap: () {},
                  ),
                  const SizedBox(width: 10),
                  CustomIconBtn(
                    svgPath: "assets/icons/sms.svg",
                    size: 35,
                    iconColor: Colors.purple,
                    background: Colors.purple.withOpacity(0.1),
                    onTap: () {},
                  ),
                  const SizedBox(width: 10),
                  CustomIconBtn(
                    svgPath: "assets/icons/whatsapp2.svg",
                    size: 35,
                    onTap: () {},
                    background: Colors.teal.withOpacity(0.1),
                    colorFilter: const ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.difference,
                    ),
                  ),
                  const SizedBox(width: 10),
                  CustomIconBtn(
                    svgPath: "assets/icons/mail.svg",
                    size: 35,
                    onTap: () {},
                    background: Colors.redAccent.withOpacity(0.1),
                    colorFilter: const ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.difference,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            keyValue(
              key: "Name",
              value: contact['name'],
            ),
            const SizedBox(height: 10),
            keyValue(
              key: "Mobile",
              value: contact['mobile'],
            ),
            const SizedBox(height: 10),
            if (contact['email'] != null && contact['email'].isNotEmpty) ...[
              keyValue(
                key: "E-mail",
                value: contact['email'],
              ),
              const SizedBox(height: 10),
            ],
            if (contact['dob'] != null && contact['dob'].isNotEmpty) ...[
              keyValue(
                key: "Date of birth",
                value: contact['dob'],
              ),
              const SizedBox(height: 10),
            ],
            if (contact['group'].isNotEmpty) ...[
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "\u2739 ",
                      style: MyTextStyle.bold.copyWith(
                        color: Colors.black.withOpacity(0.30),
                      ),
                    ),
                    TextSpan(
                      text: "Group",
                      style: MyTextStyle.medium.copyWith(
                        color: ColorConst.grey400,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.5),
                child: Row(
                  children: List.generate(
                    contact['group'].length,
                    (index) {
                      bool haveComma =
                          (contact['group'].length - 1 == index) ? false : true;
                      return Text(
                        "${contact['group'][index]} ${haveComma ? ", " : ""} ",
                        style: MyTextStyle.bold.copyWith(
                          color: ColorConst.black,
                          fontSize: 15.5,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
