///
/// File: \lib\src\variables.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Thursday, 2023-02-09 3:34:29 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Wednesday, 2023-02-22 11:05:10 am
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import '../tools/tree_view/widget.dart';

final List<NodeBase<dynamic>> dirChildren = [];
final List<NodeBase<dynamic>> workspace = [];
final List<NodeBase> nodesFromPath = [];
final List<NodeBase> nodesFromPathPreview = [];

String designPath = '';
String previewPath = '';
