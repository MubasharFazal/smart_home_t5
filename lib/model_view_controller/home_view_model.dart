import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:smart_home/provider/base_model.dart';

class HomeScreenViewModel extends BaseModel {
  //-------------VARIABLES-------------//
  int selectedIndex = 1;
  int randomNumber = 1;
  final PageController pageController = PageController();
  bool isLightOn1 = false;
  bool isLightOn2 = false;
  bool isLightOn3 = false;
  bool isLightOn4 = false;
  bool isFanON = false;

  void generateRandomNumber() {
    randomNumber = Random().nextInt(8);
    notifyListeners();
  }

  void lightSwitch1() {
    isLightOn1 = !isLightOn1;
    notifyListeners();
  }

  void lightSwitch2() {
    isLightOn2 = !isLightOn2;
    notifyListeners();
  }

  void lightSwitch3() {
    isLightOn3 = !isLightOn3;
    notifyListeners();
  }

  void lightSwitch4() {
    isLightOn4 = !isLightOn4;
    notifyListeners();
  }



  void fanSwitch() {
    isFanON = !isFanON;
    notifyListeners();
  }
}
