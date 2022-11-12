import 'package:flutter/material.dart';
import 'package:goys_boarding_house/models/restaurant_model.dart';
import 'package:goys_boarding_house/models/space.dart';
import 'package:goys_boarding_house/services/api_service.dart';

enum ResultState {
  none,
  loading,
  error,
}

class SpaceProvider extends ChangeNotifier {
  ApiService apiService = ApiService();

  ResultState _state = ResultState.none;
  ResultState get state => _state;

  List<Space> _space = [];
  List<Space> get space => _space;

  List<RestaurantModel> _resto = [];
  List<RestaurantModel> get resto => _resto;


  void getAllSpaces() async {
    _state = ResultState.loading;
    try {
      final response = await apiService.spaceList();
      _space = response;
      notifyListeners();
      _state = ResultState.none;
    } catch (e) {
      _state = ResultState.error;
    }
  }

  void getAllRestos() async {
    _state = ResultState.loading;
    try {
      final response = await apiService.restoList();
      _resto = response;
      notifyListeners();
      _state = ResultState.none;
    } catch (e) {
      _state = ResultState.error;
    }
  }

}
