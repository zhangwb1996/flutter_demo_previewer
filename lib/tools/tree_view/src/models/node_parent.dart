///
/// File: \lib\tools\tree_view\src\models\node_parent.dart
/// Project: flutter_demo_previewer
///
/// Created Date: Monday, 2023-02-06 12:17:03 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-06 1:02:04 pm
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

import 'widget.dart';

/// Defines the data used to display a [TreeNode].
///
/// Used by [TreeView] to display a [TreeNode].
///
/// This object allows the creation of key, label and icon to display
/// a node on the [TreeView] widget. The key and label properties are
/// required. The key is needed for events that occur on the generated
/// [TreeNode]. It should always be unique.
class NodeParent<T> extends NodeBaseExpandable {
  NodeParent({
    super.nodeType = "NodeParent",
    required super.key,
    required super.label,
    super.expanded = false,
    super.children,
    super.icon,
    super.iconColor,
    super.selectedIconColor,
    super.data,
    super.subview,
    super.nameSubview,
  });

  /// Creates a [NodeParent] from a string value. It generates a unique key.
  factory NodeParent.fromLabel(String label) {
    String key = Utilities.generateRandom();
    return NodeParent(
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
  factory NodeParent.fromMap(Map<String, dynamic> map) {
    String nodeType = map['nodeType'];
    String? key = map['key'];
    String label = map['label'];
    // bool expanded = map['expanded'];
    List<NodeBase> children = [];
    T data = map['data'];
    Widget? subview = map['subview'];
    String? nameSubview = map['nameSubview'];
    key ??= Utilities.generateRandom();
    if (map['children'] != null) {
      List<Map<String, dynamic>> childrenMap = List.from(map['children']);
      children = childrenMap.map((Map<String, dynamic> child) {
        switch (child['nodeType']) {
          case 'NodeWorkspace':
            return NodeWorkspace.fromMap(child);
          case 'NodeParent':
            return NodeParent.fromMap(child);
          case 'NodeChild':
            return NodeChild.fromMap(child);
          default:
            return NodeError.fromLabel("NodeError......");
        }
      }).toList();
    }
    return NodeParent<T>(
      nodeType: nodeType,
      key: key,
      label: label,
      expanded: Utilities.truthful(map['expanded']),
      children: children,
      data: data,
      subview: subview,
      nameSubview: nameSubview,
    );
  }

  /// Creates a copy of this object but with the given fields
  /// replaced with the new values.
  @override
  NodeParent<T> copyWith({
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
      NodeParent<T>(
        nodeType: nodeType ?? super.nodeType,
        key: key ?? super.key,
        label: label ?? super.label,
        icon: icon ?? super.icon,
        iconColor: iconColor ?? super.iconColor,
        selectedIconColor: selectedIconColor ?? super.selectedIconColor,
        expanded: expanded ?? super.expanded,
        children: children ?? super.children,
        data: data ?? super.data,
        subview: subview ?? super.subview,
        nameSubview: nameSubview ?? super.nameSubview,
      );

  @override
  String toString() {
    return const JsonEncoder().convert(asMap);
  }
}
