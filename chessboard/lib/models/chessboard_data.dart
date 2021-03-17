import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChessboardData extends ChangeNotifier {
  bool _isFinished = true;

  void _notifyListenersEx() {
    if (_isFinished) notifyListeners();
  }

  set setIsFinished(bool isFinished) {
    _isFinished = isFinished;
    notifyListeners();
  }

  get getIsFinished => _isFinished;

  var _map = Map<String, int>();

  get getMap => _map;

  set setMap(Map<String, int> val) {
    _map.clear();
    _map.addAll(val);

    _notifyListenersEx();
  }

  int _computeTime = 0;

  get getComputeTime => _computeTime;

  set setComputeTime(int computeTime) {
    _computeTime = computeTime;
    _notifyListenersEx();
  }

  int _columnCount = 5;

  get getColumnCount => _columnCount;

  int _rowCount = 4;

  get getRowCount => _rowCount;

  void changeWidthChessboard(int columnCount) {
    columnCount = columnCount > 0 ? columnCount : _columnCount;

    _columnCount = columnCount != null ? columnCount : _columnCount;

    _map.clear();

    _notifyListenersEx();
  }

  void changeHeightChessboard(int rowCount) {
    rowCount = rowCount > 0 ? rowCount : _rowCount;

    _rowCount = rowCount != null ? rowCount : _rowCount;
    _map.clear();

    _notifyListenersEx();
  }
}
