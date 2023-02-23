///
/// File: \lib\src\models\divider_model.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Thursday, 2023-02-23 11:47:00 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Thursday, 2023-02-23 3:10:45 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DividerModel extends ChangeNotifier with EquatableMixin {
  Offset? _pos = const Offset(250, 0);
  double _thickness = 1;
  bool _isHovered = false;

  bool get isHovered => _isHovered;
  set isHovered(bool isHovered) => {
        _isHovered = isHovered,
        notifyListeners(),
      };

  /// [position] of this [Divider]
  Offset? get pos => _pos;
  set pos(Offset? value) => {
        _pos = value,
        notifyListeners(),
      };

  /// [thickness] of this [Divider]
  double get thickness => _thickness;
  set thickness(double value) => {
        _thickness = value,
        notifyListeners(),
      };

  @override
  List<Object?> get props => [_pos, _thickness, _isHovered];
}
