///
/// File: \lib\flutter_demo_preview.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Monday, 2023-02-06 12:39:19 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Thursday, 2023-02-09 1:01:44 pm
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

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
// import 'tools/dir/dynamic_widget_helper.dart';
import 'tools/json_dynamic_widget/json_dynamic_widget.dart';
import 'tools/explorer_view/widget.dart';
import 'tools/tree_view/flutter_treeview.dart';
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

  ///
  /// used when node expanded
  ///
  /// all data of children
  ///
  /// key: current path of this node
  ///
  /// List: children of this node
  final Map<String, List<NodeBase<dynamic>>> _dirChildren = {};

  /// TODO workspace
  final List<NodeBase<dynamic>> _workspace = [];

  final List<NodeBase> _nodesFromPath = [];

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

  @override
  void initState() {
    /// prepare previewed demo
    // dynamicWidgetHelper(demoPath);
    register(registry);

    var t = "Add Workspace";

    /// initial data
    _dirEntry.getDirStrList(_dirEntry).then((value) {
      _nodesFromPath.add(
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

      _workspace.add(
        const NodeWorkspaceAdd(
          key: "button for adding workspace",
          label: "Add Workspace",
          subview: ExplorerView(),
        ),
      );
      _workspace.add(
        NodeWorkspace(
          key: "workspace: workspace 1",
          label: "workspace 1",
          children: [..._nodesFromPath, ..._nodesFromPath],
        ),
      );
      _workspace.add(
        NodeWorkspace(
          key: "workspace: workspace 2",
          label: "workspace 2",
          children: [..._nodesFromPath, ..._nodesFromPath],
        ),
      );
      _workspace.add(
        NodeWorkspace(
          key: "workspace: workspace 3",
          label: "workspace 3",
        ),
      );
      // _workspace.addAll(_nodesFromPath);
      // _workspace.addAll(_nodesFromPath);

      /// init TreeViewController
      _treeViewController = TreeViewController(
        children: _workspace,
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
                        padding: const EdgeInsets.all(2),
                        child: Builder(builder: (context) {
                          return TreeView(
                            controller: _treeViewController,
                            allowParentSelect: _allowParentSelect,
                            supportParentDoubleTap: _supportParentDoubleTap,
                            onNodeDoubleTap: (key) => {
                              debugPrint("node which key is $key doubletapped!")
                            },
                            onExpansionChanged: (key, expanded) {
                              if (expanded) _addChildrenNode(key);

                              _expandNode(
                                key,
                                expanded,
                              );
                            },
                            onNodeTap: (key) {
                              debugPrint(
                                  'nameSubview: ${_treeViewController.getNode(key)?.nameSubview}');
                              setState(() {
                                _selectedNode = key;
                                _treeViewController = _treeViewController
                                    .copyWith(selectedKey: key);
                              });
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

  _expandNode(String key, bool expanded) {
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
  _addChildrenNode(String key) {
    _dirEntryChildren = DirEntry(
      parentPath: key,
      currentPath: '',
    );
    NodeBase? node = _treeViewController.getNode(key);

    if (node == null || node.runtimeType == NodeWorkspace) {
      return;
    }
    _dirEntryChildren.getDirStrList(_dirEntryChildren).then((value) {
      _dirChildren.addEntries(
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
      (node as NodeBaseExpandable).children = _dirChildren[key] ?? [];
      // switch (node.runtimeType) {
      //   case NodeWorkspace:
      //     (node as NodeWorkspace).children = _dirChildren[key] ?? [];

      //     break;
      //   case NodeParent:
      //     (node as NodeParent).children = _dirChildren[key] ?? [];
      //     break;
      //   default:
      // }

      List<NodeBase>? added = _treeViewController.updateNode(
        key,
        node.copyWith(),
      );
      // debugPrint("added children: $added");
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
