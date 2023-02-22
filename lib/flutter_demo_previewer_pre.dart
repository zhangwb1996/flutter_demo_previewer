///
/// File: \lib\flutter_demo_previewer_pre.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Monday, 2023-02-06 12:39:19 am
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Wednesday, 2023-02-22 11:11:48 am
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
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_demo_previewer/src/common.dart';
// import 'package:flutter_demo_previewer/src/flag.dart';
// import 'package:flutter_demo_previewer/src/models/workspace.dart';
import 'package:flutter_demo_previewer/src/variables.dart';
import 'package:flutter_demo_previewer/src/widget.dart';
import 'package:flutter_demo_previewer/tools/dir/widget.dart';
import 'package:flutter_demo_previewer/tools/tree_view/src/models/node_workspace_editalbe.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:highlight/languages/dart.dart';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:provider/provider.dart';
// import 'tools/dir/dynamic_widget_helper.dart';
import 'tools/json_dynamic_widget/widget.dart';
import 'tools/explorer_view/widget.dart';
import 'tools/tree_view/widget.dart';

String demoPath =
    r'C:\Users\12700\Documents\FlutterProjects\Src\widget_design\lib\src\views';

class FlutterDemoPreviewerPre extends StatefulWidget {
  const FlutterDemoPreviewerPre({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<FlutterDemoPreviewerPre> createState() =>
      FlutterDemoPreviewerPreState();
}

class FlutterDemoPreviewerPreState extends State<FlutterDemoPreviewerPre> {
// class FlutterDemoPreviewerPre extends StatelessWidget {
  // String? _selectedNode;
  String? _showExplorerView;
  late TreeViewController _treeViewController = TreeViewController(
    children: [],
    selectedKey: '',
  );

  /// initial data of node
  final DirEntry _dirEntry = DirEntry(
    parentPath: '',
    currentPath: designPath,
  );

  final DirEntry _dirEntryPreview = DirEntry(
    parentPath: '',
    currentPath: previewPath,
  );

  /// data of node's children
  DirEntry _dirEntryChildren = DirEntry(
    parentPath: '',
    currentPath: '',
  );

  var registry = JsonWidgetRegistry.instance;

  bool isExpanded = false;

  /// Preview node click -> ture: container show
  /// widget_design node click -> false: container hiden
  bool isPreview = false;

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
    register(registry);

    // initial data
    _dirEntry.getDirStrList(_dirEntry).then((value) {
      nodesFromPath.add(
        NodeParent(
            label: designPath.split('/').last,
            key: designPath,
            expanded: isExpanded,
            icon: isExpanded ? Icons.folder_open : Icons.folder,
            children: [
              // dir
              ..._dirEntry.listStrNameCurrentDirs.map((dir) {
                return NodeParent(
                  label: dir,
                  key: pathSeparator("${_dirEntry.absolutelyCurrentPath}/$dir"),
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
                    key: pathSeparator(
                        "${_dirEntry.absolutelyCurrentPath}/$file"),
                    iconColor: Colors.green.shade300,
                    selectedIconColor: Colors.white,
                    icon: Icons.insert_drive_file,
                    // nameSubview: file,
                    subview: Json2Widget(
                      key: Key(pathSeparator(
                          "Json2Widget: ${_dirEntry.absolutelyCurrentPath}/$file")),
                      jsonData: {
                        "type": file,
                      },
                    ),
                  );
                },
              ).toList()
            ]),
      );

      _dirEntryPreview.getDirStrList(_dirEntryPreview).then((value) {
        nodesFromPathPreview.add(
          NodeParent(
              label: previewPath.split('/').last,
              key: previewPath,
              expanded: isExpanded,
              icon: isExpanded ? Icons.folder_open : Icons.folder,
              children: [
                // dir
                ..._dirEntryPreview.listStrNameCurrentDirs.map((dir) {
                  return NodeParent(
                    label: dir,
                    key: pathSeparator(
                        "${_dirEntryPreview.absolutelyCurrentPath}/$dir"),
                    expanded: isExpanded,
                    icon: isExpanded ? Icons.folder_open : Icons.folder,
                    children: const [],
                  );
                }).toList(),
                // file
                ..._dirEntryPreview.listStrNameCurrentFiles!.map(
                  (file) {
                    return NodeChild(
                      label: file,
                      key: pathSeparator(
                          "${_dirEntryPreview.absolutelyCurrentPath}/$file"),
                      iconColor: Colors.green.shade300,
                      selectedIconColor: Colors.white,
                      icon: Icons.insert_drive_file,
                      // nameSubview: file,
                      subview: Json2Widget(
                        key: Key(pathSeparator(
                            "Json2Widget: ${_dirEntryPreview.absolutelyCurrentPath}/$file")),
                        jsonData: {
                          "type": file,
                        },
                      ),
                    );
                  },
                ).toList()
              ]),
        );
        workspace.add(
          NodeWorkspace(
            key: "workspace: widget_design",
            label: "widget_design",
            // subview: ExplorerView(),
            children: nodesFromPath,
          ),
        );
        workspace.add(
          NodeWorkspace(
            key: "workspace: preview",
            label: "preview",
            // subview: ExplorerView(),
            children: nodesFromPathPreview,
          ),
        );

        /// init TreeViewController
        _treeViewController = TreeViewController(
          children: workspace,
          // selectedKey: _selectedNode,
          selectedKey: '',
        );
        if (kDebugMode) {
          dynamicWidgetHelperPre(designPath, "widget_design");
          dynamicWidgetHelperPre(previewPath, "preview", insert: true);
        }

        setState(() {});
      });
      // var t = "Add Workspace";
      // workspace.add(
      //   NodeWorkspaceAdd(
      //     key: "adding workspace",
      //     label: t,
      //   ),
      // );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // nodeParentTapped = false;
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
        child: Stack(
          children: [
            Consumer<SearchHelperModel>(
              builder: (context, helper, child) => Container(
                padding: const EdgeInsets.all(20),
                height: double.infinity,
                child: Row(
                  children: [
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      margin: const EdgeInsets.only(right: 5),
                      child: Builder(
                        builder: (context) {
                          debugPrint("flutter_demo_previewer_pre: tree");
                          // setState(() {
                          searching(helper);
                          // });
                          _treeViewController = _treeViewController.copyWith(
                            selectedKey: helper.selectedKey,
                          );
                          if (_treeViewController.children.isNotEmpty) {
                            debugPrint(
                                "flutter_demo_previewer_pre: tree: ${(_treeViewController.getNode('../widget_design/lib/src/preview')! as NodeParent).expanded}");
                          }

                          return TreeView(
                            controller: _treeViewController,
                            allowParentSelect: _allowParentSelect,
                            supportParentDoubleTap: _supportParentDoubleTap,
                            onExpansionChanged: (key, expanded) {
                              debugPrint(
                                  "node which key is $key ExpansionChanged! \n expanded=$expanded");
                              nodeParentTapped = true;
                              _expandNode(key, expanded);
                              if (expanded) _addChildrenNode(key);
                            },
                            onNodeTap: (key) {
                              debugPrint('node which key is $key Tapped!');
                              setState(() {
                                if (key == "adding workspace") {
                                  clickNodeWorkspaceEditable();
                                } else {
                                  helper.selectedKey = key;
                                  _treeViewController =
                                      _treeViewController.copyWith(
                                          selectedKey: helper.selectedKey);
                                }
                              });
                            },
                            onSubmitted: (key, str) {
                              debugPrint("onSubmitted");
                              addNewWorkspace(
                                "workspace: NodeWorkspaceEditable",
                                str,
                              );
                            },
                            onAddingWorksapce: (key) {
                              debugPrint("onAddingWorksapce, key is: $key");
                              setState(() {
                                _showExplorerView = key;
                                // helper.selectedKey = key;
                              });
                            },
                            theme: treeViewTheme,
                          );
                        },
                      ),
                    ),
                    Container(child: codeBuilder(helper)),
                    Expanded(
                      child: previewBuilder(context, helper),
                    ),
                  ],
                ),
              ),
            ),
            const SearchView(),
          ],
        ),
      ),
    );
  }

  GestureDetector previewBuilder(
      BuildContext context, SearchHelperModel helper) {
    return GestureDetector(
      onTap: () {
        debugPrint('Close Keyboard');
        FocusScope.of(context).unfocus();
      },
      child: Builder(builder: (context) {
        // print
        debugPrint(
          '''flutter_demo_previewer_pre: previewBuilder
     key: $helper.selectedKey
     node: ${_treeViewController.getNode(helper.selectedKey)}''',
        );

        //teturn
        return Container(
          alignment: Alignment.center,
          child: Builder(builder: (context) {
            if (_treeViewController.getNode(helper.selectedKey).runtimeType ==
                Workspace) {
              return _treeViewController.getNode(_showExplorerView) == null
                  ? const Text("data")
                  : _treeViewController.getNode(_showExplorerView)!.subview ??
                      const Text("data");
            }
            return _treeViewController.getNode(helper.selectedKey) == null
                ? const Text("data")
                : _treeViewController.getNode(helper.selectedKey)!.subview ??
                    const Text("data");
          }),
        );
      }),
    );
  }

  Widget codeBuilder(SearchHelperModel helper) {
    debugPrint('flutter_demo_previewer_pre: codeBuilder');
    return Builder(
      builder: (context) {
        if (helper.selectedKey.split('/').contains("preview")) {
          isPreview = true;
        } else if (helper.selectedKey.split('/').contains("views")) {
          isPreview = false;
        }
        debugPrint("isPreview: $isPreview");

        if (isPreview &&
            (codeHelper(helper.selectedKey).isNotEmpty ||
                !helper.selectedKey.contains('workspace:'))) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CodeTheme(
                data: CodeThemeData(styles: githubTheme),
                child: SingleChildScrollView(
                  child: CodeField(
                    gutterStyle: const GutterStyle(
                      textStyle: TextStyle(fontSize: 1),
                      width: 80,
                      showLineNumbers: true,
                    ),
                    readOnly: true,
                    controller: CodeController(
                      text: codeHelper(helper.selectedKey).isNotEmpty &&
                              !helper.selectedKey.contains('workspace:')
                          ? codeHelper(helper.selectedKey)
                          : '', // Initial code
                      language: dart,
                    ),
                  ),
                ),
              ),

              // ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  void searching(SearchHelperModel helper) {
    if (nodeParentTapped) {
      return;
    }
    // add node if getNode(model.getSelectedKey) return null
    List<String> parent = helper.selectedKey.split("/");
    debugPrint(
        "flutter_demo_previewer_pre: searching: selectedKey: ${helper.selectedKey}");
    if (parent.length <= 5) {
      return;
    }
    String s = '';
    List<String> l = parent.sublist(0, 4);
    for (var i = 4; i < parent.length; i++) {
      l.add(parent[i]);
      s = l.join('/'); // key
      if (_treeViewController.getNode(s).runtimeType == NodeParent &&
          (_treeViewController.getNode(s) as NodeParent).children!.isEmpty) {
        // [·]branch: pre-searching-navigation-01:call setState will occur: setState() or markNeedsBuild() called during build
        if (!l.join('/').endsWith(".dart")) {
          _addChildrenNode(s);
        }
      }
      if (_treeViewController.getNode(l.join('/')).runtimeType == NodeParent) {
        searchingExpandNode(s);
      }
      searchingExpandNode('workspace: preview');
      searchingExpandNode(s);
    }
  }

  void searchingExpandNode(String s) {
    if (_treeViewController.getNode(s) == null) {
      return;
    }
    switch (_treeViewController.getNode(s)!.runtimeType) {
      case NodeParent:
        _treeViewController = _treeViewController.copyWith(
          children: _treeViewController.updateNode(
            s,
            (_treeViewController.getNode(s)! as NodeParent).copyWith(
              expanded: true,
              icon: Icons.folder_open,
            ),
          ),
        );
        break;
      case NodeWorkspace:
        _treeViewController = _treeViewController.copyWith(
          children: _treeViewController.updateNode(
            s,
            (_treeViewController.getNode(s)! as NodeWorkspace).copyWith(
              expanded: true,
              icon: Icons.folder_open,
            ),
          ),
        );
        break;
      default:
      // _treeViewController = _treeViewController.copyWith(children: []);
    }
  }

  void clickNodeWorkspaceEditable() {
    if (_treeViewController.getNode("workspace: NodeWorkspaceEditable") !=
        null) {
      return;
    }
    workspace.insert(
      1,
      const NodeWorkspaceEditable(
        key: "workspace: NodeWorkspaceEditable",
        label: "wNodeWorkspaceEditable",
      ),
    );

    // _selectedNode = key;
    _treeViewController = _treeViewController.copyWith(
      children: workspace,
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
      dirChildren.clear();
      dirChildren.addAll([
        ..._dirEntryChildren.listStrNameCurrentDirs.map((dir) {
          // [ ]TODO: if node exsited, do something like continue;
          if (_treeViewController
                  .getNode("${_dirEntryChildren.absolutelyCurrentPath}/$dir") ==
              null) {
            // return null;
          }
          return NodeParent(
            label: dir,
            key: pathSeparator(
                "${_dirEntryChildren.absolutelyCurrentPath}/$dir"),
            expanded: isExpanded,
            icon: isExpanded ? Icons.folder_open : Icons.folder,
            children: const [],
          );
        }).toList(),
        ..._dirEntryChildren.listStrNameCurrentFiles!.map(
          (file) {
            // [ ]TODO: if node exsited, do something like continue;
            if (_treeViewController.getNode(
                    "${_dirEntryChildren.absolutelyCurrentPath}/$file") ==
                null) {
              // return null;
            }
            return NodeChild(
              label: file,
              key: pathSeparator(
                  "${_dirEntryChildren.absolutelyCurrentPath}/$file"),
              iconColor: Colors.green.shade300,
              selectedIconColor: Colors.white,
              icon: Icons.insert_drive_file,
              // nameSubview: file,
              subview: Json2Widget(
                key: Key(pathSeparator(
                    "Json2Widget: ${_dirEntryChildren.absolutelyCurrentPath}/$file")),
                jsonData: {
                  "type": file,
                },
              ),
            );
          },
        ).toList()
      ]);

      NodeBaseExpandable newNode;
      switch (node.runtimeType) {
        // case NodeWorkspace:
        //   (node as NodeWorkspace).copyWith(children: dirChildren[key] ?? []);
        //   break;
        case NodeParent:
          newNode = (node as NodeParent).copyWith(children: dirChildren);
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
  void addNewWorkspace(String key, String name) {
    // TODO: If key is existed, do something
    if (_treeViewController.getNode('Workspace:$name') != null) {
      return;
    }

    workspace.insert(
        2,
        NodeWorkspace(
          key: 'Workspace:$name',
          label: name,
          subview: ExplorerView(
            workspaceName: name,
            controller: _treeViewController,
          ),
        ));
    workspace.removeAt(1);
    setState(() {
      // _treeViewController = _treeViewController.copyWith(children: workspace);
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
