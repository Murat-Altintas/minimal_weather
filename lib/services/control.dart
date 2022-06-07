// ignore_for_file: prefer_final_fields

import 'package:minimal_weatherapp/services/api.dart';
import 'package:intl/intl.dart';

class apiListFillVoidClass {
  DataService dataService = DataService();
  String region = "", conditionText = "", imageTop = "";
  double tempC = 0.0, pressureMb = 0.0, windMph = 0.0;
  int _imageCode = 0, humidity = 0;
  List<dynamic> hours = [],
      hourlyTempC = [],
      _incomingHourlyImageList = [],
      hourlyImageList = [],
      hourlyHumidityList = [],
      hourlyPressureMbList = [],
      nextDaysDate = [],
      nextDaysMinTempC = [],
      nextDaysMaxTempC = [],
      hourlyWindMphList = [],
      regionList = [],
      tempCList = [],
      imageList = [],
      conditionList = [];
  Map<String, List<dynamic>> showListWidget = {};

  Future<void> apiListFillVoid(String text) async {
    final response = await dataService.getWeather(text);
    region = response.location!.name!;

    tempC = response.current!.tempC!;
    conditionText = response.current!.condition!.text!;
    _imageCode = response.current!.condition!.code!;
    humidity = response.current!.humidity!;
    pressureMb = response.current!.pressureMb!;
    windMph = response.current!.windMph!;

    for (var element in response.forecast!.forecastday![0].hour!) {
      var incomingDate = DateTime.parse(element.time!);
      var convertedDate = DateFormat('hh a').format(incomingDate);
      hours.add(convertedDate);
    }

    for (var element in response.forecast!.forecastday![0].hour!) {
      hourlyTempC.add(element.tempC);
    }

    for (var element in response.forecast!.forecastday![0].hour!) {
      _incomingHourlyImageList.add(element.condition!.code);
    }

    for (var element in response.forecast!.forecastday![0].hour!) {
      _incomingHourlyImageList.add(element.condition!.code);
    }

    for (var element in response.forecast!.forecastday![0].hour!) {
      hourlyHumidityList.add(element.humidity);
    }

    for (var element in response.forecast!.forecastday![0].hour!) {
      hourlyWindMphList.add(element.windMph);
    }

    for (var element in response.forecast!.forecastday![0].hour!) {
      hourlyPressureMbList.add(element.pressureMb);
    }

    for (var element in response.forecast!.forecastday!) {
      var incomingDate = DateTime.parse(element.date!);
      var convertedDate = DateFormat('EEEE').format(incomingDate);
      nextDaysDate.add(convertedDate);
    }

    for (var element in response.forecast!.forecastday!) {
      nextDaysMinTempC.add(element.day!.mintempC);
    }

    for (var element in response.forecast!.forecastday!) {
      nextDaysMaxTempC.add(element.day!.maxtempC);
    }
  }

  void imageChangeVoid({String? incomingRegion, String? incomingImage, String? incomingCondition, double? incomingTempC}) async {
    Map<String, List<int>> imageListMap = {
      "cloudy": [1006, 1009],
      "lightRainy": [1063, 1150, 1153, 1183, 1198, 1240],
      "sunny": [1000],
      "lightcloudy": [1003],
      "mediumRainy": [1066, 1072, 1087, 1168, 1186, 1189, 1192, 1243],
      "heavyRainy": [1171, 1195, 1201, 1273, 1276],
      "fog": [1030, 1135, 1147],
      "lightSnowy": [1066, 1069, 1024, 1210, 1213, 1216, 1249, 1255, 1261],
      "heavySnowy": [1114, 1117, 1207, 1219, 1222, 1225, 1237, 1258, 1264]
    };

    String matchAssets(String key) {
      switch (key) {
        case "cloudy":
          return "assets/lotties/4806-weather-windy.json";

        case "lightRainy":
          return "assets/lotties/4801-weather-partly-shower.json";

        case "sunny":
          return "assets/lotties/4804-weather-sunny.json";

        case "lightcloudy":
          return "assets/lotties/4800-weather-partly-cloudy.json";

        case "mediumRainy":
          return "assets/lotties/4805-weather-thunder.json";

        case "heavyRainy":
          return "assets/lotties/4803-weather-storm.json";

        case "fog":
          return "assets/lotties/4795-weather-mist.json";

        case "lightSnowy":
          return "assets/lotties/4802-weather-snow-sunny.json";

        case "heavySnowy":
          return "assets/lotties/4793-weather-snow.json";

        default:
          return "";
      }
    }

    imageListMap.forEach(
      (key, value) {
        if (value.contains(_imageCode)) {
          imageTop = matchAssets(key);
        }
      },
    );
    if (incomingRegion == "van") {
      incomingRegion = "van";
    }
    for (int element in _incomingHourlyImageList) {
      imageListMap.forEach(
        (String key, value) {
          if (value.contains(element)) {
            hourlyImageList.add(matchAssets(key));
          }
        },
      );
    }

    incomingRegion ??= region;
    incomingTempC ??= tempC;
    incomingImage ??= imageTop;
    incomingCondition ??= conditionText;
    imageList.add(imageTop);
    regionList.add(incomingRegion);
    tempCList.add(incomingTempC);
    conditionList.add(incomingCondition);

    showListWidget = {
      "regionList": regionList,
      "tempCList": tempCList,
      "imageList": imageList,
      "conditionList": conditionList,
    };
  }
}
