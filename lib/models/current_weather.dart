import 'dart:ffi';

class CurrentWeather{
  late String _city;
  late String _description;
  late double _currentTemp;
  late DateTime _currentTime;
  late DateTime _sunrise;
  late DateTime _sunset;


  CurrentWeather(String city, String description, double currentTemp, DateTime currentTime, DateTime sunrise, DateTime sunset){
    this.city = city;
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



}







