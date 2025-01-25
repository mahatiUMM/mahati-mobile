import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:mahati_mobile/app/core/network/smpt_email.dart';
import 'package:mahati_mobile/app/modules/auth/sign_up/signup_controller.dart';

class VerificationEmailController extends GetxController {
  final EmailVerification email_otp = EmailVerification();
  final SignUpController signUpController = Get.find<SignUpController>();
  RxString username = "".obs; 
  RxString email = "".obs; 
  RxString password = "".obs; 
  RxString number = "".obs;
  RxString pin = "".obs;
  RxString otp = "".obs;

  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  late final TextEditingController pinController;
  
  var timeString = '00:30'.obs;  
  var isTimerRunning = true.obs;  
  var duration = 30; // 30 seconds  
  var penalty = 30;
  
  Timer? timer;  
  // GetStorage _storage = GetStorage();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>;
    username.value = arguments['username'];
    email.value = arguments['email'];
    password.value = arguments['password'];
    number.value = arguments['number'];
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
    // if (_storage.read('duration_time').isBlank && _storage.read('penalty_time').isBlank) {
    //   _storage.write('duration_time', 30); _storage.write('penalty_time', 30);
    // }else{
    //   duration =_storage.read('duration_time');
    //   penalty = _storage.read('penalty_time');
    // }
    // email_otp.emailConfig();
  }

  @override
  void onClose() {
    timer?.cancel();  
    // _storage.erase();
    super.onClose();
  }

  @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void startTimer() {  
    duration = penalty;
    isTimerRunning.value = true; 
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {  
      if (duration > 0) {  
        duration--;  
        timeString.value = formatTime(duration);  
      } else {  
        penalty += penalty;
        stopTimer();    
      }  
    });  
  }  
  
  void stopTimer() {  
    timer?.cancel();  
    isTimerRunning.value = false;  
    timeString.value = formatTime(duration);  
  }  
  
  String formatTime(int seconds) {  
    int minutes = seconds ~/ 60;  
    int remainingSeconds = seconds % 60;  
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';  
  }  
}