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
    if(value > DateTime.now()){
      throw Exception('Current time cannot be in the future');
    }
  }



}







