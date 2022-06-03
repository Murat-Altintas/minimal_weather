// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_weatherapp/search/grid_list_widget.dart';
import 'package:minimal_weatherapp/search/text_form_field_widget.dart';
import 'package:minimal_weatherapp/style/color_scheme.dart';
import '../services/control.dart';
import '../style/text_theme.dart';
import "/style/context_extension.dart";

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final cityTextController = TextEditingController();
  final apiList = ApiListFillClass();

  @override
  Widget build(BuildContext context) {
    final textThemeLight = TextThemeLight.instance!;
    final colorScheme = ColorSchemeLight.instance!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: context.height2 * 3,
            right: context.height2 * 3,
          ),
          child: Column(
            children: [
              Text("Search Location", style: textThemeLight.headline1),
              SizedBox(
                height: context.lowContainer,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.width2 * 70,
                    height: context.mediumContainer,
                    child: textFormField(cityTextController, textThemeLight, colorScheme, context),
                  ),
                  SizedBox(
                    width: context.lowContainer,
                    child: TextButton(
                        onPressed: () async {
                          await apiList.apiListFill(cityTextController.text);
                          setState(() {
                            apiList.imageChangeVoid(incomingRegion: apiList.region);
                          });
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
                          apiList.showListWidgetData.clear;
                          setState(() {});
                        },
                        child: Icon(
                          Icons.delete,
                          color: colorScheme.purple,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: context.lowContainer,
              ),
              listFillWidget(textThemeLight),
            ],
          ),
        ),
      ),
    );
  }

  Expanded listFillWidget(TextThemeLight textThemeLight) {
    return Expanded(
      child: apiList.hourlyHumidityList.isNotEmpty
          ? GridView.builder(
              itemCount: apiList.testList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: context.height2 * 5,
                    child: Stack(
                      children: [
                        SvgPicture.asset("assets/bg.svg"),
                        Padding(
                          padding: context.paddingMedium,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: context.lowContainer,
                                  ),
                                  Text(
                                    "${apiList.testList[index]}",
                                    style: textThemeLight.headline3,
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
                            height: context.height2 * 10,
                            child: LottieBuilder.asset(apiList.imageTop),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
          : const Text("test"),
    );
  }
}

//                                   SizedBox(
//                                     height: context.lowContainer,
//                                   ),
//                                   Text(
//                                     "${apiList.hourlyTempC[index]}" "\u00B0",
//                                     style: textThemeLight.headline3,
//                                   ),
//                                   Text(
//                                     apiList.conditionText,
//                                     style: textThemeLight.subtitle4,
//                                   ),
//                                   SizedBox(
//                                     height: context.lowContainer,
//                                   ),
//                                   Text(
//                                     apiList.region,
//                                     style: textThemeLight.subtitle3,
//                                   ),
