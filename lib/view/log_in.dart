import 'package:flutter/material.dart';
import 'package:madesloshen/controller/login_controller.dart';
import 'package:madesloshen/core/manger/color_manger.dart';
import 'package:madesloshen/core/manger/image_manger.dart';
import 'package:madesloshen/widgets/botom.dart';
import 'package:madesloshen/widgets/text_form_faild.dart';

import '../core/manger/text_manger.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final LoginController _controller = LoginController();

  final TextEditingController _identifier = TextEditingController();

  final TextEditingController _password = TextEditingController();

  bool _isLoading = false;

  String? _errorMessage;

  void _LogIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    bool success = await _controller.logIn(_identifier.text, _password.text);

    setState(() {
      _isLoading = false;
      if (success) {
      } else {
        _errorMessage = 'Failed to create account';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(image: AssetImage(MyImage.Logo)),
             ComponentTextFormField(
              mycontroller: _identifier,
                icon: ImageIcon(AssetImage(MyImage.IconEmail)),
                mainlines: 1,
                maxlines: 1,
                hintText: TextManger.email),

             Padding(
              padding: EdgeInsets.only(top: 30),
              child: ComponentTextFormField(
                mycontroller: _password,
                  icon: ImageIcon(AssetImage(MyImage.IconPassword)),
                  mainlines: 1,
                  maxlines: 1,
                  hintText: TextManger.password),
            ),
            SizedBox(height: 20,),

            _isLoading
            ?CircularProgressIndicator() :ElevatedButton(onPressed: _LogIn, child: Text("Login")) ,

            if(_errorMessage != null ) ...[
              const SizedBox(
                height: 20,
              ),
              Text(
                "$_errorMessage",
                style: const TextStyle(color: Colors.red),
              )
            ] ,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    TextManger.rememberMe,
                    style: TextStyle(color: ColorManger.colorTextLogIn),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      TextManger.rememberMe,
                      style: TextStyle(color: ColorManger.colorTextLogIn),
                    ))
              ],
            ),

          ],
        ),
      ),
    );
  }
}
