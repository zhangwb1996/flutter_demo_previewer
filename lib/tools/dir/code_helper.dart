///
/// File: \lib\tools\dir\code_helper.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Sunday, 2023-02-19 11:12:54 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-20 1:31:54 am
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
  try {
    if (!key.endsWith(".dart")) {
      return '';
    }
    List<String> code = File(key).readAsLinesSync();
    code.removeWhere((e) => e.startsWith('///'));

    return code.join('\n');
  } catch (e) {
    // print(e);
    return '';
  }
}
