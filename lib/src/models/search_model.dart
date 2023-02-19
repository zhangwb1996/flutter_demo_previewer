///
/// File: \lib\src\models\search_model.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Sunday, 2023-02-19 9:20:32 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-20 12:20:53 am
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
  bool _showSearchResult = false;
  // bool _showSearchView = true;
  bool _showSearchBar = false;
  String _strSearch = '';
  List<String> _searchResult = [];
  List<String> _searchMatchedResult = [];

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
  Offset get position => _position;
  set position(value) => {
        _position = value,
        notifyListeners(),
      };

  // /// Whether the search view show
  // get showSearchView => _showSearchView;
  // set showSearchView(value) => _showSearchView = value;

  /// Is [ResultList] shown?
  get showSearchResult => _showSearchResult;
  set showSearchResult(showResult) => {
        _showSearchResult = showResult,
        notifyListeners(),
      };

  /// Is [SearchBar] shown?
  get showSearchBar => _showSearchBar;
  set showSearchBar(value) => {
        _showSearchBar = value,
        notifyListeners(),
      };

  /// Your input while searching
  get strSearch => _strSearch;
  set strSearch(value) => {
        _strSearch = value,
        notifyListeners(),
      };

  /// Moving
  void movingBox(DragUpdateDetails details) {
    _position = Offset(
        _position.dx + details.delta.dx, _position.dy + details.delta.dy);
    if (_position.dx <= 250) {
      _position = Offset(251, _position.dy);
    }
    if (_position.dx >= 500) {
      _position = Offset(500, _position.dy);
    }
    if (_position.dy <= 0) {
      _position = Offset(_position.dx, 0);
    }
    if (_position.dy >= 800) {
      _position = Offset(_position.dx, 0);
    }
    notifyListeners();
  }
}
