///
/// File: \lib\src\models\search_model.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Sunday, 2023-02-19 9:20:32 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Tuesday, 2023-02-21 10:42:27 am
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///
import 'package:flutter/material.dart';

class SearchModel extends ChangeNotifier {
  Offset _position = const Offset(300, 300);
  bool _showSearchBar = false;
  String _strSearch = '';
  List<String> _searchResult = [];
  List<String> _searchMatchedResult = [];
  bool _isHovered = false;

  get isHovered => _isHovered;
  set isHovered(value) => {
        _isHovered = value,
        notifyListeners(),
      };

  /// Matched result
  List<String> get searchMatchedResult => _searchMatchedResult;
  set searchMatchedResult(value) => {
        _searchMatchedResult = value,
        notifyListeners(),
      };

  /// All results
  List<String> get searchResult => _searchResult;
  set searchResult(List<String> result) => {
        _searchResult = result,
        notifyListeners(),
      };

  /// Position
  Offset getPosition(Size size) {
    return checkPositon(size);
  }

  set position(value) => {
        _position = value,
        notifyListeners(),
      };

  /// Is [SearchBar] shown?
  get showSearchBar => _showSearchBar;
  set showSearchBar(value) => {
        _showSearchBar = value,
        notifyListeners(),
      };

  /// Your input while searching
  String get strSearch => _strSearch;
  set strSearch(value) => {
        _strSearch = value,
        notifyListeners(),
      };

  /// Moving
  void movingBox(DragUpdateDetails details, Size size) {
    // print(_position);
    // print(size);
    _position = Offset(
        _position.dx + details.delta.dx, _position.dy + details.delta.dy);
    notifyListeners();
  }

  Offset checkPositon(Size size) {
    if (_position.dx <= 0) {
      _position = Offset(0, _position.dy);
    }
    if (showSearchBar) {
      if (_position.dx >= size.width - 340) {
        _position = Offset(size.width - 340, _position.dy);
      }
    } else {
      if (_position.dx >= size.width - 40) {
        _position = Offset(size.width - 40, _position.dy);
      }
    }
    if (_position.dy <= 0) {
      _position = Offset(_position.dx, 0);
    }
    if (_position.dy >= size.height - 100) {
      _position = Offset(_position.dx, size.height - 100);
    }
    return _position;
  }
}
