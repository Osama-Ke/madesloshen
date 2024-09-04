import 'package:flutter/material.dart';

import '../widgets/global_text_form_faild_verification.dart';
import '../widgets/global_timer.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {



  String code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 20),
            child: Text(
              "VerificationCode",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: OtpInputForm(
              onChanged: (code){
                print(code);
                this.code = code;
              },
            ),
          ),
           Padding(
             padding: EdgeInsets.only(top: 200),
             child: Timer(),
           ) ,



        ],
      ),
    );
  }
}
