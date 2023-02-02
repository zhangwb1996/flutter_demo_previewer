import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'tree_view/flutter_treeview.dart';
import 'package:tree/tools/dir/dir_entry.dart';

String str =
    r'C:\Users\12700\Documents\FlutterProjects\Src\demo_flutter_doc\lib/';
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

  late List<Node> _nodes1 = [];
  late TreeViewController _treeViewController = TreeViewController(
    children: [],
    selectedKey: null,
  );

  final ExpanderPosition _expanderPosition = ExpanderPosition.start;
  final ExpanderType _expanderType = ExpanderType.caret;
  final ExpanderModifier _expanderModifier = ExpanderModifier.none;
  final bool _allowParentSelect = false;
  final bool _supportParentDoubleTap = false;

  /// initial data of node
  DirEntry dirEntry = DirEntry(
    parentPath: '',
    currentPath: str,
  );

  /// data of node's children
  DirEntry dirEntryChildren = DirEntry(
    parentPath: '',
    currentPath: '',
  );

  /// data of children
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
  @override
  void initState() {
    /// init tree node
    dirEntry.getDirStrList(dirEntry).then((value) {
      _nodes1 = [
        Node(
            label: str,
            key: str,
            expanded: !docsOpen,
            icon: !docsOpen ? Icons.folder_open : Icons.folder,
            children: [
              /// dirs
              ...dirEntry.listStrNameCurrentDirs.map((dir) {
                debugPrint(
                    "init nodeKey: ${dirEntry.absolutelyCurrentPath}$dir");
                return Node(
                  label: dir,
                  key: "${dirEntry.absolutelyCurrentPath}$dir",
                  expanded: docsOpen,
                  icon: docsOpen ? Icons.folder_open : Icons.folder,
                  children: [],
                  parent: true,
                );
              }).toList(),

              /// files
              ...dirEntry.listStrNameCurrentFiles!.map(
                (file) {
                  return Node(
                    label: file,
                    key: "${dirEntry.absolutelyCurrentPath}/$file",
                    iconColor: Colors.green.shade300,
                    selectedIconColor: Colors.white,
                    icon: Icons.insert_drive_file,
                    subview: const Text("this is preview of widget"),
                  );
                },
              ).toList()
            ])
      ];

      /// TODO open different path in one tree
      _workspace.addEntries({_nodes1[0].label: _nodes1}.entries);

      /// init TreeViewController
      _treeViewController = TreeViewController(
        children: _nodes1,
        selectedKey: _selectedNode,
      );
      setState(() {});
    });
    super.initState();
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

                            /// add children into node and update
                            _addChildrenNode(key);

                            /// update expand
                            _expandNode(
                              key,
                              expanded,
                            );
                          },
                          onNodeTap: (key) {
                            debugPrint('Selected: $key');
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
                          child:
                              _treeViewController.getNode(_selectedNode) == null
                                  ? null
                                  : _treeViewController
                                      .getNode(_selectedNode)!
                                      .subview,
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

  _addChildrenNode(String key) {
    debugPrint("_addNode: $key ");

    dirEntryChildren = DirEntry(
      parentPath: key,
      currentPath: '',
    );

    /// get data of children
    dirEntryChildren.getDirStrList(dirEntryChildren).then((value) {
      _dirChildren.addEntries(
        {
          dirEntryChildren.absolutelyCurrentPath: [
            ...dirEntryChildren.listStrNameCurrentDirs.map((dir) {
              return Node(
                label: dir,
                key: "${dirEntryChildren.absolutelyCurrentPath}/$dir",
                expanded: docsOpen,
                icon: docsOpen ? Icons.folder_open : Icons.folder,
                children: [],
                parent: true,
              );
            }).toList(),
            ...dirEntryChildren.listStrNameCurrentFiles!.map(
              (file) {
                return Node(
                  label: file,
                  key: "${dirEntryChildren.absolutelyCurrentPath}/$file",
                  iconColor: Colors.green.shade300,
                  selectedIconColor: Colors.white,
                  icon: Icons.insert_drive_file,
                  subview: const Text("this is preview of widget"),
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

      Node? node = _treeViewController.getNode(key);
      node!.children = _dirChildren[key] ?? [];
      debugPrint("_addNode().node: $node");

      List<Node> added;

      added = _treeViewController.updateNode(
        key,
        node.copyWith(),
      );
      debugPrint("added children: $added");
      // debugPrint("added _nodes1: $_nodes1");

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
