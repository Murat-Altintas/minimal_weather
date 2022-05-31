import 'package:flutter/material.dart';
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
  final _apiListFill = ApiListFill();

  @override
  Widget build(BuildContext context) {
    final weatherTheme = TextThemeLight.instance!;
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
              Text("Search Location", style: weatherTheme.headline1),
              SizedBox(
                height: context.lowContainer,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.width2 * 70,
                    height: context.mediumContainer,
                    child: textFormField(cityTextController, weatherTheme, colorScheme, context),
                  ),
                  SizedBox(
                    width: context.lowContainer,
                    child: TextButton(
                        onPressed: () async {
                          await _apiListFill.apiListFill(cityTextController.text);
                          setState(() {
                            _apiListFill.imageChangeVoid();
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
                        onPressed: () async {
                          await _apiListFill.apiListFill(cityTextController.text);
                          setState(() {
                            _apiListFill.imageChangeVoid();
                            _apiListFill.nextDaysMinTempC.clear();
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: colorScheme.purple,
                        )),
                  ),
                ],
              ),
              GridListWidget(),
              // mainList,
            ],
          ),
        ),
      ),
    );
  }
}
