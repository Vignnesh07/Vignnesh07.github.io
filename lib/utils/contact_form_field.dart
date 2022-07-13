import 'package:flutter/material.dart';

class ContactFormFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  final String validatorText;

  const ContactFormFieldWidget({
    Key? key,
    required this.controller, 
    required this.label, 
    required this.validatorText, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: label == "What's on your mind?" ? 7 : 1,
      cursorHeight: 20.0,
      cursorWidth:  1.0,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: (value) {
        if (label == "Your name") {
          return value!.isEmpty ? validatorText : null;
        }
        else if (label == "Your email") {
          return !(value!.contains('@')) ? validatorText : null;
        }
        else{
          return value!.isEmpty ? validatorText : null;
        }
      },
    );
  }
}