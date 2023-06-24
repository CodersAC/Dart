import 'package:flutter/material.dart';

class UserData {
  String name;
  String email;
  String password;

  UserData({required this.name, required this.email, required this.password});
}

class UserDataProvider with ChangeNotifier {
  UserData _userData = UserData(name: '', email: '', password: '');

  UserData get userData => _userData;

  void updateUserData(UserData userData) {
    _userData = userData;
    notifyListeners();
  }
}

class SelectFacility {
  final String name;
  final String hospitalName;
  final String rehabName;
  final String policeName;
  final String fireName;
  final String brgyName;

  SelectFacility({
    required this.name,
    required this.hospitalName,
    required this.rehabName,
    required this.policeName,
    required this.fireName,
    required this.brgyName,
  });
}

class FacilityProvider extends ChangeNotifier {
  SelectFacility? selectedFacility;

  void setSelectedFacility(SelectFacility facility) {
    selectedFacility = facility;
    notifyListeners();
  }
}