///
/// File: \lib\tools\explorer_view\explorer_view.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Wednesday, 2023-02-08 6:38:28 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Sunday, 2023-02-12 11:56:16 am
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo_previewer/tools/tree_view/widget.dart';

import '../../src/variables.dart';
import '../dir/widget.dart';
import '../json_dynamic_widget/widget.dart';

class ExplorerView extends StatefulWidget {
  /// key of worksapce node
  final String? workspaceName;
  final TreeViewController? controller;
  const ExplorerView({super.key, this.workspaceName, this.controller});

  @override
  State<ExplorerView> createState() => _ExplorerViewState();
}

class _ExplorerViewState extends State<ExplorerView> {
  late String currentPath;
  List<PathItem> pathItem = [];
  Map<String, bool> itemTileSelected = {};
  @override
  void initState() {
    initCurrentPath();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initCurrentPath({String? path}) {
    // path
    pathItem = [];
    path == null
        ? currentPath =
            Platform.environment['HOME'] ?? Platform.environment['USERPROFILE']!
        : currentPath = path;
    var listPath = currentPath.split(RegExp(r'\\|/'));
    for (int i = 0; i < listPath.length; i++) {
      pathItem.add(
        PathItem(
          dirName: listPath[i],
          path: listPath.sublist(0, i + 1).join('/'),
        ),
      );
    }

    // folders in this path
    itemTileSelected = {};
    var strPath = '';
    for (var item in dirExplorer(currentPath)) {
      strPath = item.split(RegExp(r'\\|/')).last;
      itemTileSelected.addEntries({strPath: false}.entries);
    }
  }

  void setItemSelected(String key, bool? isSelected) {
    itemTileSelected.updateAll((key, value) => value = false);
    itemTileSelected[key] = isSelected ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: pathItem.map((item) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          initCurrentPath(path: item.path);
                        });
                      },
                      child: Text(item.dirName),
                    ),
                    const Text('/'),
                  ],
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0, 0),
                    blurRadius: 2,
                    blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
              alignment: Alignment.topLeft,
              child: GridView.count(
                crossAxisCount: 6,
                children: itemTileSelected.keys.map((e) {
                  return GestureDetector(
                    // hoverColor: Colors.red,
                    onTap: () => setState(() {
                      setItemSelected(e, !itemTileSelected[e]!);
                    }),
                    onDoubleTap: () => setState(() {
                      initCurrentPath(path: '$currentPath/$e');
                    }),
                    child: ListTile(
                      selected: itemTileSelected[e] ?? false,
                      dense: true,
                      leading: const Icon(
                        Icons.folder,
                        size: 50,
                      ),
                      title: Text(e),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            // color: Colors.white,
            child: ElevatedButton(
                onPressed: () {
                  itemTileSelected.forEach((key, value) {
                    if (value) {
                      debugPrint(
                        'ExplorerView "add to worksapce": $currentPath/$key',
                      );

                      NodeParent node = NodeParent(
                          key: "$currentPath/$key", label: "$currentPath/$key");
                      List<NodeBase>? added = widget.controller!.addNode(
                        'Workspace:${widget.workspaceName!}',
                        node,
                      );
                      workspace.clear();
                      workspace.addAll(added);
                      debugPrint(workspace.toString());
                    }
                  });
                },
                child: const Text(" add to workspace")),
          ),
        ],
      ),
    );
  }
}

class PathItem {
  final String dirName;
  final String path;
  PathItem({
    required this.dirName,
    required this.path,
  });
}
