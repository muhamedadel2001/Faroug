class WeatherModel {
  final String city;
  final String description;
  final double currentTemp;

  WeatherModel({
    required this.city,
    required this.description,
    required this.currentTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['location']['name'],
      description: json['current']['condition']['text'],
      currentTemp: json['current']['temp_c'],
    );
  }
}

class WeatherForecastModel {
  final String city;
  final List<HourlyForecast> hourlyForecast;

  WeatherForecastModel({
    required this.city,
    required this.hourlyForecast,
  });

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    return WeatherForecastModel(
      city: json['location']['name'],
      hourlyForecast: (json['forecast']['forecastday'][0]['hour'] as List)
          .map((hour) => HourlyForecast.fromJson(hour))
          .toList(),
    );
  }
}

class HourlyForecast {
  final String time;
  final double temp;
  final String iconUrl;
  final String description;

  HourlyForecast({
    required this.time,
    required this.temp,
    required this.iconUrl,
    required this.description,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {

    String time = json['time'];
    String formattedTime = time.split(' ')[1];

    return HourlyForecast(
      time: formattedTime,
      temp: json['temp_c'],
      iconUrl: 'http:${json['condition']['icon']}',
      description: json['condition']['text'],
    );
  }
}

