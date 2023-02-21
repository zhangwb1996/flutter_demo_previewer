///
/// File: \lib\src\models\workspace.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Thursday, 2023-02-09 3:46:38 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Saturday, 2023-02-11 11:49:56 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///
import 'package:flutter/material.dart';

import '../../tools/tree_view/widget.dart';

class Workspace extends ChangeNotifier {
  final List<NodeBase<dynamic>> dirChildren = [];

  final List<NodeBase<dynamic>> workspace = [
    const NodeWorkspaceAdd(
      key: "adding workspace",
      label: "Add Workspace",
    ),
  ];

  final List<NodeBase> nodesFromPath = [];

  void add(NodeBase item) {
    workspace.add(item);
    notifyListeners();
  }
}
