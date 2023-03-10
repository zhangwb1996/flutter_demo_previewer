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

import 'flutter_demo_previewer_alpha.dart';

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
        // [ ]TODO: restructure with provider
        ChangeNotifierProvider(create: (context) => Workspace()),
        ChangeNotifierProvider(
          create: (context) => SearchHelperModel(),
          lazy: true,
        ),
        // // Note: ChangeNotifierProxyProvider
        // ChangeNotifierProxyProvider<DividerModel, SearchHelperModel>(
        //   create: (context) => SearchHelperModel(),
        //   update: (context, divider, helper) {
        //     if (helper == null) throw ArgumentError.notNull('helper');
        //     helper.divider = divider;
        //     return helper;
        //   },
        //   lazy: true,
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo Previewer',
        // home: const FlutterDemoPreviewer(title: 'Flutter Demo Previewer'),
        home: const FlutterDemoPreviewerAlpha(title: 'Flutter Demo Previewer'),
        theme: ThemeData().copyWith(
            // accentColor: Colors.deepPurple,
            // hoverColor: Colors.red.shade100,
            // colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.red),
            ),
      ),
    );
  }
}
