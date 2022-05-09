import 'package:flutter/cupertino.dart';
import 'package:smart_home/provider/base_model.dart';

class KitchenViewModel extends BaseModel {
  final PageController pageController = PageController();
  bool isLightOn = true;
  bool isACON = false;
  bool isSpeakerON = false;
  bool isFanON = false;

  void acSwitch() {
    isACON = !isACON;
    notifyListeners();
  }

  void fanSwitch() {
    isFanON = !isFanON;
    notifyListeners();
  }
}
