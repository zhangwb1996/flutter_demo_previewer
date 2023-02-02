import 'dart:io';

// import 'package:flutter/material.dart';

class DirEntry {
  String parentPath;
  final String currentPath;

  ///
  /// [absolutelyCurrentPath] = [parentPath] + [currentPath]
  ///
  String absolutelyCurrentPath;

  ///
  /// List<String>? Name of Current Files
  ///
  late List<String>? listStrNameCurrentFiles = [];

  ///
  /// List<String> Name of Current Dirs;
  ///
  late List<String> listStrNameCurrentDirs = [];

  DirEntry({
    required this.currentPath,
    required this.parentPath,
  }) : absolutelyCurrentPath =
            parentPath == '' ? currentPath : "$parentPath$currentPath";

  /// get entries under the [absolutelyCurrentPath], Not recurse
  ///
  Future<List<String>> dir(DirEntry dirEntry) async {
    parentPath = absolutelyCurrentPath;
    print('absolutelyCurrentPath: ' "$absolutelyCurrentPath");
    var path = "";
    var subPath = "";
    List<String> listEntriesCurrentPath = [];

    await for (var entity in Directory(absolutelyCurrentPath)
        .list(recursive: false, followLinks: true)) {
      path = entity.path.toString();

      /// cut the absolutelyCurrentPath from  the absolute path of entry
      subPath = path.substring(path.lastIndexOf(absolutelyCurrentPath) +
          absolutelyCurrentPath.length);

      /// dir or file all to list
      listEntriesCurrentPath.addAll(subPath.split(RegExp(r'\\|/')));

      /// remove empty item
      listEntriesCurrentPath.remove("");
    }

    print('listEntriesCurrentPath: $listEntriesCurrentPath');

    return listEntriesCurrentPath;
  }

  void initCurrentFileOrDir(List<String> pathEntries, DirEntry dirEntry) {
    if (pathEntries.isNotEmpty) {
      for (var str in pathEntries) {
        if (str.contains(RegExp("\\.|(\\.dart)"))) {
          if (str.contains(RegExp(".*(\\.dart)\$"))) {
            dirEntry.listStrNameCurrentFiles!.add(str);
          }
        } else {
          dirEntry.listStrNameCurrentDirs.add(str);
        }
      }
    }
  }

  Future getDirStrList(DirEntry dirEntry) async {
    await dirEntry.dir(dirEntry).then((value) {
      dirEntry.initCurrentFileOrDir(value, dirEntry);
    });
    return dirEntry;
  }
}
