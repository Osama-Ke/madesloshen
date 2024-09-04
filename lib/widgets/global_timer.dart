import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:madesloshen/controller/timer_controller.dart';

import '../core/manger/color_manger.dart';
import '../core/manger/text_manger.dart';

class Timer extends StatelessWidget {
  final TimerController timerController = Get.put(TimerController());

  Timer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          final minutes = (timerController.remainingTime.value ~/ 60)
              .toString()
              .padLeft(2, '0');
          final seconds = (timerController.remainingTime.value % 60)
              .toString()
              .padLeft(2, '0');
          return Align(
            alignment: Alignment.topCenter,
            child: Text(
              "$minutes : $seconds",
              style: TextStyle(
                fontSize: 20,
                color: ColorManger.colorTextLogIn,
              ),
            ),
          );
        }),
        Padding(
          padding: EdgeInsets.only(

            left: 20
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap:  timerController.startTimer,
                child: Text(
                  TextManger.sendAgain,
                  style:
                  TextStyle(color: ColorManger.colorTextLogIn,fontSize: 16),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
