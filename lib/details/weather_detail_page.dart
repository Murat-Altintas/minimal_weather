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

var _currentDay = 0;

class WeatherDetailPage extends StatefulWidget {
  final Map<String, List<dynamic>> incomingSelectedCountryMap;
  final int incomingIndex;
  final List incomingWeatherList;
  final List incomingCondition;
  final WeatherResponse incomingModel;

  WeatherDetailPage({Key? key, required this.incomingSelectedCountryMap, required this.incomingIndex, required this.incomingWeatherList, required this.incomingCondition, required this.incomingModel}) : super(key: key);

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  void initState() {
    super.initState();
    print("GELEN DATAAAAAAAAAA");
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
                  topStack(context),
                  Spacer(),
                  bottomCarouselRow(widget.incomingIndex),
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
        widget.incomingModel.locationName,
        style: textThemeLight.headline1,
        textAlign: TextAlign.center,
      ),
    );
  }

  CarouselSlider bottomCarouselRow(incomingIndex) {
    return CarouselSlider.builder(
      itemCount: widget.incomingModel.dayHours.length,
      options: CarouselOptions(
        clipBehavior: Clip.none,
        enableInfiniteScroll: true,
        viewportFraction: 0.25,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 7),
      ),
      itemBuilder: (BuildContext context, int index, int bottomIndex) {
        return Row(
          children: [
            bottomCarouselWidget(context, "${widget.incomingModel.forecast!.forecastday![_currentDay].hour![index].tempC}\u00B0",
                widget.incomingModel.dayHours[index],
                "${widget.incomingSelectedCountryMap["hourlyImageList"]![incomingIndex]}"),
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
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(tempC, style: textThemeLight.subtitle1),
              SizedBox(height: context.heightContainer, width: context.mediumContainer, child: Image.asset(image)),
              Text(clock, style: textThemeLight.subtitle2),
            ],
          ),
        ),
      ),
    );
  }

  Stack topStack(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(top: 380, child: centerRow(context, textThemeLight, colorScheme)),
        CarouselSlider.builder(
          itemCount: 3,
          options: CarouselOptions(
            clipBehavior: Clip.none,
            enlargeCenterPage: true,
            aspectRatio: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentDay = index;
                print(_currentDay);
              });
            },
          ),
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
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
                          widget.incomingModel.nextDaysDate[index],
                          style: textThemeLight.subtitle1,
                        )),
                    Positioned(
                      top: context.height2 * 7,
                      child: Text(widget.incomingModel.condition[index], style: textThemeLight.subtitle3),
                    ),
                    Positioned(top: context.height2 * 9, child: weatherText(context, _currentDay)),
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

//TODO: CHECK THIS!!!

  SizedBox weatherIcon(BuildContext context, incomingIndex) {
    return SizedBox(
      height: context.height2 * 23,
      child: Image.asset("${widget.incomingSelectedCountryMap["imageList"]![incomingIndex]}"),
    );
  }

  GradientText weatherText(BuildContext context, incomingIndex) {
    return GradientText(
      "${widget.incomingModel.forecast!.forecastday![incomingIndex].day!.maxtempC!.ceil()}\u00B0",
      style: textThemeLight.headline3.copyWith(
        fontSize: context.height2 * 18,
      ),
      gradientDirection: GradientDirection.ttb,
      radius: 2.4,
      colors: [
        Colors.white,
        Colors.white,
        Colors.white.withOpacity(0.5),
        Colors.white.withOpacity(0.1),
      ],
    );
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
                centerRowColumn("${widget.incomingModel.current?.windMph}", "wind", FontAwesomeIcons.wind, colorScheme, textThemeLight),
                centerRowColumn("${widget.incomingModel.current?.humidity}", "Humidity", FontAwesomeIcons.droplet, colorScheme, textThemeLight),
                centerRowColumn("${widget.incomingModel.current?.visibility}", "Visibility", FontAwesomeIcons.eye, colorScheme, textThemeLight),
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
      height: context.height2 * 33,
      width: context.width2 * 70,
      child: SvgPicture.asset("assets/bg.svg"),
    ),
  );
}
