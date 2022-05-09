import 'package:flutter/material.dart';
import 'package:smart_home/Pages/home_page/components/dark_container.dart';
import 'package:smart_home/Pages/smart_fan/smart_fan.dart';
import 'package:smart_home/Pages/smart_light/smart_light.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/model_view_controller/home_view_model.dart';

class HomeBody extends StatelessWidget {
  final HomeScreenViewModel model;
  const HomeBody({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(7),
          vertical: getProportionateScreenHeight(7),
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F2),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: model.isLightOn,
                      switchButton: model.lightSwitch,
                      onTap: () {
                        Navigator.of(context).pushNamed(SmartLight.routeName);
                      },
                      iconAsset: 'assets/icons/svg/light.svg',
                      device: 'Lightening',
                      deviceCount: '4 lamps',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: DarkContainer(
                      itsOn: model.isFanON,
                      switchButton: model.fanSwitch,
                      onTap: () {
                        Navigator.of(context).pushNamed(SmartFan.routeName);
                      },
                      iconAsset: 'assets/icons/svg/fan.svg',
                      device: 'Fan',
                      deviceCount: '2 devices',
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
            ),
          ],
        ),
      ),
    );
  }
}
