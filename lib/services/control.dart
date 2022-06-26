// ignore_for_file: prefer_final_fields

import 'package:minimal_weatherapp/services/api.dart';
import 'package:intl/intl.dart';

class ApiListFillVoidClass {
  DataService dataService = DataService();
  String region = "", conditionText = "", imageTop = "";
  double tempC = 0.0, pressureMb = 0.0, windMph = 0.0;
  int _imageCode = 0, humidity = 0;
  List<dynamic> hours = [],
      hourlyTempCList = [],
      _incomingHourlyImageList = [],
      hourlyImageList = [],
      hourlyHumidityList = [],
      hourlyPressureMbList = [],
      nextDaysDateList = [],
      nextDaysMinTempCList = [],
      nextDaysMaxTempCList = [],
      dayHoursList = [],
      regionList = [],
      tempCList = [],
      imageList = [],
      conditionList = [];

  Map<String, List<dynamic>> showSelectedCountryMap = {};

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
      hourlyTempCList.add(element.tempC);
    }

    for (var element in response.forecast!.forecastday![0].hour!) {
      _incomingHourlyImageList.add(element.condition!.code);
    }

    for (var element in response.forecast!.forecastday![0].hour!) {
      hourlyHumidityList.add(element.humidity);
    }

    for (var element in response.forecast!.forecastday![0].hour!) {
      var incomingHours = DateTime.parse(element.time!);
      var convertedHours = DateFormat('kk:mm').format(incomingHours);
      dayHoursList.add(convertedHours);
    }

    for (var element in response.forecast!.forecastday![0].hour!) {
      hourlyPressureMbList.add(element.pressureMb);
    }

    for (var element in response.forecast!.forecastday!) {
      var incomingDate = DateTime.parse(element.date!);
      var convertedDate = DateFormat('EEEE d MMMM').format(incomingDate);
      nextDaysDateList.add(convertedDate);
    }

    for (var element in response.forecast!.forecastday!) {
      nextDaysMinTempCList.add(element.day!.mintempC);
    }

    for (var element in response.forecast!.forecastday!) {
      nextDaysMaxTempCList.add(element.day!.maxtempC!.ceil());
    }
  }

  void imageChangeVoid(
      {incomingRegion,
      incomingImage,
      incomingCondition,
      incomingTempC,
      incomingHourlyTempC,
      incomingDayHours,
      incomingHourlyImages,
      incomingNextDaysTempC,
      incomingNextDaysDate}) async {
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
          return "assets/images/weather-windy.png";

        case "lightRainy":
          return "assets/images/weather-partly-shower.png";

        case "sunny":
          return "assets/images/weather-sunny.png";

        case "lightcloudy":
          return "assets/images/weather-partly-cloudy.png";

        case "mediumRainy":
          return "assets/images/weather-thunder.png";

        case "heavyRainy":
          return "assets/images/weather-storm.png";

        case "fog":
          return "assets/images/weather-mist.png";

        case "lightSnowy":
          return "assets/images/weather-snow-sunny.png";

        case "heavySnowy":
          return "assets/images/weather-snow.png";

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
    incomingDayHours ??= dayHoursList;
    incomingHourlyTempC ??= hourlyTempCList;
    incomingHourlyImages ??= hourlyImageList;
    incomingTempC ??= nextDaysMaxTempCList;
    incomingNextDaysDate ??= nextDaysDateList;

    regionList.add(incomingRegion);
    tempCList.add(incomingTempC);
    imageList.add(imageTop);
    conditionList.add(incomingCondition);
    dayHoursList.add(dayHoursList);
    hourlyTempCList.add(incomingHourlyTempC);
    hourlyImageList.add(incomingHourlyImages);
    nextDaysMaxTempCList.add(incomingNextDaysTempC);
    nextDaysDateList.add(incomingNextDaysDate);

    showSelectedCountryMap = {
      "regionList": regionList,
      "tempCList": tempCList,
      "imageList": imageList,
      "conditionList": conditionList,
      "dayHoursList": dayHoursList,
      "hourlyTempCList": hourlyTempCList,
      "hourlyImageList": hourlyImageList,
      "nextDaysMaxTempCList": nextDaysMaxTempCList,
      "nextDaysDateList": nextDaysDateList,
    };
  }
}
