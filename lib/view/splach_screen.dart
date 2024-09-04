import 'package:flutter/material.dart';
import 'package:madesloshen/core/manger/color_manger.dart';

import '../core/manger/image_manger.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      backgroundColor: ColorManger.colorSplachScreen,
      body: Column(children: [

        Padding(
          padding: const EdgeInsets.only(top: 220),
          child: Image.asset(MyImage.Logo),
        ),

       /* Padding(
          padding: const EdgeInsets.only(top: 130,left: 250),
          child: Container(width: 150,
          height: 150,
            decoration: BoxDecoration(color: ColorManger.ColorSplachScree,borderRadius: BorderRadius.circular(100)),


          ),
        )*/

      ],)
    );
  }
}

