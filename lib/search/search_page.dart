// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_weatherapp/search/grid_list_widget.dart';
import 'package:minimal_weatherapp/search/text_form_field_widget.dart';
import 'package:minimal_weatherapp/services/forecast_response_model.dart';
import 'package:minimal_weatherapp/style/color_scheme.dart';
import '../details/weather_detail_page.dart';
import "/style/context_extension.dart";
import '../services/control.dart';
import '../style/text_theme.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);
  final cityTextController = TextEditingController();
  var clearList = true;

  @override
  State<StatefulWidget> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final apiList = ApiListFillVoidClass();
  final textThemeLight = TextThemeLight.instance!;
  final colorScheme = ColorSchemeLight.instance!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: context.width2 * 3,
            right: context.width2 * 3,
            top: context.height2 * 3,
          ),
          child: Column(
            children: [
              Text("Search Location", style: textThemeLight.headline1),
              SizedBox(
                height: context.lowContainer,
              ),
              searchBarWidget(context, textThemeLight, colorScheme),
              SizedBox(
                height: context.lowContainer,
              ),
              Expanded(
                child: widget.clearList != true
                    ? const Text("Write a Location or Country Name")
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
              ),

              //CountryList(clearList: widget.clearList, apiList: apiList),
              //listFillWidget(textThemeLight, apiList, widget.clearList),
            ],
          ),
        ),
      ),
    );
  }

  Row searchBarWidget(BuildContext context, TextThemeLight textThemeLight, ColorSchemeLight colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.width2 * 70,
          height: context.mediumContainer,
          child: textFormField(widget.cityTextController, textThemeLight, colorScheme, context),
        ),
        SizedBox(
          width: context.lowContainer,
          child: TextButton(
              onPressed: () async {
                var result = await apiList.apiListFillVoid(widget.cityTextController.text);
                if (result == true) {
                  setState(() {
                    widget.clearList = true;
                    widget.cityTextController.clear();
                    apiList.imageChangeVoid();
                  });
                  print("search");
                  print(apiList.showSelectedCountryMap.values.first);
                }
              },
              child: Icon(
                Icons.search,
                color: colorScheme.purple,
              )),
        ),
        SizedBox(
          width: context.lowContainer,
          child: TextButton(
              onPressed: () {
                apiList.weatherList.clear();
                apiList.showSelectedCountryMap.clear();
                widget.clearList = false;
                setState(() {});
                print("Clear");
                print(apiList.showSelectedCountryMap.values.first);
              },
              child: Icon(
                Icons.delete,
                color: colorScheme.purple,
              )),
        ),
      ],
    );
  }
}
