///
/// File: \lib\src\common.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Monday, 2023-02-20 10:48:01 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Wednesday, 2023-02-22 11:08:01 am
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

bool searching = false;
String searchPath = '../widget_design/lib/src/preview';
bool nodeParentTapped = false;

///
/// RegExp(r"\\|/") ==> '/'
String pathSeparator(String path) {
  return path.replaceAll(RegExp(r"\\|/"), '/');
}
