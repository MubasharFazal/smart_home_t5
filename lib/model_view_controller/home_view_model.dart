import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:smart_home/database/gateway.dart';
import 'package:smart_home/provider/base_model.dart';

class HomeScreenViewModel extends BaseModel {
  //-------------VARIABLES-------------//
  int selectedIndex = 1;
  int randomNumber = 1;
  final PageController pageController = PageController();
  bool isLightOn1 = true;
  bool isLightOn2 = true;
  bool isLightOn3 = true;
  bool isFanON = true;

  void generateRandomNumber() {
    randomNumber = Random().nextInt(8);
    notifyListeners();
  }

  void lightSwitch1() {
    bool isLightOn1 = true;
    isLightOn1 = !isLightOn1;
    notifyListeners();

    if (isLightOn1 == true) {
      lightDatabase1.set({
        'status': '0',
      });
    } else {
      lightDatabase1.set({
        'status': '1',
      });
    }
  }

  void lightSwitch2() {
    isLightOn2 = !isLightOn2;
    notifyListeners();
    if (isLightOn2 == true) {
      lightDatabase2.set({
        'status': '0',
      });
    } else {
      lightDatabase2.set({
        'status': '1',
      });
    }
  }

  void lightSwitch3() {
    isLightOn3 = !isLightOn3;
    notifyListeners();
    if (isLightOn3 == true) {
      lightDatabase3.set({
        'status': '0',
      });
    } else {
      lightDatabase3.set({
        'status': '1',
      });
    }
  }

  void fanSwitch() {
    isFanON = !isFanON;
    notifyListeners();
    if (isFanON == true) {
      fanDatabase1.set({
        'status': '0',
      });
    } else {
      fanDatabase1.set({
        'status': '1',
      });
    }
  }
}
