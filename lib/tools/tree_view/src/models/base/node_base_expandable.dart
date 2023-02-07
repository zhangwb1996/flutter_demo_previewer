///
/// File: \lib\tools\tree_view\src\models\base\node_base_expandable.dart
/// Project: flutter_demo_previewer
///
/// Created Date: Tuesday, 2023-02-07 1:14:35 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Tuesday, 2023-02-07 1:16:24 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

/*
 * File: \noe_expan
 * Project: base
 * 
 * Created Date: Tuesday, 2023-02-07 1:14:35 pm
 * Author: Wenbo Zhang (zhangwb1996@outlook.com) 
 * -----
 * Last Modified: Tuesday, 2023-02-07 1:14:35 pm
 * Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
 * -----
 * Copyright (c) 2023
 * -----
 * HISTORY:
 * Date      	By	Comments
 * ----------	---	---------------------------------------------------------
 */

import 'dart:convert';
import 'package:flutter/widgets.dart';

import '../../tree_node.dart';
import '../widget.dart';

abstract class NodeBaseExpandable<T> extends NodeBase {
  /// The open or closed state of the [TreeNode]. Applicable only if the
  /// node is a parent
  final bool expanded;

  /// The sub [Node]s of this object.
  List<NodeBase>? children;

  bool? temp;

  NodeBaseExpandable({
    required super.nodeType,
    required super.key,
    required super.label,
    this.expanded = false,
    this.children,
    super.icon,
    super.iconColor,
    super.selectedIconColor,
    super.data,
    super.subview,
    super.nameSubview,
  });

  /// Map representation of this object
  @override
  Map<String, dynamic> get asMap {
    Map<String, dynamic> map = {
      "nodeType": nodeType,
      "key": key,
      "label": label,
      "icon": icon == null ? null : icon!.codePoint,
      "iconColor": iconColor == null ? null : iconColor!.toString(),
      "selectedIconColor":
          selectedIconColor == null ? null : selectedIconColor!.toString(),
      "expanded": expanded,
      "children": children?.map((NodeBase child) => child.asMap).toList(),
      // "subview": subview,
      "nameSubview": nameSubview,
    };
    if (data != null) {
      map['data'] = data as T;
    }
    //TODO: figure out a means to check for getter or method on generic to include map from generic
    return map;
  }

  /// Creates a copy of this object but with the given fields
  /// replaced with the new values.
  @override
  NodeBaseExpandable<T> copyWith();

  @override
  String toString() {
    return const JsonEncoder().convert(asMap);
  }

  @override
  List<Object?> get props => super.props..addAll([expanded, children]);
}
