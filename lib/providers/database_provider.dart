import 'package:flutter/material.dart';
import 'package:goys_boarding_house/db/database_helper.dart';
import 'package:goys_boarding_house/models/restaurant_model.dart';

enum ResultState {
  none,
  loading,
  error,
}

class DatabaseProvider extends ChangeNotifier {
  late DatabaseHelper _dbHelper;

  List<RestaurantModel> _favorite = [];
  List<RestaurantModel> get favorite => _favorite;

  // mengimplementasi state management untuk mengakses data dari database
  DatabaseProvider() {
    _dbHelper = DatabaseHelper();
    _getAllFavorites();
  }

  ResultState _state = ResultState.loading;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  void _getAllFavorites() async {
    _favorite = await _dbHelper.getFavorite();
    if (_favorite.isNotEmpty) {
      _state = ResultState.none;
    } else {
      _state = ResultState.error;
      _message = 'Tidak ada data favorite';
    }
    notifyListeners();
  }

  Future<void> addFavorite(RestaurantModel restaurant) async {
    try {
      await _dbHelper.insertFavorite(restaurant);
      _getAllFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
    }
    notifyListeners();
  }

  Future<bool> isFavorited(String id) async {
    final favoriteRestaurant = await _dbHelper.getFavoriteById(id);
    return favoriteRestaurant.isNotEmpty;
  }

  void deleteFavorite(String id) async {
    try {
      await _dbHelper.deleteFavorite(id);
      _getAllFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
    }
    notifyListeners();
  }

  // void updateFavorite(RestaurantModel restaurant) async {
  //   try {
  //     await _dbHelper.updateFavorite(restaurant);
  //     _getAllFavorites();
  //   } catch (e) {
  //     _state = ResultState.error;
  //     _message = 'Error: $e';
  //   }
  //   notifyListeners();
  // }
}
