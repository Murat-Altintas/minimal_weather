// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import '../services/control.dart';
import "/style/context_extension.dart";
import 'package:sizer/sizer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final _cityTextController = TextEditingController();
  final _apiListFill = ApiListFill();

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingMedium,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.width2 * 75,
                    child: TextField(
                      controller: _cityTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(context.lowestContainer)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(context.lowestContainer)),
                          borderSide: BorderSide(color: mainTheme.primaryColor, width: 2),
                        ),
                        labelText: 'Search',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.mediumContainer,
                    width: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _apiListFill.apiListFill(_cityTextController.text);
                        setState(() {
                          _apiListFill.imageChangeVoid();
                        });
                      },
                      child: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await _apiListFill.apiListFill(_cityTextController.text);
                        setState(() {
                          _apiListFill.imageChangeVoid();
                          _apiListFill.nextDaysMinTempC.clear();
                        });
                      },
                      child: const Text('Clear')),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _apiListFill.nextDaysMinTempC.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _apiListFill.nextDaysMinTempC.isNotEmpty
                        ? ListTile(
                            leading: Text("${_apiListFill.nextDaysMinTempC[index]}"),
                          )
                        : const Text("test");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
