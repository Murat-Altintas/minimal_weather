// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minimal_weatherapp/details/weather_detail_page.dart';
import 'package:minimal_weatherapp/style/text_theme.dart';

import "/style/context_extension.dart";
import '../services/control.dart';

Expanded listFillWidget(
    TextThemeLight textThemeLight, ApiListFillVoidClass apiList) {
  final weatherList = apiList.weatherList;
  return Expanded(
    child: weatherList.isNotEmpty
        ? GridView.builder(
            itemCount: weatherList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final model = weatherList[index];
              return InkWell(
                onTap: () {
                  // print(apiList.showSelectedCountryMap['hourlyTempCList']!.length);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WeatherDetailPage(
                        incomingSelectedCountryMap:
                            apiList.showSelectedCountryMap,
                        incomingIndex: index,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: context.height2 * 4,
                    child: Stack(
                      children: [
                        SvgPicture.asset("assets/bg.svg"),
                        Padding(
                          padding: EdgeInsets.only(left: context.width2 * 4),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: context.lowestContainer,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: context.width2 * 35,
                                      height: context.height2 * 10,
                                      child: SingleChildScrollView(
                                        child: Text(
                                          model.locationName,
                                          // "${apiList.showSelectedCountryMap["regionList"]![index]}",
                                          style: textThemeLight.headline3,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    model.currentTemp,
                                    // "${apiList.showSelectedCountryMap["tempCList"]![index]}"
                                    // "\u00B0",
                                    style: textThemeLight.headline3,
                                  ),
                                  SizedBox(
                                    height: context.lowestContainer,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: context.width2 * 22,
                                      height: context.height2 * 10,
                                      child: SingleChildScrollView(
                                        child: Text(
                                          model.conditionText,
                                          // "${apiList.showSelectedCountryMap["conditionList"]![index]}",
                                          style: textThemeLight.subtitle4,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: context.width2 * 25,
                          top: context.height2 * 15,
                          child: SizedBox(
                            height: context.height2 * 8,
                            child: Image.asset(
                              apiList
                                  .showSelectedCountryMap["imageList"]![index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
        : const Text("test"),
  );
}
