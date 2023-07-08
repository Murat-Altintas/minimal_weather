// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minimal_weatherapp/details/weather_detail_page.dart';
import 'package:minimal_weatherapp/style/text_theme.dart';

import "/style/context_extension.dart";
import '../services/control.dart';

Expanded listFillWidget(TextThemeLight textThemeLight, ApiListFillVoidClass apiList, textControllerData) {
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
                  /*
                  List<int> newMaxTempCList = [];
                  for (var element in weatherList[index].forecast!.forecastday!) {
                    newMaxTempCList.add(element.day!.maxtempC!.ceil());
                  }
                   */

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WeatherDetailPage(
                        incomingSelectedCountryMap: apiList.showSelectedCountryMap,
                        incomingIndex: index,
                        incomingRegion: model.locationName,

                        //incomingMaxTempCList: newMaxTempCList,
                        incomingMaxTempCList: model.maxTampC,
                        incomingWeatherList: weatherList,
                      ),
                    ),
                  );
                  print("Giden DATAAAAAAAAAAAAAAA");
                  print(index);
                  print(model.maxTampC);
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
                                          //"${apiList.showSelectedCountryMap["regionList"]![index]}",
                                          style: textThemeLight.headline3,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    model.currentTemp,
                                    //"${weatherList[index].current!.tempC}" "\u00B0",
                                    //"${apiList.showSelectedCountryMap["tempCList"]![index]}"
                                    style: textThemeLight.headline3,
                                  ),
                                  SizedBox(
                                    height: context.lowestContainer,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: context.width2 * 20,
                                      height: context.height2 * 10,
                                      child: SingleChildScrollView(
                                        child: Text(
                                          model.conditionText,
                                          //"${weatherList[index].current!.condition!.text!}",
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
                          left: context.width2 * 22,
                          top: context.height2 * 10,
                          child: SizedBox(
                            height: context.height2 * 8,
                            child: Image.asset(
                              apiList.showSelectedCountryMap["imageList"]![index],
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
