import 'package:flutter/material.dart';

import '../core/manger/color_manger.dart';
import '../core/manger/image_manger.dart';
import '../core/manger/text_manger.dart';
import '../widgets/global_text_form_faild_verification.dart';
import '../widgets/global_timer.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40, left: 20),
          child: Icon(Icons.keyboard_backspace_outlined)
        ),
         Padding(
          padding: EdgeInsets.only(left: 75, top: 25),
          child: SizedBox(
              width: 221, child: Image(image: AssetImage(MyImage.Logo))),
        ),
        Padding(
          padding: EdgeInsets.only(top: 200, left: 20),
          child: Text(
            TextManger.verificationCode,
            style:
                TextStyle(fontSize: 24, color: ColorManger.colorTextVirficshin),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 270, right: 80, left: 50),
          child: Text(
            TextManger.weHaveSentTheVerificationCode,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
          child: OtpInputForm(),
        ),
        Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/1.7),
          child: Timer()
        )
      ],
    ));
  }
}
