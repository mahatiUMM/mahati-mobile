import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/constants/text_strings.dart';
import 'package:mahati_mobile/app/utils/constants/text_style.dart';

Widget greetingWidget(String username) {
  return Padding(
    padding: const EdgeInsets.only(top: 70.0, left: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hai, $username',
          style: StyleText.homeGreeting1,
        ),
        Text(
          TextStrings.homeGreeting,
          style: StyleText.homeGreeting2,
        ),
      ],
    ),
  );
}
