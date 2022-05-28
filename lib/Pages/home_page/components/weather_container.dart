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
        Container(
          height: getProportionateScreenHeight(110),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(90),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '28°C',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'Cloudy',
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
                      'Jagakarsa,Jakarta',
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          'assets/images/weather/${model.randomNumber}.png',
          height: getProportionateScreenHeight(110),
          width: getProportionateScreenWidth(140),
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
