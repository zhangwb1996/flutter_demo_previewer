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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_previewer/src/variables.dart';
import 'package:flutter_demo_previewer/src/widget.dart';
import 'package:provider/provider.dart';
import 'package:widget_design/widget.dart';

import 'flutter_demo_previewer_pre.dart';

void main() async {
  if (kDebugMode) {
    designPath = r'../widget_design/lib/src/views';
    previewPath = r'../widget_design/lib/src/preview';
  } else {
    designPath = r'../widget_design/lib/src/views';
    previewPath = r'../widget_design/lib/src/preview';
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // TODO: restructure with provider
        ChangeNotifierProvider(create: (context) => Workspace()),
        ChangeNotifierProvider(
          create: (BuildContext context) => AnimatedAlignModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AnimatedContainerModel(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AnimatedCrossFadeModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AnimatedOpacityModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => AlignModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => AspectRatioModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => BaselineModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => CenterModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => BoxFitModel(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => FractionallySizedBoxModel(),
          lazy: true,
        ),
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
