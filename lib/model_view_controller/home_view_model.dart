import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:smart_home/provider/base_model.dart';

class HomeScreenViewModel extends BaseModel {
  //-------------VARIABLES-------------//
  int selectedIndex = 1;
  int randomNumber = 1;
  final PageController pageController = PageController();
  bool isLightOn = false;
  bool isFanON = false;

  void generateRandomNumber() {
    randomNumber = Random().nextInt(8);
    notifyListeners();
  }

  void lightSwitch() {
    isLightOn = !isLightOn;
    notifyListeners();
  }

  void fanSwitch() {
    isFanON = !isFanON;
    notifyListeners();
  }
}
