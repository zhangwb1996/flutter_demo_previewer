///
/// File: \lib\tools\tree_view\src\models\node_child.dart
/// Project: flutter_demo_previewer
///
/// Created Date: Thursday, 2023-02-02 11:14:33 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-06 1:01:00 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'package:flutter/widgets.dart';

import '../tree_node.dart';
import '../utilities.dart';
import 'widget.dart';

/// Defines the data used to display a [TreeNode].
///
/// Used by [TreeView] to display a [TreeNode].
///
/// This object allows the creation of key, label and icon to display
/// a node on the [TreeView] widget. The key and label properties are
/// required. The key is needed for events that occur on the generated
/// [TreeNode]. It should always be unique.
class NodeChild<T> extends NodeBase {
  const NodeChild({
    super.nodeType = "NodeChild",
    required super.key,
    required super.label,
    super.icon,
    super.iconColor,
    super.selectedIconColor,
    super.data,
    super.subview,
    super.nameSubview,
  });

  /// Creates a [NodeChild] from a string value. It generates a unique key.
  factory NodeChild.fromLabel(String label) {
    String key = Utilities.generateRandom();
    return NodeChild<T>(
      key: '${key}_$label',
      label: label,
    );
  }

  /// Creates a [NodeChild] from a Map<String, dynamic> map. The map
  /// should contain a "label" value. If the key value is
  /// missing, it generates a unique key.
  /// If the expanded value, if present, can be any 'truthful'
  /// value. Excepted values include: 1, yes, true and their
  /// associated string values.
  factory NodeChild.fromMap(Map<String, dynamic> map) {
    // NodeChild fromMap(Map<String, dynamic> map) {
    String nodeType = map['nodeType'];
    String? key = map['key'];
    String label = map['label'];
    var data = map['data'];
    Widget? subview = map['subview'];
    String? nameSubview = map['nameSubview'];
    key ??= Utilities.generateRandom();
    return NodeChild<T>(
      nodeType: nodeType,
      key: key,
      label: label,
      data: data,
      subview: subview,
      nameSubview: nameSubview,
    );
  }

  /// Creates a copy of this object but with the given fields
  /// replaced with the new values.
  @override
  NodeChild<T> copyWith({
    String? nodeType,
    String? key,
    String? label,
    IconData? icon,
    Color? iconColor,
    Color? selectedIconColor,
    T? data,
    Widget? subview,
    String? nameSubview,
  }) =>
      NodeChild<T>(
        nodeType: nodeType ?? this.nodeType,
        key: key ?? this.key,
        label: label ?? this.label,
        icon: icon ?? this.icon,
        iconColor: iconColor ?? this.iconColor,
        selectedIconColor: selectedIconColor ?? this.selectedIconColor,
        data: data ?? this.data,
        subview: subview ?? this.subview,
        nameSubview: nameSubview ?? this.nameSubview,
      );
}
