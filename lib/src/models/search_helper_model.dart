///
/// File: \lib\src\models\search_helper_model.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Tuesday, 2023-02-21 5:05:01 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Thursday, 2023-02-23 2:49:59 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///
import 'package:flutter/material.dart';

import '../widget.dart';

class SearchHelperModel extends ChangeNotifier {
  String _selectedKey = '';
  DividerModel _divider = DividerModel();

  DividerModel get divider => _divider;
  set divider(DividerModel value) => {
        _divider = value,
        debugPrint("SearchHelperModel.divider"),
        notifyListeners(),
      };

  String get selectedKey => _selectedKey;
  set selectedKey(String value) {
    _selectedKey = value;
    notifyListeners();
  }
}
