import 'dart:async';

import 'package:flutter/material.dart';

import '../core/manger/color_manger.dart';

class ComponentTextFormField extends StatelessWidget {
  final ImageIcon? icon;
  final String hintText;
  final int maxlines;
  final int mainlines;
  final EdgeInsets? padding;
  final TextEditingController? mycontroller ;



  const ComponentTextFormField({
    super.key,
    required this.icon,
    required this.mainlines,
    required this.maxlines,
    required this.hintText,
    this.padding,
     this.mycontroller

  });

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.only(left: 30 , right: 30,),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
        ),
        child: TextFormField(
          controller: mycontroller,


          maxLines: maxlines,
          minLines: mainlines,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              focusedBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(30),
              ) ,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorManger.colorBorderTextFormFaild),
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: icon,
              suffixIconColor:ColorManger.colorIcon ,
              hintText: hintText,
              hintStyle: const TextStyle(color: ColorManger.colorIcon),
              filled: true,
              fillColor: ColorManger.colorBackgroundTextFormFaild),
        ),
      ),
    );
  }
}
