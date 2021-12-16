import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountModle with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void add() {
    _count++;
    notifyListeners();
  }
}
