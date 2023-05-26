import 'package:flutter/material.dart';

class ConfirmationPopup extends StatelessWidget {
  const ConfirmationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Text("Popup")],
      ),
    );
  }
}
