///
/// File: \lib\src\models\divider_model.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Thursday, 2023-02-23 11:47:00 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Thursday, 2023-02-23 5:34:15 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----"ctrl+k ctrl+l"
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DividerModel extends ChangeNotifier with EquatableMixin {
  Offset? _pos;
  double _thickness = 1;
  bool _isHovered = false;
  final double? maxWidth;
  final double? maxHeight;
  final double? minWidth;
  final double? minHeight;

  bool get isHovered => _isHovered;
  set isHovered(bool isHovered) => {
        _isHovered = isHovered,
        notifyListeners(),
      };

  /// [position] of this [Divider]
  Offset? get pos => _pos;
  set pos(Offset? value) {
    var p = _pos;
    _pos = value;
    if (p != null) {
      notifyListeners();
    }
  }

  /// [thickness] of this [Divider]
  double get thickness => _thickness;
  set thickness(double value) => {
        _thickness = value,
        notifyListeners(),
      };

  DividerModel({
    this.maxWidth,
    this.maxHeight,
    this.minWidth,
    this.minHeight,
  });
  @override
  List<Object?> get props => [_pos, _thickness, _isHovered];
}
