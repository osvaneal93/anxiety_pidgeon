import 'package:flutter/material.dart';

class OnBoardingProvider with ChangeNotifier {
  
  int _currentPage = 0;
  get currentPage => _currentPage;
  set currentPage(int value){
    _currentPage = value;
    notifyListeners();
  }

  
}