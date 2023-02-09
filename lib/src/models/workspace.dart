///
/// File: \lib\src\models\workspace.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Thursday, 2023-02-09 3:46:38 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Thursday, 2023-02-09 3:49:21 pm
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
  ///
  /// used when node expanded
  ///
  /// all data of children
  ///
  /// key: current path of this node
  ///
  /// List: children of this node
  final Map<String, List<NodeBase<dynamic>>> dirChildren = {};

  final List<NodeBase<dynamic>> workspace = [];

  final List<NodeBase> nodesFromPath = [];
}
