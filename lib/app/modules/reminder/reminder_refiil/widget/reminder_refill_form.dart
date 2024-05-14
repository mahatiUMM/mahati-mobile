import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget reminderRefillForm() {
  return Card(
    elevation: 0,
    color: Resources.color.whiteColor,
    child: Column(
      children: [
        TextField(
          // controller: controller.passwordController,
          // obscureText: controller.showPassword.value,
          decoration: InputDecoration(
            filled: true,
            fillColor: Resources.color.textFieldColor,
            // hintText: TextStrings.authSubtitle1,
            // hintStyle: StyleText.signInField,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Resources.color.textFieldColor),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Resources.color.textFieldColor),
                borderRadius: BorderRadius.circular(15)),
            // suffixIcon: IconButton(
            //   icon: Icon(
            //     controller.showPassword.value
            //         ? Icons.visibility
            //         : Icons.visibility_off,
            //     color: Colors.black54,
            //   ),
            //   onPressed: () {
            //     controller.toggleObscureText();
            //   },
            // ),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Title',
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Left',
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Refill',
          ),
        ),
      ],
    ),
  );
}
