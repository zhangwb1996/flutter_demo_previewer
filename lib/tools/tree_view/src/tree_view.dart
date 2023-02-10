///
/// File: \lib\tools\tree_view\src\tree_view.dart
/// Project: flutter_demo_previewer
///
/// Created Date: Thursday, 2023-02-02 11:14:33 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-06 12:54:47 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'package:flutter/material.dart';
import 'package:flutter_demo_previewer/tools/tree_view/src/models/base/node_base.dart';

import 'tree_view_controller.dart';
import 'tree_view_theme.dart';
import 'tree_node.dart';

/// Defines the [TreeView] widget.
///
/// This is the main widget for the package. It requires a controller
/// and allows you to specify other optional properties that manages
/// the appearance and handle events.
///
/// ```dart
/// TreeView(
///   controller: _treeViewController,
///   allowParentSelect: false,
///   supportParentDoubleTap: false,
///   onExpansionChanged: _expandNodeHandler,
///   onNodeTap: (key) {
///     setState(() {
///       _treeViewController = _treeViewController.copyWith(selectedKey: key);
///     });
///   },
///   theme: treeViewTheme
/// ),
/// ```
class TreeView extends InheritedWidget {
  /// The controller for the [TreeView]. It manages the data and selected key.
  final TreeViewController controller;

  /// The tap handler for a node. Passes the node key.
  final Function(String)? onNodeTap;

  /// Custom builder for nodes. Parameters are the build context and tree node.
  final Widget Function(BuildContext, NodeBase)? nodeBuilder;

  /// The double tap handler for a node. Passes the node key.
  final Function(String)? onNodeDoubleTap;

  /// [onSubmitted] for an editable node . Parameters are key and text inputted
  final Function(String, String)? onSubmitted;

  /// The expand/collapse handler for a node. Passes the node key and the
  /// expansion state.
  final Function(String, bool)? onExpansionChanged;

  /// The theme for [TreeView].
  final TreeViewTheme theme;

  /// Determines whether the user can select a parent node. If false,
  /// tapping the parent will expand or collapse the node. If true, the node
  /// will be selected and the use has to use the expander to expand or
  /// collapse the node.
  final bool allowParentSelect;

  /// How the [TreeView] should respond to user input.
  final ScrollPhysics? physics;

  /// Whether the extent of the [TreeView] should be determined by the contents
  /// being viewed.
  ///
  /// Defaults to false.
  final bool shrinkWrap;

  /// Whether the [TreeView] is the primary scroll widget associated with the
  /// parent PrimaryScrollController..
  ///
  /// Defaults to true.
  final bool primary;

  /// Determines whether the parent node can receive a double tap. This is
  /// useful if [allowParentSelect] is true. This allows the user to double tap
  /// the parent node to expand or collapse the parent when [allowParentSelect]
  /// is true.
  /// ___IMPORTANT___
  /// _When true, the tap handler is delayed. This is because the double tap
  /// action requires a short delay to determine whether the user is attempting
  /// a single or double tap._
  final bool supportParentDoubleTap;

  TreeView({
    Key? key,
    required this.controller,
    this.onNodeTap,
    this.onNodeDoubleTap,
    this.onSubmitted,
    this.physics,
    this.onExpansionChanged,
    this.allowParentSelect = false,
    this.supportParentDoubleTap = false,
    this.shrinkWrap = false,
    this.primary = true,
    this.nodeBuilder,
    TreeViewTheme? theme,
  })  : theme = theme ?? const TreeViewTheme(),
        super(
          key: key,
          child: Builder(builder: (context) {
            return _TreeViewData(
              controller,
              shrinkWrap: shrinkWrap,
              primary: primary,
              physics: physics,
            );
          }),
        );

  static TreeView? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: TreeView);

  @override
  bool updateShouldNotify(TreeView oldWidget) {
    return oldWidget.controller.children != controller.children ||
        oldWidget.onNodeTap != onNodeTap ||
        oldWidget.onExpansionChanged != onExpansionChanged ||
        oldWidget.theme != theme ||
        oldWidget.supportParentDoubleTap != supportParentDoubleTap ||
        oldWidget.onSubmitted != onSubmitted ||
        // oldWidget.onNodeDoubleTap != onNodeDoubleTap ||
        oldWidget.allowParentSelect != allowParentSelect;
  }
}

class _TreeViewData extends StatelessWidget {
  final TreeViewController _controller;
  final bool? shrinkWrap;
  final bool? primary;
  final ScrollPhysics? physics;

  const _TreeViewData(this._controller,
      {this.shrinkWrap, this.primary, this.physics});

  @override
  Widget build(BuildContext context) {
    ThemeData parentTheme = Theme.of(context);
    return Theme(
      data: parentTheme,
      child: ListView(
        shrinkWrap: shrinkWrap!,
        primary: primary,
        physics: physics,
        padding: EdgeInsets.zero,
        children: _controller.children.map((node) {
          return TreeNode(node: node);
        }).toList(),
      ),
    );
  }
}
