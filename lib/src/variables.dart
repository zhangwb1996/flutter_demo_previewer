///
/// File: \lib\src\variables.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Thursday, 2023-02-09 3:34:29 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Sunday, 2023-02-19 10:00:13 am
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import '../tools/tree_view/widget.dart';

///
/// used when node expanded
///
/// all data of children
///
/// key: current path of this node
///
/// List: children of this node
// final Map<String, List<NodeBase<dynamic>>> dirChildren = {};
final List<NodeBase<dynamic>> dirChildren = [];

final List<NodeBase<dynamic>> workspace = [];

final List<NodeBase> nodesFromPath = [];

final List<NodeBase> nodesFromPathPreview = [];

String designPath = '';
String previewPath = '';
