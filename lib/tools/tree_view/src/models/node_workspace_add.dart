///
/// File: \lib\tools\tree_view\src\models\node_workspace_add.dart
/// Project: flutter_demo_previewer
///
/// Created Date: Tuesday, 2023-02-07 8:38:25 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Tuesday, 2023-02-07 8:52:00 pm
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

/// [NodeWorkspaceAdd] extending [NodeBase] used to add one [NodeWorkspace].
///
/// Used by [TreeView] to display a [TreeNode].
///
/// This object allows the creation of key, label to display a node on the [TreeView] widget.
/// The [key] and [label] properties are required.
/// The [key] is needed for events that occur on the generated
/// [TreeNode]. It should always be unique.
class NodeWorkspaceAdd<T> extends NodeBase {
  const NodeWorkspaceAdd({
    super.nodeType = "NodeWorkspaceAdd",
    required super.key,
    required super.label,
    super.subview,
    super.nameSubview,
  });

  /// Creates a [NodeChild] from a string value. It generates a unique key.
  factory NodeWorkspaceAdd.fromLabel(String label) {
    String key = Utilities.generateRandom();
    return NodeWorkspaceAdd<T>(
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
  factory NodeWorkspaceAdd.fromMap(Map<String, dynamic> map) {
    // NodeChild fromMap(Map<String, dynamic> map) {
    String nodeType = map['nodeType'];
    String? key = map['key'];
    String label = map['label'];
    Widget? subview = map['subview'];
    String? nameSubview = map['nameSubview'];
    key ??= Utilities.generateRandom();
    return NodeWorkspaceAdd<T>(
      nodeType: nodeType,
      key: key,
      label: label,
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
