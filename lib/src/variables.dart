///
/// File: \lib\src\variables.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Thursday, 2023-02-09 3:34:29 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Thursday, 2023-02-09 3:38:35 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import '../tools/tree_view/tree_view.dart';

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
