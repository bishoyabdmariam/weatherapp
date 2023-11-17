import 'package:weatherapp/api/apiRepo.dart';
import 'package:weatherapp/model/currentWeatherData.dart';
import 'package:weatherapp/model/fiveDaysData.dart';

class WeatherService {
  String city;

  WeatherService({
    required this.city,
  });

//https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = "appid=e586403fbd222f3b9798954fddac4f25";

  void getCurrentWeatherData({
    Function()? beforeSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic data)? onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    print(url);
    print("''''''''''''''''''''url'''''''''''''''''''''");
    ApiRepository(
      url: url,
    ).get(
      beforeSend: () => beforeSend!(),
      onSuccess: (data) => onSuccess!(CurrentWeatherData.fromJson(data)),
      onError: (error) => onError!(error),
    );
  }

  void getFiveThreeHourForecastData({
    Function()? beforeSend,
    Function(List<FiveDaysData> fiveDyasData)? onSuccess,
    Function(dynamic data)? onError,
  }) {
    final url = "$baseUrl/forecast?q=$city&lang=en&$apiKey";
    ApiRepository(
      url: url,
    ).get(
      beforeSend: () => beforeSend!(),
      onSuccess: (data) {
        onSuccess!(
          ((data["list"] as List)
              .map((t) => FiveDaysData.fromJson(t))
              .toList()),
        );
      },
      onError: (error) => onError!(error),
    );
  }
}
