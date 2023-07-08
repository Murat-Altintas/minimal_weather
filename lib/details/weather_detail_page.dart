// ignore_for_file: prefer_const_constructors, no_logic_in_create_state, unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_weatherapp/services/forecast_response_model.dart';
import 'package:minimal_weatherapp/style/text_theme.dart';
import '../style/color_scheme.dart';
import "/style/context_extension.dart";
import '../services/control.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

var _currentIndex = 0;

class WeatherDetailPage extends StatefulWidget {
  final Map<String, List<dynamic>> incomingSelectedCountryMap;
  final List<dynamic> incomingMaxTempCList;
  final int incomingIndex;
  final String incomingRegion;
  final List incomingWeatherList;

  WeatherDetailPage({Key? key, required this.incomingSelectedCountryMap, required this.incomingIndex, required this.incomingMaxTempCList, required this.incomingRegion, required this.incomingWeatherList}) : super(key: key);

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  void initState() {
    super.initState();
    print("GELEN DATAAAAAAAAAA");
    print(widget.incomingRegion);
    print(widget.incomingIndex);
    print(widget.incomingMaxTempCList);
  }

  final apiList = ApiListFillVoidClass();
  final textThemeLight = TextThemeLight.instance!;
  final colorScheme = ColorSchemeLight.instance!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: context.width2 * 5,
            right: context.width2 * 5,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  topCountryName(widget.incomingIndex),
                  topStack(context, widget.incomingIndex),
                  Spacer(),
                  //bottomCarouselRow(widget.incomingIndex),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container topCountryName(incomingIndex) {
    return Container(
      height: 80,
      child: Text(
        widget.incomingRegion,
        //widget.incomingSelectedCountryMap["regionList"]![incomingIndex],
        style: textThemeLight.headline1,
        textAlign: TextAlign.center,
      ),
    );
  }

  CarouselSlider bottomCarouselRow(incomingIndex) {
    return CarouselSlider.builder(
      itemCount: widget.incomingSelectedCountryMap["dayHoursList"]!.length,
      options: CarouselOptions(
        clipBehavior: Clip.none,
        // autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 7),
      ),
      itemBuilder: (BuildContext context, int incomingIndex, int pageViewIndex) {
        return Row(
          children: [
            bottomCarouselWidget(context, "${widget.incomingSelectedCountryMap["hourlyTempCList"]![incomingIndex]}\u00B0", "${widget.incomingSelectedCountryMap["dayHoursList"]![incomingIndex]}", "${widget.incomingSelectedCountryMap["hourlyImageList"]![incomingIndex]}"),
          ],
        );
      },
    );
  }

  ClipRRect bottomCarouselWidget(BuildContext context, String tempC, clock, image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: Colors.pink.shade50,
        width: context.width2 * 20,
        height: context.height2 * 15,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(flex: 1, child: Text(tempC, style: textThemeLight.subtitle1)),
                SizedBox(height: context.heightContainer, width: context.mediumContainer, child: Image.asset(image)),
                Flexible(flex: 1, child: Text(clock, style: textThemeLight.subtitle2)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack topStack(BuildContext context, int incomingIndex) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(top: 380, child: centerRow(context, textThemeLight, colorScheme, widget.incomingIndex)),
        CarouselSlider.builder(
          itemCount: 3,
          options: CarouselOptions(
            clipBehavior: Clip.none,
            enlargeCenterPage: true,
            aspectRatio: 1,
            onPageChanged: (index, reason) {
              _currentIndex = index;
              setState(() {});
            },
          ),
          itemBuilder: (BuildContext context, int incomingIndex, int pageViewIndex) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(top: context.height2 * 0.9, child: colorfullBG(context)),
                    Positioned(top: -context.height2 * 2, child: whiteBG(context)),
                    Positioned(
                        top: 0,
                        child: Text(
                          widget.incomingRegion,
                          //"${widget.incomingSelectedCountryMap["nextDaysDateList"]![incomingIndex]}",
                          style: textThemeLight.subtitle1,
                        )),
                    Positioned(
                      top: context.height2 * 7,
                      child: Text("${widget.incomingSelectedCountryMap["conditionList"]![incomingIndex]}", style: textThemeLight.subtitle3),
                    ),
                    Positioned(top: context.height2 * 9, child: weatherText(context, _currentIndex)),
                    Positioned(top: context.height2 * 20, child: weatherIcon(context, widget.incomingIndex)),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  SizedBox weatherIcon(BuildContext context, incomingIndex) {
    return SizedBox(
      height: context.height2 * 23,
      child: Image.asset("${widget.incomingSelectedCountryMap["imageList"]![incomingIndex]}"),
    );
  }

  GradientText weatherText(BuildContext context, incomingIndex) {
    //var incomingIndex = widget.incomingIndex;
    return GradientText(
      "${widget.incomingMaxTempCList[incomingIndex]}\u00B0",
      style: textThemeLight.headline3.copyWith(
        fontSize: context.height2 * 18,
      ),
      gradientDirection: GradientDirection.ttb,
      radius: 2.5,
      colors: [
        Colors.white,
        Colors.white,
        Colors.white.withOpacity(0.5),
        Colors.white.withOpacity(0.1),
      ],
    );
  }

  ClipRRect centerRow(BuildContext context, TextThemeLight textThemeLight, ColorSchemeLight colorScheme, incomingIndex) {
    return ClipRRect(
      clipBehavior: Clip.none,
      borderRadius: BorderRadius.circular(30),
      child: Container(
          width: context.width2 * 90,
          height: context.height2 * 15,
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(1, 5), // Shadow position
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                centerRowColumn("${apiList.windMph}", "wind", FontAwesomeIcons.wind, colorScheme, textThemeLight),
                centerRowColumn("${apiList.humidity}", "Humidity", FontAwesomeIcons.droplet, colorScheme, textThemeLight),
                centerRowColumn("${apiList.visibilityMiles}", "Visibility", FontAwesomeIcons.eye, colorScheme, textThemeLight),
              ],
            ),
          )),
    );
  }

  Column centerRowColumn(String speed, wind, IconData icon, ColorSchemeLight colorScheme, TextThemeLight textThemeLight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FaIcon(icon, color: colorScheme.purple),
        Text(speed, style: textThemeLight.subtitle1),
        Text(wind, style: textThemeLight.subtitle2),
      ],
    );
  }
}

ClipRRect whiteBG(BuildContext context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: Container(
      color: Colors.white.withOpacity(0.8),
      height: context.height2 * 7,
      width: context.width2 * 50,
    ),
  );
}

ClipRRect colorfullBG(BuildContext context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(100),
    child: SizedBox(
      height: context.height2 * 35,
      width: context.width2 * 70,
      child: SvgPicture.asset("assets/bg.svg"),
    ),
  );
}
