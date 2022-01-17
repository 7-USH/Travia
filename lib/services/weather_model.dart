class Weather {
  String? cityName;
  double? temp;

  Weather({this.cityName, this.temp});

  double? getTemp() {
    return temp;
  }

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
  
    temp = json["main"]["temp"];
  
  }
}
