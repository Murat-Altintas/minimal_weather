// ignore_for_file: prefer_const_constructors, no_logic_in_create_state, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_weatherapp/style/text_theme.dart';
import '../style/color_scheme.dart';
import "/style/context_extension.dart";
import '../services/control.dart';

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
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: context.width2 * 3,
              right: context.width2 * 3,
            ),
            child: Column(
              children: [
                //Text(incomingSelectedCountryMap["regionList"]![index], style: textThemeLight.headline1),
                Text("Istanbul", style: textThemeLight.headline1),
                Column(
                  children: [
                    SizedBox(
                      height: context.mediumContainer,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: SizedBox(
                            height: context.height2 * 45,
                            width: context.width2 * 75,
                            child: SvgPicture.asset("assets/bg.svg"),
                          ),
                        ),
                        Positioned(
                          top: -context.height2 * 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              color: Colors.white.withOpacity(0.8),
                              height: context.height2 * 7,
                              width: context.width2 * 50,
                            ),
                          ),
                        ),
                        Positioned(top: 0, child: Text("sunday, 12 april ", style: textThemeLight.subtitle2)),
                        Positioned(top: context.height2 * 7, child: Text("Sunday ", style: textThemeLight.subtitle1)),
                        Positioned(
                          top: context.height2 * 10,
                          child: Text("15" "\u00B0", style: textThemeLight.headline3.copyWith(fontSize: context.height2 * 20)),
                        ),
                      ],
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
