import 'dart:async';

import 'dir_level.dart';
import 'states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../flutter_treeview.dart';

void main() => runApp(const MyApp());

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
  late List<Node> _nodes;
  late List<Node> _nodes1;
  late TreeViewController _treeViewController = TreeViewController(
    children: [],
    selectedKey: null,
  );
  bool docsOpen = true;
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
  ExpanderPosition _expanderPosition = ExpanderPosition.start;
  ExpanderType _expanderType = ExpanderType.arrow;
  ExpanderModifier _expanderModifier = ExpanderModifier.none;
  bool _allowParentSelect = false;
  bool _supportParentDoubleTap = false;

  String str =
      r'C:\Users\12700\Documents\FlutterProjects\Src\demo_flutter_doc\lib/';

  var dl = DirLevel(
    parentDir: '',
    currentDir:
        r'C:\Users\12700\Documents\FlutterProjects\Src\demo_flutter_doc\lib/',
  );

  var dlChildren = DirLevel(
    parentDir: '',
    currentDir: '',
  );

  late String _nodeKeys;
  final Map<String, List<Node<dynamic>>> _dirChildren = {};
  // List<Node<dynamic>> _dirChildren = [];

  @override
  void initState() {
    super.initState();
  }

  ListTile _makeExpanderPosition() {
    return ListTile(
      title: const Text('Expander Position'),
      dense: true,
      trailing: CupertinoSlidingSegmentedControl(
        children: expansionPositionOptions,
        groupValue: _expanderPosition,
        onValueChanged: ((value) {
          setState(() {
            _expanderPosition = value!;
          });
        }),
      ),
    );
  }

  SwitchListTile _makeAllowParentSelect() {
    return SwitchListTile.adaptive(
      title: const Text('Allow Parent Select'),
      dense: true,
      value: _allowParentSelect,
      onChanged: (v) {
        setState(() {
          _allowParentSelect = v;
        });
      },
    );
  }

  SwitchListTile _makeSupportParentDoubleTap() {
    return SwitchListTile.adaptive(
      title: const Text('Support Parent Double Tap'),
      dense: true,
      value: _supportParentDoubleTap,
      onChanged: (v) {
        setState(() {
          _supportParentDoubleTap = v;
        });
      },
    );
  }

  ListTile _makeExpanderType() {
    return ListTile(
      title: const Text('Expander Style'),
      dense: true,
      trailing: CupertinoSlidingSegmentedControl(
        // trailing: CupertinoSlidingSegmentedControl(
        children: expansionTypeOptions,
        groupValue: _expanderType,
        onValueChanged: ((value) {
          setState(() {
            _expanderType = value ?? ExpanderType.arrow;
          });
        }),
      ),
    );
  }

  ListTile _makeExpanderModifier() {
    return ListTile(
      title: const Text('Expander Modifier'),
      dense: true,
      trailing: CupertinoSlidingSegmentedControl(
        children: expansionModifierOptions,
        groupValue: _expanderModifier,
        onValueChanged: ((value) {
          setState(() {
            _expanderModifier = value!;
          });
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: FutureBuilder(
          future: dl.getDirStrList(dl),
          // body: StreamBuilder(stream: (() {
          //   late final StreamController<int> controller;
          //   controller = StreamController<int>(
          //     onListen: () async {
          //       await dl.getDirStrList(dl);
          //       await dlChildren.getDirStrList(dlChildren);
          //     },
          //   );
          //   return controller.stream;
          // })(),
          builder: (context, snapshot) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                height: double.infinity,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 160,
                      child: Column(
                        children: <Widget>[
                          _makeExpanderPosition(),
                          _makeExpanderType(),
                          _makeExpanderModifier(),
                          //_makeAllowParentSelect(),
                          //_makeSupportParentDoubleTap(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),

                            /// builder
                            child: Builder(builder: (context) {
                              _nodes1 = [
                                /// dirs
                                ...dl.currentStrDirs.map((dir) {
                                  debugPrint(
                                      "init nodeKey: ${dl.absolutelyCurrentPath}$dir/");
                                  return Node(
                                    label: dir,
                                    key: "${dl.absolutelyCurrentPath}$dir",
                                    expanded: docsOpen,
                                    icon: docsOpen
                                        ? Icons.folder_open
                                        : Icons.folder,
                                    // children: _dirChildren,
                                    children: _dirChildren[
                                            "${dl.absolutelyCurrentPath}$dir"] ??
                                        [],
                                    // children: _nodes,
                                    parent: true,
                                  );
                                }).toList(),

                                /// files
                                ...dl.currentFiles!.map(
                                  (file) {
                                    return Node(
                                        label: file,
                                        key: "${dl.absolutelyCurrentPath}$file",
                                        iconColor: Colors.green.shade300,
                                        selectedIconColor: Colors.white,
                                        icon: Icons.insert_drive_file);
                                  },
                                ).toList()
                              ];

                              /// init TreeViewController
                              _treeViewController = TreeViewController(
                                children: _nodes1,
                                selectedKey: _selectedNode,
                              );

                              /// Theme
                              debugPrint(
                                  "expanderType:${_expanderType.name}; expanderModifier:${_expanderModifier.name}; expanderPosition:${_expanderPosition.name}; ");
                              var treeViewTheme = TreeViewTheme(
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

                              /// return
                              return TreeView(
                                controller: _treeViewController,
                                allowParentSelect: _allowParentSelect,
                                supportParentDoubleTap: _supportParentDoubleTap,
                                onExpansionChanged: (key, expanded) async {
                                  debugPrint('Selected key: $key');

                                  /// get children
                                  dlChildren = DirLevel(
                                    parentDir: key,
                                    currentDir: '',
                                  );

                                  await dlChildren
                                      .getDirStrList(dlChildren)
                                      .then((value) {
                                    debugPrint(
                                      "_dirChildren[$key] != null=>${_dirChildren[key] != null}",
                                    );
                                    debugPrint(
                                      "_dirChildren[$key] = ${_dirChildren[key]}",
                                    );

                                    // if (_dirChildren[key] != null) {
                                    //   return;
                                    // }

                                    debugPrint(
                                      "dlChildren.currentStrDirs: ${dlChildren.currentStrDirs.toString()}",
                                    );
                                    debugPrint(
                                      "dlChildren.currentFiles: ${dlChildren.currentFiles.toString()}",
                                    );
                                    debugPrint(
                                      "dlChildren.absolutelyCurrentPath: ${dlChildren.absolutelyCurrentPath.toString()}",
                                    );

                                    setState(() {
                                      _dirChildren.addEntries({
                                        dlChildren.absolutelyCurrentPath: [
                                          ...dlChildren.currentStrDirs
                                              .map((dir) {
                                            return Node(
                                              label: dir,
                                              key:
                                                  "${dlChildren.absolutelyCurrentPath}/$dir",
                                              expanded: docsOpen,
                                              icon: docsOpen
                                                  ? Icons.folder_open
                                                  : Icons.folder,
                                              // children: _dirChildren[dlChildren
                                              //     .absolutelyCurrentPath]!,
                                              children: [],
                                              // children: _nodes,
                                              parent: true,
                                            );
                                          }).toList(),
                                          ...dlChildren.currentFiles!.map(
                                            (file) {
                                              return Node(
                                                  label: file,
                                                  key:
                                                      "${dlChildren.absolutelyCurrentPath}$file",
                                                  iconColor:
                                                      Colors.green.shade300,
                                                  selectedIconColor:
                                                      Colors.white,
                                                  icon:
                                                      Icons.insert_drive_file);
                                            },
                                          ).toList()
                                        ]
                                      }.entries);
                                    });

                                    // debugPrint(
                                    //     'Map_dirChildren: $_dirChildren');
                                    // debugPrint(
                                    //   '_treeViewController: ${_treeViewController.children}',
                                    // );

                                    /// List _dirChildren
                                    // _dirChildren = [
                                    //   ...dlChildren.currentStrDirs.map((dir) {
                                    //     return Node(
                                    //       label: dir,
                                    //       key:
                                    //           "${dlChildren.currentStrDirs.indexOf(dir)} ${dlChildren.absolutelyCurrentPath}*$dir",
                                    //       expanded: docsOpen,
                                    //       icon: docsOpen
                                    //           ? Icons.folder_open
                                    //           : Icons.folder,
                                    //       children: [],
                                    //       // children: _nodes,
                                    //       parent: true,
                                    //     );
                                    //   }).toList(),
                                    //   ...dlChildren.currentFiles!.map(
                                    //     (file) {
                                    //       return Node(
                                    //           label: file,
                                    //           key:
                                    //               "${dlChildren.currentFiles!.indexOf(file)} ${dlChildren.absolutelyCurrentPath}*$file",
                                    //           iconColor: Colors.green.shade300,
                                    //           selectedIconColor: Colors.white,
                                    //           icon: Icons.insert_drive_file);
                                    //     },
                                    //   ).toList()
                                    // ];
                                    // debugPrint(
                                    //   '_dirChildren: ${_dirChildren.toString()}',
                                    // );
                                  });

                                  /// update expand
                                  _expandNode(
                                    key,
                                    expanded,
                                    // false,
                                    // _treeViewController,
                                  );
                                },
                                onNodeTap: (key) {
                                  debugPrint('Selected: $key');
                                  setState(() {
                                    // _dirChildren=
                                    _selectedNode = key;
                                    _treeViewController = _treeViewController
                                        .copyWith(selectedKey: key);
                                  });
                                },
                                theme: treeViewTheme,
                              );
                            }),
                          ),

                          /// origin
                          //   child: TreeView(
                          //     controller: _treeViewController,
                          //     allowParentSelect: _allowParentSelect,
                          //     supportParentDoubleTap: _supportParentDoubleTap,
                          //     onExpansionChanged: (key, expanded) =>
                          //         _expandNode(key, expanded, _treeViewController),
                          //     onNodeTap: (key) {
                          //       debugPrint('Selected: $key');
                          //       setState(() {
                          //         _selectedNode = key;
                          //         _treeViewController =
                          //             _treeViewController.copyWith(selectedKey: key);
                          //       });
                          //     },
                          //     theme: treeViewTheme,
                          //   ),
                          // ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                debugPrint('Close Keyboard');
                                FocusScope.of(context).unfocus();
                              },
                              child: Container(
                                padding: const EdgeInsets.only(top: 20),
                                alignment: Alignment.center,
                                child: Text(_treeViewController
                                            .getNode(_selectedNode) ==
                                        null
                                    ? ''
                                    : _treeViewController
                                        .getNode(_selectedNode)!
                                        .label),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: SafeArea(
        top: false,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CupertinoButton(
              child: const Text('Node'),
              onPressed: () {
                setState(() {
                  _treeViewController = _treeViewController.copyWith(
                    // children: _nodes,
                    children: _nodes1,
                  );
                });
              },
            ),
            CupertinoButton(
              child: const Text('JSON'),
              onPressed: () {
                setState(() {
                  _treeViewController =
                      _treeViewController.loadJSON(json: US_STATES_JSON);
                });
              },
            ),
            CupertinoButton(
              child: const Text('Deep'),
              onPressed: () {
                String deepKey = 'jh1b';
                setState(() {
                  if (deepExpanded == false) {
                    List<Node> newdata =
                        _treeViewController.expandToNode(deepKey);
                    _treeViewController =
                        _treeViewController.copyWith(children: newdata);
                    deepExpanded = true;
                  } else {
                    _treeViewController =
                        _treeViewController.withCollapseToNode(deepKey);
                    deepExpanded = false;
                  }
                });
              },
            ),
            CupertinoButton(
              child: const Text('Edit'),
              onPressed: () {
                TextEditingController editingController = TextEditingController(
                    text: _treeViewController.selectedNode!.label);
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Edit Label'),
                        content: Container(
                          height: 80,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: CupertinoTextField(
                            controller: editingController,
                            autofocus: true,
                          ),
                        ),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancel'),
                          ),
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            onPressed: () {
                              if (editingController.text.isNotEmpty) {
                                setState(() {
                                  Node node = _treeViewController.selectedNode!;
                                  _treeViewController =
                                      _treeViewController.withUpdateNode(
                                          _treeViewController.selectedKey!,
                                          node.copyWith(
                                              label: editingController.text));
                                });
                                debugPrint(editingController.text);
                              }
                              Navigator.of(context).pop();
                            },
                            child: const Text('Update'),
                          ),
                        ],
                      );
                    });
              },
            ),
          ],
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
