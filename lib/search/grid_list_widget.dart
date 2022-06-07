// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_weatherapp/style/text_theme.dart';
import "/style/context_extension.dart";
import '../services/control.dart';

Expanded listFillWidget(TextThemeLight textThemeLight, apiListFillVoidClass apiList) {
  return Expanded(
    child: apiList.regionList.isNotEmpty
        ? GridView.builder(
            itemCount: apiList.regionList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print(apiList.tempCList[index]);
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
                                          "${apiList.showListWidget["regionList"]![index]}",
                                          style: textThemeLight.headline3,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${apiList.showListWidget["tempCList"]![index]}" "\u00B0",
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
                                          "${apiList.showListWidget["conditionList"]![index]}",
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
                            height: context.height2 * 10,
                            child: LottieBuilder.asset(apiList.showListWidget["imageList"]![index]),
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
