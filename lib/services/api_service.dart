import 'package:dio/dio.dart';
import 'package:goys_boarding_house/models/restaurant_model.dart';
import 'package:goys_boarding_house/models/space.dart';

class ApiService {
  Future<List<Space>> spaceList() async {
    const String baseUrl = 'http://bwa-cozy.herokuapp.com/recommended-spaces';
    final dio = Dio();
    var response = await dio.get(baseUrl);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((item) => Space.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load character');
    }
  }

  Future<List<RestaurantModel>> restoList() async {
    const String baseUrl = 'https://restaurant-api.dicoding.dev';
    final dio = Dio();
    var response = await dio.get('$baseUrl/list');
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['restaurants'];
      return data.map((item) => RestaurantModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load character');
    }
  }

}
