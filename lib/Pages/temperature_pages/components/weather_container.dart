import 'package:flutter/material.dart';
import 'package:smart_home/config/size_config.dart';
import 'package:smart_home/model_view_controller/home_view_model.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key? key, required this.model}) : super(key: key);

  final HomeScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: getProportionateScreenHeight(310),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFFFFFF),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
                vertical: getProportionateScreenHeight(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(250),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Temperature 28°C',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        'Humidity 28°C',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Text(
                        '27 Mar 2022',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        'Lahore,Pakistan',
                        style: Theme.of(context).textTheme.headline5,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
          child: Image.asset(
            'assets/images/weather/8.png',
            height: getProportionateScreenHeight(110),
            width: getProportionateScreenWidth(140),
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
