///
/// File: \lib\tools\tree_view\src\models\base\node_base.dart
/// Project: flutter_demo_previewer
///
/// Created Date: Monday, 2023-02-06 10:01:20 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-06 10:01:59 am
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../tree_node.dart';

/// Base of Node
abstract class NodeBase<T> extends Equatable {
  /// name of node Type;
  ///
  /// Providing an initial value for nodeType. This shouldnt be change, if dont add a new NODE TYPE.
  final String nodeType;

  /// The unique string that identifies this object.
  final String key;

  /// The string value that is displayed on the [TreeNode].
  final String label;

  /// An optional icon that is displayed on the [TreeNode].
  final IconData? icon;

  /// An optional color that will be applied to the icon for this node.
  final Color? iconColor;

  /// An optional color that will be applied to the icon when this node
  /// is selected.
  final Color? selectedIconColor;

  /// Generic data model that can be assigned to the [TreeNode]. This makes
  /// it useful to assign and retrieve data associated with the [TreeNode]
  final T? data;

  /// view of main when node selected
  final Widget? subview;

  /// [nameSubview]
  final String? nameSubview;

  const NodeBase({
    required this.nodeType,
    required this.key,
    required this.label,
    this.icon,
    this.iconColor,
    this.selectedIconColor,
    this.data,
    this.subview,
    this.nameSubview,
  });

  /// Whether this object has a non-null icon.
  bool get hasIcon => icon != null && icon != null;

  /// Whether this object has data associated with it.
  bool get hasData => data != null;

  /// Map representation of this object
  Map<String, dynamic> get asMap {
    Map<String, dynamic> map = {
      "nodeType": nodeType,
      "key": key,
      "label": label,
      "icon": icon == null ? null : icon!.codePoint,
      "iconColor": iconColor == null ? null : iconColor!.toString(),
      "selectedIconColor":
          selectedIconColor == null ? null : selectedIconColor!.toString(),
      // "subview": subview,
      "nameSubview": nameSubview,
    };
    if (data != null) {
      map['data'] = data as T;
    }
    return map;
  }

  /// [copyWith]
  NodeBase<T> copyWith();
  // /// [fromMap]
  // static NodeBase<T> fromMap<T>(Map<String, dynamic> map) {
  //   return const NodeBase(key: '', label: '');
  // }

  @override
  String toString() {
    return const JsonEncoder().convert(asMap);
  }

  @override
  List<Object?> get props => [
        nodeType,
        key,
        label,
        icon,
        iconColor,
        selectedIconColor,
        data,
        subview,
        nameSubview,
      ];
}
