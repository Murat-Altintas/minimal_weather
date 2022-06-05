// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:minimal_weatherapp/style/text_theme.dart';
import "/style/context_extension.dart";
import '../services/control.dart';

Expanded listFillWidget(TextThemeLight textThemeLight, ApiListFillClass apiList) {
  return Expanded(
    child: apiList.hourlyHumidityList.isNotEmpty
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
                                    "${apiList.regionList[index]}",
                                    style: textThemeLight.headline3,
                                  ),
                                  Text(
                                    "${apiList.tempCList[index]}" "\u00B0",
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
                ),
              );
            })
        : const Text("test"),
  );
}
