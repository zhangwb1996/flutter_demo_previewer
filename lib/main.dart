///
/// File: c:\Users\12700\Documents\FlutterProjects\Src\tree\lib\main.dart
///
/// Created Date: Wednesday, 2023-02-01 11:05:52 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Saturday, 2023-02-04 2:38:13 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'tools/dir/dynamic_widget_helper.dart';
import 'tools/json_dynamic_widget/json_dynamic_widget.dart';
import 'tools/tree_view/flutter_treeview.dart';
import 'tools/dir/dir_entry.dart';

// String str1 =
//     r'C:\Users\12700\Documents\FlutterProjects\Src\demo_flutter_doc\lib/';

String str = r'C:\Users\12700\Documents\FlutterProjects\Src\tree\lib/';
String demo = r'C:\Users\12700\Documents\FlutterProjects\Src\tree\lib/src';
final JsonWidgetRegistry registry = JsonWidgetRegistry.instance;
void main() async {
  dynamicWidgetHelper(demo);
  register(registry);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TreeView Example',
      home: const TreeViewPreview(title: 'TreeView Example'),
      theme: ThemeData().copyWith(
        // accentColor: Colors.deepPurple,
        hoverColor: Colors.red.shade100,
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.red),
      ),
    );
  }
}

class TreeViewPreview extends StatefulWidget {
  const TreeViewPreview({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TreeViewPreview> createState() => TreeViewPreviewState();
}

class TreeViewPreviewState extends State<TreeViewPreview> {
  String? _selectedNode;

  late List<Node> _nodesFromPath = [];

  late TreeViewController _treeViewController = TreeViewController(
    children: [],
    selectedKey: null,
  );

  /// initial data of node
  final DirEntry _dirEntry = DirEntry(
    parentPath: '',
    currentPath: str,
  );

  /// data of node's children
  DirEntry _dirEntryChildren = DirEntry(
    parentPath: '',
    currentPath: '',
  );

  ///
  /// used when node expanded
  ///
  /// all data of children
  ///
  /// key: current path of this node
  ///
  /// List: children of this node
  final Map<String, List<Node<dynamic>>> _dirChildren = {};

  /// TODO workspace
  final Map<String, List<Node<dynamic>>> _workspace = {};

  bool docsOpen = false;
  bool deepExpanded = true;
  final Map<ExpanderPosition, Widget> expansionPositionOptions = const {
    ExpanderPosition.start: Text('Start'),
    ExpanderPosition.end: Text('End'),
  };
  final Map<ExpanderType, Widget> expansionTypeOptions = {
    ExpanderType.none: Container(),
    ExpanderType.caret: const Icon(
      Icons.arrow_drop_down,
      size: 28,
    ),
    ExpanderType.arrow: const Icon(Icons.arrow_downward),
    ExpanderType.chevron: const Icon(Icons.expand_more),
    ExpanderType.plusMinus: const Icon(Icons.add),
  };
  final Map<ExpanderModifier, Widget> expansionModifierOptions = const {
    ExpanderModifier.none: ModContainer(ExpanderModifier.none),
    ExpanderModifier.circleFilled: ModContainer(ExpanderModifier.circleFilled),
    ExpanderModifier.circleOutlined:
        ModContainer(ExpanderModifier.circleOutlined),
    ExpanderModifier.squareFilled: ModContainer(ExpanderModifier.squareFilled),
    ExpanderModifier.squareOutlined:
        ModContainer(ExpanderModifier.squareOutlined),
  };

  final ExpanderPosition _expanderPosition = ExpanderPosition.start;
  final ExpanderType _expanderType = ExpanderType.caret;
  final ExpanderModifier _expanderModifier = ExpanderModifier.none;
  final bool _allowParentSelect = false;
  final bool _supportParentDoubleTap = false;

  @override
  void initState() {
    /// data from path
    _dirEntry.getDirStrList(_dirEntry).then((value) {
      _nodesFromPath = [
        Node(
            label: str,
            key: str,
            expanded: !docsOpen,
            icon: !docsOpen ? Icons.folder_open : Icons.folder,
            children: [
              /// dirs
              ..._dirEntry.listStrNameCurrentDirs.map((dir) {
                debugPrint(
                    "init nodeKey: ${_dirEntry.absolutelyCurrentPath}$dir");
                return Node(
                  label: dir,
                  key: "${_dirEntry.absolutelyCurrentPath}$dir",
                  expanded: docsOpen,
                  icon: docsOpen ? Icons.folder_open : Icons.folder,
                  children: [],
                  parent: true,
                );
              }).toList(),

              /// files
              ..._dirEntry.listStrNameCurrentFiles!.map(
                (file) {
                  return Node(
                    label: file,
                    key: "${_dirEntry.absolutelyCurrentPath}/$file",
                    iconColor: Colors.green.shade300,
                    selectedIconColor: Colors.white,
                    icon: Icons.insert_drive_file,
                    // nameSubview: file,
                    subview: Json2Widget(
                      key: Key("${_dirEntry.absolutelyCurrentPath}/$file"),
                      jsonData: {
                        "type": file,
                      },
                    ),
                  );
                },
              ).toList()
            ])
      ];

      /// TODO open different path in one tree
      _workspace.addEntries({_nodesFromPath[0].label: _nodesFromPath}.entries);

      /// init TreeViewController
      _treeViewController = TreeViewController(
        children: _nodesFromPath,
        selectedKey: _selectedNode,
      );
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Theme
    debugPrint(
        "expanderType:${_expanderType.name}; expanderModifier:${_expanderModifier.name}; expanderPosition:${_expanderPosition.name}; ");
    var treeViewTheme = TreeViewTheme(
      labelOverflow: TextOverflow.clip,
      parentLabelOverflow: TextOverflow.fade,
      expanderTheme: ExpanderThemeData(
        type: _expanderType,
        modifier: _expanderModifier,
        position: _expanderPosition,
        size: 20,
        color: Colors.blue,
      ),
      labelStyle: const TextStyle(
        fontSize: 16,
        letterSpacing: 0.3,
      ),
      parentLabelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w800,
        color: Colors.blue.shade700,
      ),
      iconTheme: IconThemeData(
        size: 18,
        color: Colors.grey.shade800,
      ),
      colorScheme: Theme.of(context).colorScheme,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    Container(
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: TreeView(
                          controller: _treeViewController,
                          allowParentSelect: _allowParentSelect,
                          supportParentDoubleTap: _supportParentDoubleTap,
                          onExpansionChanged: (key, expanded) {
                            debugPrint('Selected key: $key');

                            /// add Children to current Node
                            _addChildrenNode(key);

                            /// update expand
                            _expandNode(
                              key,
                              expanded,
                            );
                          },
                          onNodeTap: (key) {
                            debugPrint('Selected: $key');
                            debugPrint(
                                'nameSubview: ${_treeViewController.getNode(key)!.nameSubview}');

                            setState(() {
                              _selectedNode = key;
                              _treeViewController = _treeViewController
                                  .copyWith(selectedKey: key);
                            });
                          },
                          theme: treeViewTheme,
                        )),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          debugPrint('Close Keyboard');
                          FocusScope.of(context).unfocus();
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: Builder(builder: (context) {
                            debugPrint(
                                'node.subview: ${_treeViewController.getNode(_selectedNode)?.subview?.key}');
                            return _treeViewController.getNode(_selectedNode) ==
                                    null
                                ? const Text("data")
                                : _treeViewController
                                        .getNode(_selectedNode)!
                                        .subview ??
                                    const Text("data");
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _expandNode(String key, bool expanded) {
    String msg = '${expanded ? "Expanded" : "Collapsed"}: $key';
    debugPrint('_expandNode: $msg');
    Node node = _treeViewController.getNode(key)!;
    List<Node> updated;
    if (key == 'docs') {
      updated = _treeViewController.updateNode(
          key,
          node.copyWith(
            expanded: expanded,
            icon: expanded ? Icons.folder_open : Icons.folder,
          ));
    } else {
      updated = _treeViewController.updateNode(
          key,
          node.copyWith(
            expanded: expanded,
            icon: expanded ? Icons.folder_open : Icons.folder,
          ));
      // key,
      // node.copyWith());
    }
    setState(() {
      if (key == 'docs') docsOpen = expanded;
      _treeViewController = _treeViewController.copyWith(children: updated);
    });
  }

  ///
  /// add children when dir[node] is clicked:
  ///   get [children of current node] and add them into map [_dirChildren],
  ///   get current node by [key]
  ///   set [children of current node] by [key] of current node from [_dirChildren]
  ///   update Node
  ///
  _addChildrenNode(String key) {
    debugPrint("_addNode: $key ");

    /// get and add children to map [_dirChildren] of current node
    _dirEntryChildren = DirEntry(
      parentPath: key,
      currentPath: '',
    );
    _dirEntryChildren.getDirStrList(_dirEntryChildren).then((value) {
      _dirChildren.addEntries(
        {
          _dirEntryChildren.absolutelyCurrentPath: [
            ..._dirEntryChildren.listStrNameCurrentDirs.map((dir) {
              return Node(
                label: dir,
                key: "${_dirEntryChildren.absolutelyCurrentPath}/$dir",
                expanded: docsOpen,
                icon: docsOpen ? Icons.folder_open : Icons.folder,
                children: [],
                parent: true,
              );
            }).toList(),
            ..._dirEntryChildren.listStrNameCurrentFiles!.map(
              (file) {
                return Node(
                  label: file,
                  key: "${_dirEntryChildren.absolutelyCurrentPath}/$file",
                  iconColor: Colors.green.shade300,
                  selectedIconColor: Colors.white,
                  icon: Icons.insert_drive_file,
                  // nameSubview: file,
                  subview: Json2Widget(
                    key:
                        Key("${_dirEntryChildren.absolutelyCurrentPath}/$file"),
                    jsonData: {
                      "type": file,
                    },
                  ),
                );
              },
            ).toList()
          ]
        }.entries,
      );
      debugPrint("_dirChildren[$key]: ${_dirChildren[key]}");

      if (kDebugMode) {
        for (var element in _dirChildren[key]!) {
          debugPrint("children 's key: ${element.key}");
        }
      }

      /// get current node by key
      Node? node = _treeViewController.getNode(key);

      /// set children of current node
      node!.children = _dirChildren[key] ?? [];
      debugPrint("_addNode().node: $node");

      /// update Node
      List<Node> added = _treeViewController.updateNode(
        key,
        node.copyWith(),
      );
      debugPrint("added children: $added");
      // debugPrint("added _nodesFromPath: $_nodesFromPath");

      setState(() {
        _treeViewController = _treeViewController.copyWith(children: added);
      });
    });
  }
}

class ModContainer extends StatelessWidget {
  final ExpanderModifier modifier;

  const ModContainer(this.modifier, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderWidth = 0;
    BoxShape shapeBorder = BoxShape.rectangle;
    Color backColor = Colors.transparent;
    Color backAltColor = Colors.grey.shade700;
    switch (modifier) {
      case ExpanderModifier.none:
        break;
      case ExpanderModifier.circleFilled:
        shapeBorder = BoxShape.circle;
        backColor = backAltColor;
        break;
      case ExpanderModifier.circleOutlined:
        borderWidth = 1;
        shapeBorder = BoxShape.circle;
        break;
      case ExpanderModifier.squareFilled:
        backColor = backAltColor;
        break;
      case ExpanderModifier.squareOutlined:
        borderWidth = 1;
        break;
    }
    return Container(
      decoration: BoxDecoration(
        shape: shapeBorder,
        border: borderWidth == 0
            ? null
            : Border.all(
                width: borderWidth,
                color: backAltColor,
              ),
        color: backColor,
      ),
      width: 15,
      height: 15,
    );
  }
}
