import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/constants/text_strings.dart';
import 'package:mahati_mobile/app/utils/constants/text_style.dart';

class GreetingWidget extends StatelessWidget {
  final String username;

  const GreetingWidget({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.toNamed('/reminder/action'),
              child: Text(
                'Hai, $username',
                style: StyleText.homeGreeting1,
              ),
            ),
            Text(
              TextStrings.homeGreeting,
              style: StyleText.homeGreeting2,
            ),
          ],
        ),
      ),
    );
  }
}
