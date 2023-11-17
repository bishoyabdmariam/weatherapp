import 'package:get/get.dart';
import 'package:weatherapp/model/currentWeatherData.dart';
import 'package:weatherapp/service/weatherService.dart';

import '../model/fiveDaysData.dart';

class HomeController extends GetxController {
  String? city;

  HomeController({
    this.city,
  });

  CurrentWeatherData currentWeatherData = CurrentWeatherData();

  List<FiveDaysData> fiveDaysData = [];
  List<CurrentWeatherData> dataList = [];

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getCurrentWeatherData() {
    WeatherService(city: city!).getCurrentWeatherData(onSuccess: (data) {
      currentWeatherData = data;
      update();
    }, onError: (error) {
      print(error);
      update();
    });
  }

  void getFiveDaysData() {
    WeatherService(city: city!).getFiveThreeHourForecastData(onSuccess: (data) {
      fiveDaysData = data;
      update();
    }, onError: (error) {
      print(error);
      update();
    });
  }

  void getTopFiveCities() {
    List<String> cities = [
      "sohag",
      "cairo",
      "london",
      "paris",
      "fayoum",
    ];
    cities.forEach((element) {
      WeatherService(city: element).getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        print(error);
        update();
      });
    });
  }
}
