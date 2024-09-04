import 'dart:math' show max, min;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:madesloshen/controller/verification_code_controller.dart';

class OtpInputForm extends StatefulWidget {
  const OtpInputForm({
    super.key,
     this.onChanged,
  });

  final void Function(String code)? onChanged;

  @override
  _OtpInputFormState createState() => _OtpInputFormState();
}

class _OtpInputFormState extends State<OtpInputForm> {
  final VerificationCodeController _controller = VerificationCodeController();



  bool _isLoading = false;

  String? _errorMessage;

  void _verifycode() {
    // setState(() {
    //   _isLoading = true;
    //   _errorMessage = null;
    // });
    print("23213213");
    final code = controllers.map((e) => e.text).join();
    print(code);

/*    String verification_code = _firstController.text +
        _secondController.text +
        _thirdController.text +
        _forthController.text +
        _fifthController.text +
        _sixthController.text;*/
  }

  final int fieldsCount = 6;
  late final List<FocusNode> focusNodes =
      List.generate(fieldsCount, (index) => FocusNode());
  late final List<TextEditingController> controllers = List.generate(
      fieldsCount, (index) => TextEditingController()..addListener(() {}));
  int _currentIndex = 0;

  void _onChanged(String value, int index) {
    final code = controllers.map((e) => e.text).join();
    widget.onChanged?.call(code);
    _currentIndex = index;
    final nextIndex = min(fieldsCount - 1, _currentIndex + 1);
    final previousIndex = max(0, _currentIndex - 1);

    if (value.length == 1) {
      FocusScope.of(context).requestFocus(focusNodes[nextIndex]);
    } else if (value.isEmpty) {
      FocusScope.of(context).requestFocus(focusNodes[previousIndex]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RawKeyboardListener(
          onKey: _onKey,
          focusNode: FocusNode(),
          autofocus: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              fieldsCount,
              (index) => SizedBox(
                width: 50,
                height: 50,
                child: TextField(
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  decoration: const InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                  onChanged: (value) => _onChanged(value, index),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20,) ,
        _isLoading ? CircularProgressIndicator() :
            ElevatedButton(onPressed: (){
              _verifycode() ;

            }, child: Text('sendVerificationCode')) ,

        if(_errorMessage != null) ...[
          SizedBox(height: 20,) ,
          Text("$_errorMessage" , style:  TextStyle(color: Colors.red),)
        ]
      ],
    );
  }

  void _onKey(RawKeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.backspace) {
      if (controllers[_currentIndex].text.isEmpty) {
        _currentIndex = max(0, _currentIndex - 1);
      }
      final previousIndex = max(0, _currentIndex);
      if (controllers[previousIndex].text.isNotEmpty) {
        controllers[_currentIndex].selection =
            const TextSelection(baseOffset: 0, extentOffset: 1);
      }
      FocusScope.of(context).requestFocus(focusNodes[previousIndex]);
    }
  }
}
