///
/// File: \lib\tools\dir\dynamic_widget_helper.dart
/// Project: flutter_demo_previewer
///
/// Created Date: Saturday, 2023-02-04 11:43:29 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Saturday, 2023-02-04 2:48:54 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'dart:io';

import 'package:flutter/foundation.dart';

void main(List<String> args) {
  if (args.isEmpty) {
    dynamicWidgetHelper(
        r'C:\Users\12700\Documents\FlutterProjects\Src\flutter_demo_previewer\lib');
  } else {
    switch (args.join(" ")) {
      case 'clean':
        clean();
        break;
      default:
    }
  }
}

// String str =
//     r'C:\Users\12700\Documents\FlutterProjects\Src\flutter_demo_previewer\lib/src';

String strTempBuilder =
    'lib/tools/json_dynamic_widget/temp/temp_builder.dart.bak';
String strTempRegisterBody =
    'lib/tools/json_dynamic_widget/temp/temp_register_body.dart.bak';
String strTempRegisterFunction =
    'lib/tools/json_dynamic_widget/temp/temp_register_function.dart.bak';

String strDirGenerateBuilder =
    'lib/tools/json_dynamic_widget/generated/builder';
String fileStructurePathCopy = "";
String strDirGenerateBuilderExport = 'lib/tools/json_dynamic_widget/generated';
String strDirGenerateRegister = 'lib/tools/json_dynamic_widget/src/';
String strDirGenerateRegisterFlag = 'lib/tools/json_dynamic_widget/generated';

///
/// [dynamic_widget_helper] :generate all in once
///
/// get [dartFiles] from [path]
/// get [className] the first class from each [dartFiles]
///
/// generate [builder] and [register] with
///          [builder] : [temp_builder.dart.bak]
///          [register] : [temp_register_body.dart.dart.bak],[temp_register_function.dart.bak]
///
/// import "...."
///
/// replace
///
/// ...builder.dart
///
/// register.dart
void dynamicWidgetHelper(String path) {
  try {
    /// only pre branch
    var p1 = Directory.current.path.split(RegExp(r'\\|/'));
    var p2 = path.split(RegExp(r'\\|/'));
    p1.removeLast();
    p2.removeAt(0);
    path = [...p1, ...p2].join("/");

    /// [dartFiles]
    Iterable<File> dartFiles = Directory(path)
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'));
    if (kDebugMode) {
      print("dartFiles: $dartFiles");
    }

    /// [className]
    String className;

    /// [iterableClassName]
    Iterable<String> iterableClassName;

    for (var file in dartFiles) {
      iterableClassName = File(file.path).readAsLinesSync().where((e) {
        return e.startsWith(RegExp('class')) && e.contains("extends");
      });

      if (iterableClassName.isEmpty) {
        continue;
      }

      // fileStructurePathCopy
      fileStructurePathCopy = file.path.replaceAll(path, '');
      if (kDebugMode) {
        print("fileStructurePathCopy: $fileStructurePathCopy");
      }
      // class name
      className =
          resetClassName(iterableClassName.toString().split(RegExp(r"\s"))[1]);
      if (kDebugMode) {
        print("className: $className");
      }

      ///
      /// generate [builder] under [strDirGenerateBuilder]
      ///
      //  create file
      if (kDebugMode) {
        print("current dir: ${Directory.current.path}");
      }
      if (File(
              "${Directory.current.path}/$strDirGenerateBuilder/$fileStructurePathCopy/${className.toLowerCase()}_builder.dart")
          .existsSync()) {
        continue;
      }
      if (kDebugMode) {
        print(
            "path createing file: ${Directory.current.path}/$strDirGenerateBuilder/$fileStructurePathCopy/${className.toLowerCase()}_builder.dart");
      }
      File("${Directory.current.path}/$strDirGenerateBuilder/$fileStructurePathCopy/${className.toLowerCase()}_builder.dart")
          .createSync(recursive: true);

      // copy from [temp builder]
      // import
      // replace [Json2widgetTemp] with [className]
      File("${Directory.current.path}/$strDirGenerateBuilder/$fileStructurePathCopy/${className.toLowerCase()}_builder.dart")
          .writeAsStringSync(
              "import 'file:${file.path.replaceAll(r'\', r'/')}';\n${File("${Directory.current.path}/$strTempBuilder").copySync("${Directory.current.path}/$strDirGenerateBuilder/$fileStructurePathCopy/${className.toLowerCase()}_builder.dart").readAsStringSync().replaceAll("'Json2widgetTemp'", className)}");
      // replace [NameOfOriginFile] with [fileName]
      File("${Directory.current.path}/$strDirGenerateBuilder/$fileStructurePathCopy/${className.toLowerCase()}_builder.dart")
          .writeAsStringSync(File(
                  "${Directory.current.path}/$strDirGenerateBuilder/$fileStructurePathCopy/${className.toLowerCase()}_builder.dart")
              .readAsStringSync()
              .replaceAll(
                  'NameOfOriginFile', file.path.split(RegExp(r'\\|/')).last));

      if (kDebugMode) {
        print("generated builder: ${file.path.split(RegExp(r'\\|/')).last} ");
      }

      // generate bulder.dart
      // File("${Directory.current.path}/$strDirGenerateBuilder/$fileStructurePathCopy/builder.dart")
      //     .writeAsStringSync(
      //   "export './${className.toLowerCase()}_builder.dart';\n",
      //   mode: FileMode.append,
      // );
      File("${Directory.current.path}/$strDirGenerateBuilderExport/builder.dart")
          .writeAsStringSync(
        "export './builder${fileStructurePathCopy.replaceAll("\\", "/")}/${className.toLowerCase()}_builder.dart';\n",
        mode: FileMode.append,
      );

      ///
      /// Content of the generated register.dart
      ///
      if (!File(
              "${Directory.current.path}/$strDirGenerateRegisterFlag/register.dart")
          .existsSync()) {
        File("${Directory.current.path}/$strDirGenerateRegisterFlag/register.dart")
            .createSync();
        File("${Directory.current.path}/$strTempRegisterFunction").copySync(
            "${Directory.current.path}/$strDirGenerateRegister/register.dart");
      }
      List<String> listStrContentRegister = [];

      listStrContentRegister = File(
              "${Directory.current.path}/$strDirGenerateRegister/register.dart")
          .readAsLinesSync();

      // body
      listStrContentRegister.insert(
          listStrContentRegister.indexOf(r"  /// BODY"),
          File("${Directory.current.path}/$strTempRegisterBody")
              .readAsStringSync()
              .toString()
              .replaceAll("'RegisterTemp'", className));
      File("${Directory.current.path}/$strDirGenerateRegister/register.dart")
          .writeAsStringSync(listStrContentRegister.join("\n"));
    }
  } catch (e) {
    print(e);
  }
}

void clean() {
  try {
    if (Directory("${Directory.current.path}/$strDirGenerateBuilder")
        .existsSync()) {
      Directory("${Directory.current.path}/$strDirGenerateBuilder")
          .deleteSync(recursive: true);
    }
    if (File(
            "${Directory.current.path}/$strDirGenerateRegisterFlag/register.dart")
        .existsSync()) {
      File("${Directory.current.path}/$strDirGenerateRegisterFlag/register.dart")
          .deleteSync();
    }
    if (File(
            "${Directory.current.path}/$strDirGenerateRegisterFlag/builder.dart")
        .existsSync()) {
      File("${Directory.current.path}/$strDirGenerateRegisterFlag/builder.dart")
          .writeAsStringSync('');
    }
    File("${Directory.current.path}/$strTempRegisterFunction").copySync(
        "${Directory.current.path}/$strDirGenerateRegister/register.dart");
  } catch (e) {
    print(e);
  }
}

String resetClassName(String className) {
  return className.replaceAll(RegExp(r'\W'), "T");
}
