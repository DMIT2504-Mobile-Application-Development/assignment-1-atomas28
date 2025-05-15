import 'dart:io';
import 'package:http/http.dart' as http;

const String weatherApiKey = '0f4f5f79bbfab25d0941b2aec6a701f2';
const String currentWeatherEndpoint = 'https://api.openweathermap.org/data/2.5/weather';

//not sure why the function is prompting me to use 'required' but it prevents a null error with the city parameter.
Future<dynamic> getWeatherForCity({required String city}) async{
  //Use the currentWeatherEndpoint from the previous step above to create the full URL
  final String url = '$currentWeatherEndpoint/?units=metric&q=$city&appid=$weatherApiKey';
  final response = await http.get(Uri.parse(url));

  //todo: If status code is anything other than 200, throw an EXCEPTION with the message:
  // There was a problem with the request: status <status code> received
  if(response.statusCode != 200)
    {
      throw Exception("There was a problem with the request: status ${response.statusCode} received");
    }




}