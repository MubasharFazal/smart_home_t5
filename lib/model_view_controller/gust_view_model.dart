
import 'package:flutter/cupertino.dart';
import 'package:smart_home/provider/base_model.dart';

class GustViewModel extends BaseModel {
  //-------------VARIABLES-------------//
  final PageController pageController = PageController();
  bool isLightOn = true;
  bool isACON = false;
  bool isSpeakerON = false;
  bool isFanON = false;
  

  void lightSwitch() {
    isLightOn = !isLightOn;
    notifyListeners();
  }

  void fanSwitch() {
    isFanON = !isFanON;
    notifyListeners();
  }

  void acSwitch() {
    isACON = !isACON;
    notifyListeners();
  }

  void speakerSwitch() {
    isSpeakerON = !isSpeakerON;
    notifyListeners();
  }
}
