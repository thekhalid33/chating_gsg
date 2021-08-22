import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextEditingController textEditingController = TextEditingController();
  CustomTextField({this.label, this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            labelText: this.label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
      ),
    );
  }
}
