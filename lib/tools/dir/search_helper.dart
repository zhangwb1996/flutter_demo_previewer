///
/// File: \lib\tools\dir\search_helper.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Sunday, 2023-02-19 5:58:42 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-20 10:52:23 am
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'dart:io';

import 'package:flutter_demo_previewer/src/flag.dart';

void main(List<String> args) async {
  // print('searchHelper');
  try {
    var previewPath = r'../widget_design/lib/src/preview';
    await searchHelper(previewPath);
  } catch (e) {
    // print(e);
  }
}

/// Return all file nodes under the preview node
Future<List<String>> searchHelper(String str) async {
  // sleep(Duration(seconds: 3));
  try {
    searching = true;
    // print('searchHelper');

    List<String> find = [];
    await for (var entity
        in Directory(str).list(recursive: true).where((e) => e is File)) {
      find.add(entity.path);
    }
    return find;
  } catch (e) {
    // print(e);
    return [];
  }
}
