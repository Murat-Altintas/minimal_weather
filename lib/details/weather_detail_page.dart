// ignore_for_file: prefer_const_constructors, no_logic_in_create_state, unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

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

class WeatherDetailPage extends StatefulWidget {
  final Map<String, List<dynamic>> incomingSelectedCountryMap;
  final int incomingIndex;
  WeatherDetailPage({Key? key, required this.incomingSelectedCountryMap, required this.incomingIndex}) : super(key: key);
  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
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
          /// add stack to add back button.
          child: Stack(
            children: [
              Column(
                children: [
                  topCountryName(),
                  SizedBox(
                    height: context.mediumContainer,
                  ),
                  //  topStack(context, widget.incomingIndex),
                  bottomCarouselRow(widget.incomingIndex),
                ],
              ),
              Align(alignment: Alignment.topLeft,child: BackButton(),),
            ],
          ),
        ),
      ),
    );
  }

  Expanded topCountryName() {
    return Expanded(
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i) {
            var incomingIndex = widget.incomingIndex;
            return Text(
              widget.incomingSelectedCountryMap["regionList"]![incomingIndex],
              style: textThemeLight.headline1,
              textAlign: TextAlign.center,
            );
          }),
    );
  }

  CarouselSlider bottomCarouselRow(incomingIndex) {
    return CarouselSlider.builder(
      itemCount: 23,
      options: CarouselOptions(
        clipBehavior: Clip.none,
        // autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 7),
      ),
      itemBuilder: (BuildContext context, int incomingIndex, int pageViewIndex) {
        return Stack(
          children: [
            Positioned(
              top: context.height2 * 8,
              child: Row(
                children: [
                  bottomCarouselWidget(context, "${widget.incomingSelectedCountryMap["hourlyTempCList"]![incomingIndex]}\u00B0",
                      "${widget.incomingSelectedCountryMap["dayHoursList"]![incomingIndex]}", "${widget.incomingSelectedCountryMap["hourlyImageList"]![incomingIndex]}"),
                  SizedBox(
                    width: context.width2 * 4,
                  ),
                  bottomCarouselWidget(context, "${widget.incomingSelectedCountryMap["hourlyTempCList"]![incomingIndex]}\u00B0",
                      "${widget.incomingSelectedCountryMap["dayHoursList"]![incomingIndex]}", "${widget.incomingSelectedCountryMap["hourlyImageList"]![incomingIndex]}"),
                  SizedBox(
                    width: context.width2 * 4,
                  ),
                  bottomCarouselWidget(context, "${widget.incomingSelectedCountryMap["hourlyTempCList"]![incomingIndex]}\u00B0",
                      "${widget.incomingSelectedCountryMap["dayHoursList"]![incomingIndex]}", "${widget.incomingSelectedCountryMap["hourlyImageList"]![incomingIndex]}"),
                ],
              ),
            ),
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
        height: context.height2 * 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(tempC, style: textThemeLight.subtitle1),
              SizedBox(height: context.heightContainer, child: Image.asset(image)),
              Text(clock, style: textThemeLight.subtitle2),
            ],
          ),
        ),
      ),
    );
  }

  Stack topStack(BuildContext context, int incomingIndex) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(top: context.height2 * 44, child: centerRow(context, textThemeLight, colorScheme)),
        CarouselSlider.builder(
          itemCount: 3,
          options: CarouselOptions(
            clipBehavior: Clip.none,
            enlargeCenterPage: true,
            aspectRatio: 1,
          ),
          itemBuilder: (BuildContext context, int incomingIndex, int pageViewIndex) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(top: context.height2 * 1, child: colorfullBG(context)),
                    Positioned(top: -context.height2 * 2, child: whiteBG(context)),
                    Positioned(
                        top: 0,
                        child: Text(
                          "${widget.incomingSelectedCountryMap["nextDaysDateList"]![incomingIndex]}",
                          style: textThemeLight.subtitle1,
                        )),
                    Positioned(top: context.height2 * 7, child: Text("Sunday ", style: textThemeLight.subtitle3)),
                    Positioned(top: context.height2 * 9, child: weatherText(context, widget.incomingIndex)),
                    Positioned(top: context.height2 * 20, child: weatherIcon(context)),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  SizedBox weatherIcon(BuildContext context) {
    return SizedBox(
      height: context.height2 * 23,
      child: Image.asset("assets/images/weather-partly-cloudy.png"),
    );
  }

  GradientText weatherText(BuildContext context, incomingIndex) {
    return GradientText(
      "${widget.incomingSelectedCountryMap["nextDaysMaxTempCList"]![incomingIndex]}\u00B0",
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
}

ClipRRect centerRow(BuildContext context, TextThemeLight textThemeLight, ColorSchemeLight colorScheme) {
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
              centerRowColumn("30km/s", "wind", FontAwesomeIcons.wind, colorScheme, textThemeLight),
              centerRowColumn("30%", "Humidity", FontAwesomeIcons.droplet, colorScheme, textThemeLight),
              centerRowColumn("1.4km", "Visibility", FontAwesomeIcons.eye, colorScheme, textThemeLight),
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
    borderRadius: BorderRadius.circular(50),
    child: SizedBox(
      height: context.height2 * 35,
      width: context.width2 * 58,
      child: SvgPicture.asset("assets/bg.svg"),
    ),
  );
}
