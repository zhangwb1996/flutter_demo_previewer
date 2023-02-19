///
/// File: \lib\tools\dir\code_helper.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Sunday, 2023-02-19 11:12:54 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Sunday, 2023-02-19 2:38:57 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'dart:io';

/// [codeHelper]
///
/// pass [key] as file path
/// return the code in this file path
String codeHelper(String key) {
  if (!key.endsWith(".dart")) {
    return '';
  }
  List<String> code = File(key).readAsLinesSync();
  code.removeWhere((e) => e.startsWith('///'));

  return code.join('\n');
}
