import 'dart:io';

// import 'package:flutter/material.dart';

class DirLevel {
  String parentDir;
  final String currentDir;

  String absolutelyCurrentPath;

  late List<String>? currentFiles = [];
  late List<String> currentStrDirs = [];

  // late List<Widget> children = [];

  DirLevel({
    required this.currentDir,
    required this.parentDir,
  })
  // : parentDir = currentDir;
  : absolutelyCurrentPath =
            parentDir == '' ? currentDir : "$parentDir$currentDir";

  Future<List<String>> dir(DirLevel dirLevel) async {
    parentDir = absolutelyCurrentPath;
    print('absolutelyCurrentPath: ' "$absolutelyCurrentPath");
    var path = "";
    var subPath = "";
    List<String> listPathChdrn = [];
    List<String> uniqueListPathChdrn = [];

    await for (var entity in Directory(absolutelyCurrentPath)
        // in Directory(dirLevel.childrensParentDir)
        .list(recursive: false, followLinks: true)) {
      path = entity.path.toString();

      subPath = path.substring(path.lastIndexOf(absolutelyCurrentPath) +
          absolutelyCurrentPath.length);
      listPathChdrn.addAll(subPath.split(RegExp(r'\\|/')));

      // print("dir_level.dir(): $path");
      // print(subPath);
      // print(listPathChdrn);
      // print(entity);

      /// remove the duplication
      for (var e in listPathChdrn) {
        if (uniqueListPathChdrn.contains(e) || e.isEmpty) {
          continue;
        }
        uniqueListPathChdrn.add(e);
      }
    }

    // print(listPathChdrn);
    // print(uniqueListPathChdrn);
    // return uniqueListPathChdrn;
    return listPathChdrn;
  }

  void initCurrentFileOrDir(List<String> pathChildren, DirLevel dirLevel) {
    // print(pathChildren);
    if (pathChildren.isNotEmpty) {
      for (var str in pathChildren) {
        if (str.contains(RegExp("\\.|(\\.dart)"))) {
          if (str.contains(RegExp(".*(\\.dart)\$"))) {
            if (!dirLevel.currentFiles!.contains(str)) {
              dirLevel.currentFiles!.add(str);
            }
            // dirLevel.currentFiles?.add(str);
          }
        } else {
          // if (!dirLevel.currentDirs.contains(Item01(text: str))) {
          if (!dirLevel.currentStrDirs.contains(str)) {
            if (str.isNotEmpty) {
              dirLevel.currentStrDirs.add(str);
            }
          }
          // dirLevel.currentDirs?.add(Item01(text: str));
        }
      }
    }
  }

  Future getDirStrList(DirLevel dirLevel) async {
    await dirLevel.dir(dirLevel).then((value) {
      // print(value);
      dirLevel.initCurrentFileOrDir(value, dirLevel);
    });
    return dirLevel;
  }
}
