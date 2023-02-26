///
/// File: \lib\src\models\divider_model.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Thursday, 2023-02-23 11:47:00 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Saturday, 2023-02-25 11:22:01 am
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
  Offset? _size;
  double _thickness = 1;
  bool _isHovered = false;
  bool _isResizing = false;

  final double? maxWidth;
  final double? maxHeight;
  final double? minWidth;
  final double? minHeight;

  /// whether [isResizing]
  bool get isResizing => _isResizing;
  set isResizing(bool value) => {
        _isResizing = value,
      };

  /// whether [isHovered]
  bool get isHovered => _isHovered;
  set isHovered(bool isHovered) => {
        _isHovered = isHovered,
        notifyListeners(),
      };

  /// [position] of this [Divider]
  Offset? get size => _size;
  set size(Offset? value) {
    var p = _size;
    _size = value;
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
  List<Object?> get props => [_size, _thickness, _isHovered];
}
