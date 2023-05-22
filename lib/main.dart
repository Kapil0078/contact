import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Constants/color_const.dart';
import 'Screens/contact_page.dart';

late SharedPreferences pref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact',
      theme: ThemeData(
        fontFamily: "Nunito",
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: ColorConst.appPrimary,
          centerTitle: true,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Nunito",
            fontSize: 20.5,
          ),
        ),
        // checkboxTheme: CheckboxThemeData(
        //   fillColor: MaterialStateProperty.all(ColorConst.appPrimary),
        //   // checkColor: MaterialStateProperty.all(Colors.pink),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(50),
        //   ),

        //   materialTapTargetSize: MaterialTapTargetSize.padded,
        // ),
      ),
      // home: const ContactPage(),
      home: const MyLocalStorage(),
    );
  }
}

class MyLocalStorage extends StatefulWidget {
  const MyLocalStorage({super.key});

  @override
  State<MyLocalStorage> createState() => _MyLocalStorageState();
}

class _MyLocalStorageState extends State<MyLocalStorage> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController controller = TextEditingController();

  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("LocalStorage : ${pref.getBool("1")} ${pref.getString("2")}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: pref.getBool("1") ?? false,
              onChanged: (update) async {
                value = update!;
                await pref.setBool("1", value);

                bool myStoreValue = pref.getBool("1") ?? false;

                log("myStoreValue : $myStoreValue");

                setState(() {});
              },
            ),
            TextFormField(
              controller: controller,
            ),
            ElevatedButton(
              onPressed: () async {
                await pref.setString(
                  "2",
                  controller.text.trim(),
                );

                setState(() {});
              },
              child: Text("Save"),
            ),
            Text("userInput : ${pref.getString("2")}"),
          ],
        ),
      ),
    );
  }
}
