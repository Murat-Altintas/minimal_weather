class WeatherResponse {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    current = json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  }
}

class Location {
  String? region;

  Location.fromJson(Map<String, dynamic> json) {
    region = json['region'];
  }
}

class Current {
  double? tempC;
  Condition? condition;
  double? windMph;
  double? pressureMb;
  int? humidity;

  Current.fromJson(Map<String, dynamic> json) {
    tempC = json['temp_c'];
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    windMph = json['wind_mph'];
    pressureMb = json['pressure_mb'];
    humidity = json['humidity'];
  }
}

class Condition {
  String? text;
  int? code;

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    code = json['code'];
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(Forecastday.fromJson(v));
      });
    }
  }
}

class Forecastday {
  String? date;
  Day? day;
  List<Hour>? hour;

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }
}

class Day {
  double? mintempC;
  double? maxtempC;
  double? maxwindMph;
  Condition? condition;

  Day.fromJson(Map<String, dynamic> json) {
    mintempC = json['mintemp_c'];
    maxtempC = json['maxtemp_c'];
    maxwindMph = json['maxwind_mph'];
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
  }
}

class Hour {
  String? time;
  double? tempC;
  Condition? condition;
  double? windMph;
  int? windDegree;
  double? pressureMb;
  int? humidity;

  Hour.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    tempC = json['temp_c'];
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    windMph = json['wind_mph'];
    windDegree = json['wind_degree'];
    pressureMb = json['pressure_mb'];
    humidity = json['humidity'];
  }
}
