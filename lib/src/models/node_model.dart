///
/// File: \lib\src\models\node_model.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Monday, 2023-02-20 11:51:33 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Tuesday, 2023-02-21 12:20:13 am
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///
import 'package:flutter/material.dart';
import 'package:flutter_demo_previewer/tools/tree_view/widget.dart';

class NodeModel extends ChangeNotifier {
  /// [globalSelectedNode]
  String? get globalSelectedNode => _globalSelectedNode;
  set globalSelectedNode(String? value) => {
        _globalSelectedNode = value,
        notifyListeners(),
      };
  String? _globalSelectedNode;

  /// [treeViewController]
  TreeViewController get treeViewController => _treeViewController;
  set treeViewController(TreeViewController value) => {
        _treeViewController = value,
        notifyListeners(),
      };
  TreeViewController _treeViewController = TreeViewController(
    children: [],
    selectedKey: null,
  );
}
