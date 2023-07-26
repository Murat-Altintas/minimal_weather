// ignore_for_file: prefer_final_fields

import 'package:minimal_weatherapp/services/api.dart';

import 'forecast_response_model.dart';

class ApiListFillVoidClass {
  DataService dataService = DataService();
  String region = "", imageTop = "";
  double tempC = 0.0, visibilityMiles = 0.0, windMph = 0.0;
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
  final weatherList = <WeatherResponse>[];

  Future<bool> apiListFillVoid(String text) async {
    final response = await dataService.getWeather(text);
    var isContain = false;

    for (var i in weatherList) {
      if (response!.location!.name! == i.locationName) {
        isContain = true;
      }
    }
    if (isContain) {
      return false;
    }

    weatherList.add(response!);
    region = response.location!.name!;
    tempC = response.current!.tempC!;
    _imageCode = response.current!.condition!.code!;
    humidity = response.current!.humidity!;
    visibilityMiles = response.current!.visibility!;
    windMph = response.current!.windMph!;

    for (var element in response.forecast!.forecastday![0].hour!) {
      _incomingHourlyImageList.add(element.condition!.code);
    }
    /*
    for (var element in response.forecast!.forecastday!) {
      nextDaysMaxTempCList.add(element.day!.maxtempC!.ceil());
    }
  */

    return true;
  }

  void imageChangeVoid({incomingDATA, incomingRegion, incomingImage, incomingTempC, incomingHourlyTempC, incomingDayHours, incomingHourlyImages, incomingNextDaysTempC, incomingNextDaysDate}) async {
    Map<String, List<int>> imageListMap = {
      "cloudy": [1006, 1009],
      "lightRainy": [1063, 1150, 1153, 1183, 1198, 1240],
      "sunny": [1000],
      "lightCloudy": [1003],
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

        case "lightCloudy":
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
    incomingDayHours ??= dayHoursList;
    incomingHourlyTempC ??= hourlyTempCList;
    incomingHourlyImages ??= hourlyImageList;
    incomingNextDaysDate ??= nextDaysDateList;

    regionList.add(incomingRegion);
    tempCList.add(incomingTempC);
    imageList.add(imageTop);
    dayHoursList.add(dayHoursList);
    hourlyTempCList.add(incomingHourlyTempC);
    hourlyImageList.add(incomingHourlyImages);
    nextDaysDateList.add(incomingNextDaysDate);

    showSelectedCountryMap = {
      "regionList": regionList,
      "tempCList": tempCList,
      "imageList": imageList,
      "conditionList": conditionList,
      "dayHoursList": dayHoursList,
      "hourlyTempCList": hourlyTempCList,
      "hourlyImageList": hourlyImageList,
      "nextDaysDateList": nextDaysDateList,
    };
  }
}
