import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:madesloshen/controller/rigister_controller.dart';
import 'package:madesloshen/core/manger/color_manger.dart';
import 'package:madesloshen/core/manger/image_manger.dart';
import 'package:madesloshen/core/manger/text_manger.dart';
import 'package:madesloshen/view/verification_code.dart';

import 'package:madesloshen/widgets/text_form_faild.dart';

import '../controller/timer_controller.dart';

class SignUpp extends StatefulWidget {
  const SignUpp({super.key});

  @override
  State<SignUpp> createState() => _SignUppState();
}

class _SignUppState extends State<SignUpp> {
  final RegisterController _controller = RegisterController();

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneNumber = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _confirmationPassword = TextEditingController();

  final TimerController timerController = Get.put(TimerController());
  bool _isLoading = false;

  String? _errorMessage;

  void _register() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });



    bool success = await _controller.creatUser(
        _userNameController.text,
        _emailController.text,
        _phoneNumber.text,
        _password.text,
        _confirmationPassword.text);

    setState(() {
      _isLoading = false;
      if (success) {
        Get.off(()=> VerificationCode()) ;
      } else {
        _errorMessage = 'Failed to create account';
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ComponentTextFormField(
                  mycontroller: _userNameController,
                  icon: null,
                  mainlines: 1,
                  maxlines: 1,
                  hintText: TextManger.username),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ComponentTextFormField(
                  mycontroller: _emailController,
                  icon: const ImageIcon(AssetImage(MyImage.IconEmail)),
                  mainlines: 1,
                  maxlines: 1,
                  hintText: TextManger.email),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ComponentTextFormField(
                  mycontroller: _phoneNumber,
                  icon: null,
                  mainlines: 1,
                  maxlines: 1,
                  hintText: TextManger.mobileNumber),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ComponentTextFormField(
                  mycontroller: _password,
                  icon: const ImageIcon(AssetImage(MyImage.IconPassword)),
                  mainlines: 1,
                  maxlines: 1,
                  hintText: TextManger.password),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ComponentTextFormField(
                  mycontroller: _confirmationPassword,
                  icon: const ImageIcon(AssetImage(MyImage.IconPassword)),
                  mainlines: 1,
                  maxlines: 1,
                  hintText: TextManger.confirmPassword),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 42),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorManger.colorBotomUpload,
                    border:
                        Border.all(color: ColorManger.colorBorderBotomUplod)),
                width: 200,
                height: 50,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          TextManger.certificatePDFFile,
                          style: TextStyle(color: ColorManger.colorIcon),
                        ),
                        ImageIcon(
                          AssetImage(MyImage.Iconuplod),
                          color: ColorManger.colorIcon,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: (){
                      _register() ;

                    },


                child: const Text("Create Account ")),
            if (_errorMessage != null) ...[
              const SizedBox(
                height: 20,
              ),
              Text(
                "$_errorMessage",
                style: const TextStyle(color: Colors.red),
              )
            ],
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Row(
                children: [
                  const Text(TextManger.alreadyHaveAnAccount),
                  TextButton(
                      onPressed: () {}, child: const Text(TextManger.logIn))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
