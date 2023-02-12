///
/// File: \lib\tools\tree_view\src\models\node_error.dart
/// Project: flutter_demo_previewer
///
/// Created Date: Monday, 2023-02-06 5:14:10 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-06 5:16:17 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

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
class NodeError<T> extends NodeBase {
  const NodeError({
    super.nodeType = "NodeError",
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
  factory NodeError.fromLabel(String label) {
    String key = Utilities.generateRandom();
    return NodeError<T>(
      key: '${key}_$label',
      label: label,
    );
  }

  /// Creates a copy of this object but with the given fields
  /// replaced with the new values.
  @override
  NodeError<T> copyWith({
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
      NodeError<T>(
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
