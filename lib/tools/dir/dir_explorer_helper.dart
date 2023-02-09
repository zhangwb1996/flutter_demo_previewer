///
/// File: \lib\tools\dir\dir_explorer_help.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Thursday, 2023-02-09 9:59:43 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Thursday, 2023-02-09 12:29:28 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///
import 'dart:io';

List<String> dirExplorer(String path) {
  try {
    List<String> entriesCurrentPath = [];
    var pathTemp = "";
    var subPath = "";
    for (var entity in Directory(path)
        .listSync(
          recursive: false,
        )
        .whereType<Directory>()
        .where((e) =>
            !e.path.split(RegExp(r'\\|/')).last.startsWith(RegExp(r'\.|\$')))) {
      pathTemp = entity.path.toString();

      subPath = pathTemp.substring(pathTemp.lastIndexOf(path) + path.length);
      entriesCurrentPath.addAll(subPath.split(RegExp(r'\\|/')));
      entriesCurrentPath.remove("");
    }
    return entriesCurrentPath;
  } catch (e) {
    print(e);
    return [];
  }
}
