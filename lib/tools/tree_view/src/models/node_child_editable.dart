///
/// File: \lib\tools\tree_view\src\models\node_child_editable.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Friday, 2023-02-10 10:56:25 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Friday, 2023-02-10 11:01:39 am
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'package:flutter/widgets.dart';

import '../utilities.dart';
import 'widget.dart';

/// Create one node [NodeChildEditalbe] when need to add a new [NodeChild]
///
/// Used by [TreeView] to display a [NodeChildEditalbe].
///
/// This object allows the creation of key, label and icon to display
/// a node on the [TreeView] widget. The key and label properties are
/// required. The key is needed for events that occur on the generated
/// [NodeChildEditalbe]. It should always be unique.
class NodeChildEditalbe<T> extends NodeBase {
  const NodeChildEditalbe({
    super.nodeType = "NodeChildEditalbe",
    required super.key,
    required super.label,
    super.icon,
    super.iconColor,
    super.selectedIconColor,
    super.data,
  });

  /// Creates a [NodeChildEditalbe] from a string value. It generates a unique key.
  factory NodeChildEditalbe.fromLabel(String label) {
    String key = Utilities.generateRandom();
    return NodeChildEditalbe<T>(
      key: '${key}_$label',
      label: label,
    );
  }

  /// Creates a [NodeChildEditalbe] from a Map<String, dynamic> map. The map
  /// should contain a "label" value. If the key value is
  /// missing, it generates a unique key.
  /// If the expanded value, if present, can be any 'truthful'
  /// value. Excepted values include: 1, yes, true and their
  /// associated string values.
  factory NodeChildEditalbe.fromMap(Map<String, dynamic> map) {
    // NodeChild fromMap(Map<String, dynamic> map) {
    String nodeType = map['nodeType'];
    String? key = map['key'];
    String label = map['label'];
    var data = map['data'];
    key ??= Utilities.generateRandom();
    return NodeChildEditalbe<T>(
      nodeType: nodeType,
      key: key,
      label: label,
      data: data,
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
  }) =>
      NodeChild<T>(
        nodeType: nodeType ?? this.nodeType,
        key: key ?? this.key,
        label: label ?? this.label,
        icon: icon ?? this.icon,
        iconColor: iconColor ?? this.iconColor,
        selectedIconColor: selectedIconColor ?? this.selectedIconColor,
        data: data ?? this.data,
      );
}
