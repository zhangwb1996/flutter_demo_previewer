///
/// File: \lib\flutter_demo_preview.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Monday, 2023-02-06 12:39:19 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Friday, 2023-02-10 9:20:21 pm
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
import 'package:flutter_demo_previewer/src/models/workspace.dart';
import 'package:flutter_demo_previewer/src/variables.dart';
import 'package:flutter_demo_previewer/tools/tree_view/src/models/node_workspace_editalbe.dart';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
// import 'tools/dir/dynamic_widget_helper.dart';
import 'tools/json_dynamic_widget/json_dynamic_widget.dart';
import 'tools/explorer_view/widget.dart';
import 'tools/tree_view/widget.dart';
import 'tools/dir/dir_entry.dart';

String demoPath =
    r'C:\Users\12700\Documents\FlutterProjects\Src\flutter_demo_previewer\lib';

class FlutterDemoPreview extends StatefulWidget {
  const FlutterDemoPreview({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FlutterDemoPreview> createState() => TreeViewPreviewState();
}

class TreeViewPreviewState extends State<FlutterDemoPreview> {
  String? _selectedNode;

  late TreeViewController _treeViewController = TreeViewController(
    children: [],
    selectedKey: null,
  );

  /// initial data of node
  final DirEntry _dirEntry = DirEntry(
    parentPath: '',
    currentPath: demoPath,
  );

  /// data of node's children
  DirEntry _dirEntryChildren = DirEntry(
    parentPath: '',
    currentPath: '',
  );

  var registry = JsonWidgetRegistry.instance;

  bool isExpanded = false;

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

  late TreeViewTheme treeViewTheme;
  @override
  void initState() {
    // prepare previewed demo
    // dynamicWidgetHelper(demoPath);
    register(registry);

    // initial data
    _dirEntry.getDirStrList(_dirEntry).then((value) {
      nodesFromPath.add(
        NodeParent(
            label: demoPath,
            key: demoPath,
            expanded: isExpanded,
            icon: isExpanded ? Icons.folder_open : Icons.folder,
            children: [
              // dir
              ..._dirEntry.listStrNameCurrentDirs.map((dir) {
                return NodeParent(
                  label: dir,
                  key: "${_dirEntry.absolutelyCurrentPath}/$dir",
                  expanded: isExpanded,
                  icon: isExpanded ? Icons.folder_open : Icons.folder,
                  children: const [],
                );
              }).toList(),
              // file
              ..._dirEntry.listStrNameCurrentFiles!.map(
                (file) {
                  return NodeChild(
                    label: file,
                    key: "${_dirEntry.absolutelyCurrentPath}/$file",
                    iconColor: Colors.green.shade300,
                    selectedIconColor: Colors.white,
                    icon: Icons.insert_drive_file,
                    // nameSubview: file,
                    subview: Json2Widget(
                      key: Key(
                          "Json2Widget: ${_dirEntry.absolutelyCurrentPath}/$file"),
                      jsonData: {
                        "type": file,
                      },
                    ),
                  );
                },
              ).toList()
            ]),
      );

      var t = "Add Workspace";
      workspace.add(
        NodeWorkspaceAdd(
          key: "adding workspace",
          label: t,
          subview: const ExplorerView(),
        ),
      );

      workspace.add(
        NodeWorkspace(
          key: "workspace: workspace 1",
          label: "workspace 1",
          children: nodesFromPath,
        ),
      );

      /// init TreeViewController
      _treeViewController = TreeViewController(
        children: workspace,
        selectedKey: _selectedNode,
      );
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // theme
    treeViewTheme = TreeViewTheme(
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
    // return [Scaffold]
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
                        padding: const EdgeInsets.all(2),
                        child: Builder(builder: (context) {
                          return TreeView(
                            controller: _treeViewController,
                            allowParentSelect: _allowParentSelect,
                            supportParentDoubleTap: _supportParentDoubleTap,
                            onNodeDoubleTap: (key) => {
                              debugPrint("node which key is $key DoubleTapped!")
                            },
                            onExpansionChanged: (key, expanded) {
                              debugPrint(
                                  "node which key is $key ExpansionChanged!");
                              if (expanded) _addChildrenNode(key);
                              _expandNode(
                                key,
                                expanded,
                              );
                            },
                            onNodeTap: (key) {
                              debugPrint('node which key is $key Tapped!');
                              setState(() {
                                if (key == "adding workspace") {
                                  workspace.insert(
                                    1,
                                    NodeWorkspaceEditable(
                                      key: "workspace: NodeWorkspaceEditable",
                                      label: "wNodeWorkspaceEditable",
                                    ),
                                  );
                                  // _selectedNode = key;
                                  _treeViewController =
                                      _treeViewController.copyWith(
                                    children: workspace,
                                  );
                                } else {
                                  _selectedNode = key;
                                  _treeViewController = _treeViewController
                                      .copyWith(selectedKey: key);
                                }
                              });
                            },
                            onSubmitted: (key, str) {
                              addNewWorkspace(key, str);
                            },
                            theme: treeViewTheme,
                          );
                        })),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          debugPrint('Close Keyboard');
                          FocusScope.of(context).unfocus();
                        },
                        child: Container(
                          // padding: const EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: Builder(builder: (context) {
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

  void _expandNode(String key, bool expanded) {
    NodeBase? node = _treeViewController.getNode(key);
    List<NodeBase>? updated;
    switch (node.runtimeType) {
      case NodeWorkspace:
        updated = _treeViewController.updateNode(
            key,
            (node as NodeWorkspace).copyWith(
              expanded: expanded,
            ));
        break;
      case NodeParent:
        updated = _treeViewController.updateNode(
            key,
            (node as NodeParent).copyWith(
              expanded: expanded,
              icon: expanded ? Icons.folder_open : Icons.folder,
            ));
        break;
      default:
        updated = [];
    }

    setState(() {
      _treeViewController = _treeViewController.copyWith(children: updated);
    });
  }

  ///
  /// ### add children when dir[node] is clicked:
  /// > get [children of current node] and add them into map [_dirChildren],
  /// > get current node by [key]
  /// > set [children of current node] by [key] of current node from [_dirChildren]
  /// > update Node
  ///
  void _addChildrenNode(String key) {
    _dirEntryChildren = DirEntry(
      parentPath: key,
      currentPath: '',
    );
    NodeBase? node = _treeViewController.getNode(key);

    if (node == null || node.runtimeType == NodeWorkspace) {
      return;
    }
    _dirEntryChildren.getDirStrList(_dirEntryChildren).then((value) {
      dirChildren.addEntries(
        {
          _dirEntryChildren.absolutelyCurrentPath: [
            ..._dirEntryChildren.listStrNameCurrentDirs.map((dir) {
              return NodeParent(
                label: dir,
                key: "${_dirEntryChildren.absolutelyCurrentPath}/$dir",
                expanded: isExpanded,
                icon: isExpanded ? Icons.folder_open : Icons.folder,
                children: const [],
              );
            }).toList(),
            ..._dirEntryChildren.listStrNameCurrentFiles!.map(
              (file) {
                return NodeChild(
                  label: file,
                  key: "${_dirEntryChildren.absolutelyCurrentPath}/$file",
                  iconColor: Colors.green.shade300,
                  selectedIconColor: Colors.white,
                  icon: Icons.insert_drive_file,
                  // nameSubview: file,
                  subview: Json2Widget(
                    key: Key(
                        "Json2Widget: ${_dirEntryChildren.absolutelyCurrentPath}/$file"),
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

      NodeBaseExpandable newNode;
      switch (node.runtimeType) {
        // case NodeWorkspace:
        //   (node as NodeWorkspace).copyWith(children: dirChildren[key] ?? []);
        //   break;
        case NodeParent:
          newNode =
              (node as NodeParent).copyWith(children: dirChildren[key] ?? []);
          break;
        default:
          newNode = (node as NodeBaseExpandable).copyWith();
      }
      List<NodeBase>? added = _treeViewController.updateNode(
        key,
        newNode.copyWith(),
      );
      setState(() {
        _treeViewController = _treeViewController.copyWith(children: added);
      });
    });
  }

  ///
  void addNewWorkspace(String key, String str) {
    _treeViewController.deleteNode(key);
    workspace.add(NodeWorkspace(key: 'Workspace:$str', label: str));
    setState(() {});
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
