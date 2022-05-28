import 'package:minimal_weatherapp/services/api.dart';

class ApiListFill {
  DataService dataService = DataService();
  String region = "", conditionText = "", imageTop = "", hourlyImage = "";
  double tempC = 0.0, pressureMb = 0.0, windMph = 0.0;
  int imageCode = 0, humidity = 0;
  List<dynamic> hours = [], hourlyTempC = [], hourlyImageList = [], hourlyyyy = [];

  Future<void> apiListFill(String text) async {
    final response = await dataService.getWeather(text);

    region = response.location!.region!;
    tempC = response.current!.tempC!;
    conditionText = response.current!.condition!.text!;
    imageCode = response.current!.condition!.code!;
    humidity = response.current!.humidity!;
    pressureMb = response.current!.pressureMb!;
    windMph = response.current!.windMph!;

    for (var element in response.forecast!.forecastday![0].hour!) {
      hours.add(element.time);
    }

    for (var element in response.forecast!.forecastday![0].hour!) {
      hourlyTempC.add(element.tempC);
    }

    for (var element in response.forecast!.forecastday![0].hour!) {
      hourlyImageList.add(element.condition!.code);
    }
  }

  void imageChangeVoid() {
    List<int> cloudy = [1006, 1009];
    List<int> lightRainy = [1063, 1150, 1153, 1183, 1198, 1240];
    List<int> mediumRainy = [1066, 1072, 1087, 1168, 1186, 1189, 1192, 1243];
    List<int> heavyRainy = [1171, 1195, 1201, 1273, 1276];
    List<int> fog = [1030, 1135, 1147];
    List<int> lightSnowy = [1066, 1069, 1024, 1210, 1213, 1216, 1249, 1255, 1261];
    List<int> heavySnowy = [1114, 1117, 1207, 1219, 1222, 1225, 1237, 1258, 1264];

    if (imageCode == 1000) {
      imageTop = "assets/lotties/4804-weather-sunny.json";
    }

    for (var element in hourlyImageList) {
      if (1000 == element) {
        hourlyImage = "assets/lotties/4804-weather-sunny.json";
        hourlyyyy.add(hourlyImage);
      }
    }

    if (imageCode == 1003) {
      imageTop = "assets/lotties/4800-weather-partly-cloudy.json";
    }

    for (var element in hourlyImageList) {
      if (1003 == element) {
        hourlyImage = "assets/lotties/4800-weather-partly-cloudy.json";
        hourlyyyy.add(hourlyImage);
      }
    }

    if (cloudy.contains(imageCode)) {
      imageTop = "assets/lotties/4806-weather-windy.json";
    }

    for (var element in hourlyImageList) {
      if (cloudy.contains(element)) {
        hourlyImage = "assets/lotties/4806-weather-windy.json";
        hourlyyyy.add(hourlyImage);
      }
    }

    if (fog.contains(imageCode)) {
      imageTop = "assets/lotties/4795-weather-mist.json";
    }

    for (var element in hourlyImageList) {
      if (fog.contains(element)) {
        hourlyImage = "assets/lotties/4795-weather-mist.json";
        hourlyyyy.add(hourlyImage);
      }
    }

    if (mediumRainy.contains(imageCode)) {
      imageTop = "assets/lotties/4805-weather-thunder.json";
    }

    for (var element in hourlyImageList) {
      if (mediumRainy.contains(element)) {
        hourlyImage = "assets/lotties/4805-weather-thunder.json";
        hourlyyyy.add(hourlyImage);
      }
    }

    if (heavyRainy.contains(imageCode)) {
      imageTop = "assets/lotties/4803-weather-storm.json";
    }
    for (var element in hourlyImageList) {
      if (heavyRainy.contains(element)) {
        hourlyImage = "assets/lotties/4803-weather-storm.json";
        hourlyyyy.add(hourlyImage);
      }
    }

    if (lightRainy.contains(imageCode)) {
      imageTop = "assets/lotties/4801-weather-partly-shower.json";
    }

    for (var element in hourlyImageList) {
      if (lightRainy.contains(element)) {
        hourlyImage = "assets/lotties/4801-weather-partly-shower.json";
        hourlyyyy.add(hourlyImage);
      }
    }

    if (lightSnowy.contains(imageCode)) {
      imageTop = "assets/lotties/4802-weather-snow-sunny.json";
    }

    for (var element in hourlyImageList) {
      if (lightSnowy.contains(element)) {
        hourlyImage = "assets/lotties/4802-weather-snow-sunny.json";
        hourlyyyy.add(hourlyImage);
      }
    }

    if (heavySnowy.contains(imageCode)) {
      imageTop = "assets/lotties/4793-weather-snow.json";
    }

    for (var element in hourlyImageList) {
      if (heavySnowy.contains(element)) {
        hourlyImage = "assets/lotties/4793-weather-snow.json";
        hourlyyyy.add(hourlyImage);
      }
    }
  }
}
