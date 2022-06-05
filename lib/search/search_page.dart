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
  ApiListFillClass apiListFillClass = ApiListFillClass();

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
                            apiList.imageChangeVoid();
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
              listFillWidget(textThemeLight, apiList),
            ],
          ),
        ),
      ),
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
