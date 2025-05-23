import 'dart:ffi';

class CurrentWeather{
  late String _city;
  late String _description;
  late double _currentTemp;
  late DateTime _currentTime;
  late DateTime _sunrise;
  late DateTime _sunset;

  //todo: Generative Constructor:
  CurrentWeather({required String city, required String description, required double currentTemp, required DateTime currentTime, required DateTime sunrise, required DateTime sunset}){
    _city = city;
    _description = description;
    _currentTemp = currentTemp;
    _currentTime = currentTime;
    _sunrise = sunrise;
    _sunset = sunset;
  }


  //todo: Factory Constructor - parses OpenWeather API data:
  //https://openweathermap.org/current use this to figure out how to parse
  factory CurrentWeather.fromOpenWeatherData(data){
    return CurrentWeather(city: data['name'], description: data['weather'][0]['description'], currentTemp: data['main']['temp'],
       //expect different date - don't use DateTime.now()
       //  https://api.dart.dev/dart-core/DateTime/DateTime.fromMillisecondsSinceEpoch.html - USE THIS!!!
       currentTime: DateTime.fromMillisecondsSinceEpoch(data['dt'].toInt()*1000),
       sunrise: DateTime.fromMillisecondsSinceEpoch(data['sys']['sunrise'].toInt()*1000),
       sunset: DateTime.fromMillisecondsSinceEpoch(data['sys']['sunset'].toInt()*1000)


    );
  }



  //todo: GETTER AND SETTER + EXCEPTION FOR "city"
  String get city{
    return _city;
  }

  set city(String value) {
    if(value.trim().isEmpty){
      throw Exception('City cannot be empty');
    }
    _city = value;
  }



  //todo: GETTER AND SETTER + Exception for "description"
  String get description{
    return _description;
  }

  set description(String value) {
    if(value.trim().isEmpty){
      throw Exception('Description cannot be empty');
    }
    _description = value;
  }

  //todo: GETTER AND SETTER + Exception for "currentTemp" - must be between -100 and 100
  double get currentTemp{
    return _currentTemp;
  }

  set currentTemp(double value){
    if(value > 100 || value < -100){
      throw Exception('Temperature must be between -100 and 100');
    }
    _currentTemp = value;
  }

  //todo: GETTER AND SETTER + Exception for "currentTime" (I'm assuming - github says "currentTemp") must ensure currentTime is not in the future

  DateTime get currentTime{
    return _currentTime;
  }

  set currentTime(DateTime value){
    //https://api.flutter.dev/flutter/dart-core/DateTime/isAfter.html - try isAfter
    //before- if(value > DateTime.now())
    if(value.isAfter(DateTime.now())){
      throw Exception('Current time cannot be in the future');
    }
    _currentTime = value;
  }
  
  
  


  //todo: GETTER AND SETTER + Exception for "sunrise"
  DateTime get sunrise{
    return _sunrise;
  }
  set sunrise(DateTime value){
    if(value.day != _currentTime.day){
      throw Exception('Sunrise must be on the same day as current time');
    }
    if(value.isAfter(sunset)){
      throw Exception('Sunrise cannot be after sunset');
    }
    _sunrise = value;
  }

  //todo: GETTER AND SETTER + Exception for "sunset"
  DateTime get sunset{
    return _sunset;
  }
  set sunset(DateTime value){
    if(value.day != _currentTime.day){
      throw Exception('Sunset must be on the same day as current time');
    }
    if(value.isBefore(sunrise)){
      throw Exception('Sunset cannot be before sunrise');
    }
    _sunset = value;
  }

  @override String toString(){
    return 'City: $_city, Description: $_description, Current Temperature: $_currentTemp, Current Time: $_currentTime, Sunrise: $_sunrise, Sunset: $_sunset';

  }
}







