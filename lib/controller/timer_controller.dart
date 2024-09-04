import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  var remainingTime = 600.obs;

  Timer? _timer;

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    remainingTime.value = 180;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        _timer!.cancel();
      }
    });
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }
}
