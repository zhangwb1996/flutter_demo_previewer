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
import 'package:flutter_demo_previewer/src/widget.dart';
import 'package:provider/provider.dart';

import 'package:widget_design/src/models/widgets/animation_and_motion/widget.dart';
import 'flutter_demo_previewer.dart';
import 'flutter_demo_previewer_pre.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: restructure with provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Workspace()),
        ChangeNotifierProvider(
          create: (BuildContext context) => AnimatedAlignModel(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo Previewer',
        // home: const FlutterDemoPreviewer(title: 'Flutter Demo Previewer'),
        home: const FlutterDemoPreviewerPre(title: 'Flutter Demo Previewer'),
        theme: ThemeData().copyWith(
            // accentColor: Colors.deepPurple,
            // hoverColor: Colors.red.shade100,
            // colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.red),
            ),
      ),
    );
  }
}
