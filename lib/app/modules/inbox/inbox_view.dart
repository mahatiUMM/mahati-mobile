import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/constants/text_strings.dart';
import 'package:mahati_mobile/app/constants/text_style.dart';
import 'package:mahati_mobile/app/modules/inbox/inbox_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class InboxView extends GetView<InboxController> {
  const InboxView({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Resources.color.backgroundHome2,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(Get.width, Get.height * 0.1),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, bottom: 10.0), // Padding di AppBar
                decoration: BoxDecoration(
                  color:
                      AppColors.backgroundHome, // Warna latar belakang AppBar
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Warna bayangan
                      spreadRadius: 0,
                      blurRadius: 4, // Ukuran blur bayangan
                      offset: const Offset(0, 2), // Posisi bayangan
                    ),
                  ],
                ),
                child: Text("Frequently Asked \nQuestions",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 24,
                      color: Resources.color.baseColor,
                      fontFamily: Resources.font.primaryFont,
                      fontWeight: FontWeight.w600,
                    )),
              )),
          backgroundColor: AppColors.backgroundHome,
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: Get.height * 0.7,
                child: Accordion(
                  headerBorderColor: Colors.blueGrey,
                  headerBorderColorOpened: Colors.transparent,
                  headerBackgroundColorOpened: Resources.color.primaryColor,
                  contentBackgroundColor: AppColors.backgroundHome,
                  contentBorderColor: Resources.color.primaryColor2,
                  contentBorderWidth: 3,
                  contentHorizontalPadding: 20,
                  scaleWhenAnimating: false,
                  openAndCloseAnimation: true,
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                  sectionClosingHapticFeedback: SectionHapticFeedback.light,
                  children: [
                    AccordionSection(
                        isOpen: false,
                        contentVerticalPadding: 20,
                        leftIcon: const Icon(Icons.question_answer_rounded,
                            color: Colors.white),
                        header: Text(TextStrings.faqHeader0,
                            style: StyleText.faqHeaderStyle),
                        content: GestureDetector(
                            onTap: () async {
                              const link = WhatsAppUnilink(
                                phoneNumber: '+62 813-3461-1144',
                                text:
                                    "Halo! untuk segala pertanyaan silahkan hubungi saya.",
                              );
                              await launchUrlString('$link');
                            },
                            child: const Text.rich(
                                textAlign: TextAlign.justify,
                                TextSpan(children: [
                                  TextSpan(text: "Contact Person : "),
                                  TextSpan(
                                      text: "Mutiara Titani",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline))
                                ])))),
                    AccordionSection(
                      isOpen: false,
                      contentVerticalPadding: 20,
                      leftIcon: const Icon(Icons.question_answer_rounded,
                          color: Colors.white),
                      header: Text(TextStrings.faqHeader1,
                          style: StyleText.faqHeaderStyle),
                      content: Text.rich(
                          textAlign: TextAlign.justify,
                          TextSpan(
                            children: [
                              const TextSpan(
                                  text: TextStrings.appName,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: " ${TextStrings.faqContent1}",
                                  style: StyleText.faqContentStyle)
                            ],
                          )),
                    ),
                    AccordionSection(
                      isOpen: false,
                      contentVerticalPadding: 20,
                      leftIcon: const Icon(Icons.question_answer_rounded,
                          color: Colors.white),
                      header: Text(TextStrings.faqHeader2,
                          style: StyleText.faqHeaderStyle),
                      content: Text(
                          textAlign: TextAlign.justify,
                          TextStrings.faqContent2,
                          style: StyleText.faqContentStyle),
                    ),
                    AccordionSection(
                      isOpen: false,
                      contentVerticalPadding: 20,
                      leftIcon: const Icon(Icons.question_answer_rounded,
                          color: Colors.white),
                      header: Text(TextStrings.faqHeader3,
                          style: StyleText.faqHeaderStyle),
                      content: Text(
                          textAlign: TextAlign.justify,
                          TextStrings.faqContent3,
                          style: StyleText.faqContentStyle),
                    ),
                    AccordionSection(
                      isOpen: false,
                      contentVerticalPadding: 20,
                      leftIcon: const Icon(Icons.question_answer_rounded,
                          color: Colors.white),
                      header: Text(TextStrings.faqHeader4,
                          style: StyleText.faqHeaderStyle),
                      content: Text(
                          textAlign: TextAlign.justify,
                          TextStrings.faqContent4,
                          style: StyleText.faqContentStyle),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
