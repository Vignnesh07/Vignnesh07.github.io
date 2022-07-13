import 'package:flutter/material.dart';

import '../constants/controllers.dart';
import 'contact_form_field.dart';

class ContactFormWidget extends StatelessWidget {
  const ContactFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Positioned(
      top: 0.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 180,
            color: const Color.fromARGB(255, 50, 115, 220),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Get In Touch",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontFamily: 'Avenir-Heavy',
                  ),
                ),
                Text(
                  "Let's start something great today!",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontFamily: 'Avenir-Light',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 110,),
          SizedBox(
            width: width / 1.5,
            child: Form(
              key: nameWidgetController.contactFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Avernir-Book'),),
                  const SizedBox(height: 15.0),
                  ContactFormFieldWidget(controller: nameWidgetController.nameCtrl, label: "Your name", validatorText: "Please enter your name"),
                  const SizedBox(height: 30.0),
                  const Text("Email", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Avernir-Book'),),
                  const SizedBox(height: 15.0),
                  ContactFormFieldWidget(controller: nameWidgetController.emailCtrl, label: "Your email", validatorText: "Please enter a valid email"),
                  const SizedBox(height: 30.0),
                  const Text("Message", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Avernir-Book'),),
                  const SizedBox(height: 15.0),
                  ContactFormFieldWidget(controller: nameWidgetController.messageCtrl, label: "What's on your mind?", validatorText: "Please enter your message"),
                  const SizedBox(height: 30.0),
                  MaterialButton(
                    height: 40,
                    visualDensity: VisualDensity.comfortable,
                    color: const Color.fromARGB(255, 50, 115, 220),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    onPressed: () => nameWidgetController.submitContactForm(),
                    child: const Text(
                      "Send", 
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Avenir-Book',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}