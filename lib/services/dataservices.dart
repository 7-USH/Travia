import 'package:http/http.dart' as http;
class dataservice
{
  void getWeather (String city) async
  {
    final queryParamters={'q':city,'appid':'399b437b2bb65612908fe3c8324b2189'};
    final uri=Uri.http('api.openweathermap.org', '/data/2.5/weather',queryParamters);
    final response=await http.get(uri);
    print(response);


  }
}