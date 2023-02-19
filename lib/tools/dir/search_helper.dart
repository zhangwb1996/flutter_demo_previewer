///
/// File: \lib\tools\dir\search_helper.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Sunday, 2023-02-19 5:58:42 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Sunday, 2023-02-19 6:44:31 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'dart:io';

void main(List<String> args) async {
  print('searchHelper');
  try {
    var previewPath = r'../widget_design/lib/src/preview';
    await searchHelper(previewPath);
  } catch (e) {
    print(e);
  }
}

/// Return all file nodes under the preview node
Future<List<String>> searchHelper(String str) async {
  try {
    print('searchHelper');

    List<String> find = [];
    await for (var entity
        in Directory(str).list(recursive: true).where((e) => e is File)) {
      find.add(entity.path);
    }
    return find;
  } catch (e) {
    print(e);
    return [];
  }
}
