///
/// File: \lib\src\models\search_helper_model.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Tuesday, 2023-02-21 5:05:01 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Tuesday, 2023-02-21 9:50:11 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///
import 'package:flutter/material.dart';

class SearchHelperModel extends ChangeNotifier {
  String _selectedKey = '';
  String get selectedKey => _selectedKey;

  set selectedKey(String value) {
    _selectedKey = value;
    notifyListeners();
  }
}
