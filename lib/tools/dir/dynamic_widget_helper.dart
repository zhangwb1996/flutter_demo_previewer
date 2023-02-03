import 'dart:io';

void main(List<String> args) {
  dynamicWidgetHelper(str);
}

String str = r'C:\Users\12700\Documents\FlutterProjects\Src\tree\lib/src';

String strTempBuilder =
    'lib/tools/json_dynamic_widget/temp/temp_builder.dart.bak';
String strTempRegisterBody =
    'lib/tools/json_dynamic_widget/temp/temp_register_body.dart.bak';
String strTempRegisterFunction =
    'lib/tools/json_dynamic_widget/temp/temp_register_function.dart.bak';

String strDirGenerateBuilder =
    'lib/tools/json_dynamic_widget/generated/builder';
String strDirGenerateBuilderExport = 'lib/tools/json_dynamic_widget/generated';
String strDirGenerateRegister = 'lib/tools/json_dynamic_widget/src';
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
/// builder.dart
///
void dynamicWidgetHelper(String path) {
  /// [dartFiles]
  Iterable<File> dartFiles = Directory(path)
      .listSync()
      .whereType<File>()
      .where((file) => file.path.endsWith('.dart'));
  print("dartFiles: ${dartFiles}");

  /// [className]
  var className;

  /// [iterableClassName]
  Iterable<String> iterableClassName;

  for (var file in dartFiles) {
    iterableClassName = File(file.path).readAsLinesSync().where(
          (e) => e.startsWith(RegExp('class')),
        );

    if (iterableClassName.isEmpty) {
      continue;
    }
    className = iterableClassName.toString().split(RegExp(r"\s"))[1];
    print("className: $className");

    ///
    /// generate [builder] under [strPathGenerateDir]
    ///
    //  create file
    print("current dir: ${Directory.current.path}");
    File("${Directory.current.path}/$strDirGenerateBuilder/${className.toLowerCase()}_builder.dart")
        .createSync(recursive: true);

    // copy from [temp builder]
    // import
    // replace [Json2widgetTemp] with [className]
    File("${Directory.current.path}/$strDirGenerateBuilder/${className.toLowerCase()}_builder.dart")
        .writeAsStringSync(
            "import 'file:${file.path.replaceAll(r'\', r'/')}';\n${File("${Directory.current.path}/$strTempBuilder").copySync("${Directory.current.path}/$strDirGenerateBuilder/${className.toLowerCase()}_builder.dart").readAsStringSync().replaceAll("'Json2widgetTemp'", className)}");
    // replace [NameOfOriginFile] with [fileName]
    File("${Directory.current.path}/$strDirGenerateBuilder/${className.toLowerCase()}_builder.dart")
        .writeAsStringSync(File(
                "${Directory.current.path}/$strDirGenerateBuilder/${className.toLowerCase()}_builder.dart")
            .readAsStringSync()
            .replaceAll(
                'NameOfOriginFile', file.path.split(RegExp(r'\\|/')).last));

    print("generated builder: ${file.path.split(RegExp(r'\\|/')).last} ");

    // generate bulder.dart
    // File("${Directory.current.path}/$strDirGenerateBuilder/builder.dart")
    //     .writeAsStringSync(
    //   "export './${className.toLowerCase()}_builder.dart';\n",
    //   mode: FileMode.append,
    // );
    File("${Directory.current.path}/$strDirGenerateBuilderExport/builder.dart")
        .writeAsStringSync(
      "export './builder/${className.toLowerCase()}_builder.dart';\n",
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

    listStrContentRegister =
        File("${Directory.current.path}/$strDirGenerateRegister/register.dart")
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
}

void clean() {
  Directory("${Directory.current}/$strDirGenerateBuilder")
      .delete(recursive: true);
  File("${Directory.current}/$strDirGenerateBuilder/builder.dart")
      .writeAsStringSync('');
  File("${Directory.current.path}/$strTempRegisterFunction").copySync(
      "${Directory.current.path}/$strDirGenerateRegister/register.dart");
}
