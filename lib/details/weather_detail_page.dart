// ignore_for_file: prefer_const_constructors, no_logic_in_create_state, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_weatherapp/style/text_theme.dart';
import '../style/color_scheme.dart';
import "/style/context_extension.dart";
import '../services/control.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WeatherDetailPage extends StatelessWidget {
  // final Map<String, List<dynamic>> incomingSelectedCountryMap;
  final apiList = apiListFillVoidClass();
  final textThemeLight = TextThemeLight.instance!;
  final colorScheme = ColorSchemeLight.instance!;

  WeatherDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: context.width2 * 5,
            right: context.width2 * 5,
          ),
          child: Center(
            child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Text(incomingSelectedCountryMap["regionList"]![index], style: textThemeLight.headline1),
                Text("Istanbul", style: textThemeLight.headline1),
                SizedBox(
                  height: context.mediumContainer,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    centerRow(context, textThemeLight, colorScheme),
                    CarouselSlider(
                      options: CarouselOptions(
                        clipBehavior: Clip.none,
                        aspectRatio: 1,
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                colorfullBG(context),
                                whiteBG(context),
                                Positioned(top: 0, child: Text("october, 7 sunday ", style: textThemeLight.subtitle1)),
                                Positioned(top: context.height2 * 7, child: Text("Sunday ", style: textThemeLight.subtitle3)),
                                Positioned(
                                  top: context.height2 * 9,
                                  child: GradientText(
                                    "15" "\u00B0",
                                    style: textThemeLight.headline3.copyWith(
                                      fontSize: context.height2 * 20,
                                    ),
                                    gradientDirection: GradientDirection.ttb,
                                    radius: 2.5,
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                      Colors.white.withOpacity(0.5),
                                      Colors.white.withOpacity(0.1),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: context.height2 * 20,
                                  child: SizedBox(
                                    height: context.height2 * 23,
                                    child: Image.asset("assets/images/weather-thunder.png"),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Positioned centerRow(BuildContext context, TextThemeLight textThemeLight, ColorSchemeLight colorScheme) {
  return Positioned(
    top: context.height2 * 44,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
          color: Colors.purple.shade50,
          width: context.width2 * 90,
          height: context.height2 * 15,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FaIcon(FontAwesomeIcons.wind, color: colorScheme.purple),
                    Text("9km/h", style: textThemeLight.subtitle1),
                    Text("Wind", style: textThemeLight.subtitle2),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FaIcon(FontAwesomeIcons.droplet, color: colorScheme.purple),
                    Text("30%", style: textThemeLight.subtitle1),
                    Text("Humidity", style: textThemeLight.subtitle2),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FaIcon(FontAwesomeIcons.eye, color: colorScheme.purple),
                    Text("1.4km", style: textThemeLight.subtitle1),
                    Text("Visibility", style: textThemeLight.subtitle2),
                  ],
                ),
              ],
            ),
          )),
    ),
  );
}

Positioned whiteBG(BuildContext context) {
  return Positioned(
    top: -context.height2 * 2,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: Colors.white.withOpacity(0.8),
        height: context.height2 * 7,
        width: context.width2 * 50,
      ),
    ),
  );
}

Positioned colorfullBG(BuildContext context) {
  return Positioned(
    top: context.height2 * 1,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        height: context.height2 * 35,
        width: context.width2 * 58,
        child: SvgPicture.asset("assets/bg.svg"),
      ),
    ),
  );
}
