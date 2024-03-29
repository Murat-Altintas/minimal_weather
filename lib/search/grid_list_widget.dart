// ignore_for_file: unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minimal_weatherapp/details/weather_detail_page.dart';
import 'package:minimal_weatherapp/search/search_page.dart';
import 'package:minimal_weatherapp/style/text_theme.dart';
import "/style/context_extension.dart";
import '../services/control.dart';

class CountryList extends StatelessWidget {
  const CountryList({
    super.key,
    required this.widget,
    required this.apiList,
    required this.textThemeLight,
  });

  final SearchPage widget;
  final ApiListFillVoidClass apiList;
  final TextThemeLight textThemeLight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget.clearList != true
          ? const SizedBox()
          : GridView.builder(
          itemCount: apiList.weatherList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            final model = apiList.weatherList[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WeatherDetailPage(
                      incomingSelectedCountryMap: apiList.showSelectedCountryMap,
                      incomingModel: model,
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
                                        style: textThemeLight.headline3,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  model.currentTemp,
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
                          child: Image.asset(apiList.showSelectedCountryMap["imageList"]![index]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}