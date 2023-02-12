///
/// File: \lib\tools\tree_view\src\models\node_workspace_editalbe.dart
/// Project: flutter_demo_previewer
///
/// Created Date: Monday, 2023-02-06 12:21:48 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-06 9:43:54 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_demo_previewer/tools/tree_view/widget.dart';

/// Defines the data used to display a [TreeNode].
///
/// Used by [TreeView] to display a [TreeNode].
///
/// This object allows the creation of key, label and icon to display
/// a node on the [TreeView] widget. The key and label properties are
/// required. The key is needed for events that occur on the generated
/// [TreeNode]. It should always be unique.
class NodeWorkspaceEditable<T> extends NodeBaseExpandable {
  NodeWorkspaceEditable({
    super.nodeType = "NodeWorkspaceEditable",
    required super.key,
    required super.label,
    super.icon,
    super.iconColor,
    super.selectedIconColor,
    super.data,
  });

  /// Creates a [NodeParent] from a string value. It generates a unique key.
  factory NodeWorkspaceEditable.fromLabel(String label) {
    String key = Utilities.generateRandom();
    return NodeWorkspaceEditable(
      key: '${key}_$label',
      label: label,
    );
  }

  /// Creates a [NodeParent] from a Map<String, dynamic> map. The map
  /// should contain a "label" value. If the key value is
  /// missing, it generates a unique key.
  /// If the expanded value, if present, can be any 'truthful'
  /// value. Excepted values include: 1, yes, true and their
  /// associated string values.
  factory NodeWorkspaceEditable.fromMap(Map<String, dynamic> map) {
    String nodeType = map['nodeType'];
    String? key = map['key'];
    String label = map['label'];

    T data = map['data'];

    key ??= Utilities.generateRandom();

    return NodeWorkspaceEditable<T>(
      nodeType: nodeType,
      key: key,
      label: label,
      data: data,
    );
  }

  /// Creates a copy of this object but with the given fields
  /// replaced with the new values.
  @override
  NodeWorkspaceEditable<T> copyWith({
    String? nodeType,
    String? key,
    String? label,
    List<NodeBase>? children,
    bool? expanded,
    IconData? icon,
    Color? iconColor,
    Color? selectedIconColor,
    T? data,
    Widget? subview,
    String? nameSubview,
  }) =>
      NodeWorkspaceEditable<T>(
        nodeType: nodeType ?? this.nodeType,
        key: key ?? this.key,
        label: label ?? this.label,
        icon: icon ?? this.icon,
        iconColor: iconColor ?? this.iconColor,
        selectedIconColor: selectedIconColor ?? this.selectedIconColor,
        data: data ?? this.data,
      );
}
