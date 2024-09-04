import 'package:flutter/material.dart';
import 'package:madesloshen/core/manger/color_manger.dart';

class ComponentBotoom extends StatelessWidget {
  final String BottomName;
  final Color MyColor ;

  const ComponentBotoom({super.key, required this.BottomName, required this.MyColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorManger.colorBorderBotom),
          color: MyColor,
          borderRadius: BorderRadius.circular(50)),
      width: 330,
      height: 50,
      child: Center(
          child: Text(
        BottomName,
        style: const TextStyle(color: ColorManger.colorTextLogIn,
        fontSize: 16
        ),
      )),
    );
  }
}
