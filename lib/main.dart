///
/// File: \lib\main.dart
/// Project: flutter_demo_previewer
///
/// Created Date: Wednesday, 2023-02-01 11:05:52 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Sunday, 2023-02-05 9:11:48 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'flutter_demo_preview.dart';

void main() async {
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TreeView Example',
      home: const FlutterDemoPreview(title: 'TreeView Example'),
      theme: ThemeData().copyWith(
          // accentColor: Colors.deepPurple,
          // hoverColor: Colors.red.shade100,
          // colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.red),
          ),
    );
  }
}
