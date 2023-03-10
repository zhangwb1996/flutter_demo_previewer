///
/// File: \lib\tools\tree_view\src\tree_node.dart
/// Project: flutter_demo_previewer
/// ----
/// Created Date: Thursday, 2023-02-02 11:14:33 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Wednesday, 2023-02-22 2:20:55 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_demo_previewer/tools/tree_view/src/models/node_workspace_editalbe.dart';

import 'models/widget.dart';
import 'tree_view.dart';
import 'tree_view_theme.dart';
import 'expander_theme_data.dart';

const double _kBorderWidth = 0.75;

/// Defines the [TreeNode] widget.
///
/// This widget is used to display a tree node and its children. It requires
/// a single [node] value. It uses this node to display the state of the
/// widget. It uses the [TreeViewTheme] to handle the appearance and the
/// [TreeView] properties to handle to user actions.
///
/// __This class should not be used directly!__
/// The [TreeView] and [TreeViewController] handlers the data and rendering
/// of the nodes.
class TreeNode<N extends NodeBase> extends StatefulWidget {
  /// The node object used to display the widget state
  final N node;

  const TreeNode({Key? key, required this.node}) : super(key: key);

  @override
  State<TreeNode> createState() => TreeNodeState();
}

class TreeNodeState extends State<TreeNode>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  late AnimationController _controller;
  late Animation<double> _heightFactor;
  bool _isExpanded = false;
  bool _showAddIconNodeWorksapceAdd = false;

  /// default: false
  // bool _editNodeWorksapce = false;
  // late TextEditingController _controllerTextEditing;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _heightFactor = _controller.drive(_easeInTween);

    switch (widget.node.runtimeType) {
      case NodeWorkspace:
        _isExpanded = (widget.node as NodeWorkspace).expanded;
        break;

      case NodeParent:
        _isExpanded = (widget.node as NodeParent).expanded;
        break;
      default:
        _isExpanded = false;
    }
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    TreeView? treeView = TreeView.of(context);
    _controller.duration = treeView!.theme.expandSpeed;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(TreeNode oldWidget) {
    switch (widget.node.runtimeType) {
      case NodeWorkspace:
        if ((widget.node as NodeWorkspace).expanded) {
          setState(() {
            _isExpanded = (widget.node as NodeWorkspace).expanded;
            if (_isExpanded) {
              _controller.forward();
            } else {
              _controller.reverse().then<void>((void value) {
                if (!mounted) return;
                setState(() {});
              });
            }
          });
        } else if (widget.node as NodeWorkspace != oldWidget.node) {
          setState(() {});
        }
        break;
      case NodeParent:
        if ((widget.node as NodeParent).expanded) {
          setState(() {
            _isExpanded = (widget.node as NodeParent).expanded;
            if (_isExpanded) {
              _controller.forward();
            } else {
              _controller.reverse().then<void>((void value) {
                if (!mounted) return;
                setState(() {});
              });
            }
          });
        } else if (widget.node as NodeParent != oldWidget.node) {
          setState(() {});
        }
        break;
      default:
        _isExpanded = false;
    }

    super.didUpdateWidget(oldWidget);
  }

  void _handleExpand() {
    TreeView? treeView = TreeView.of(context);
    assert(treeView != null, 'TreeView must exist in context');
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {});
        });
      }
    });
    if (treeView!.onExpansionChanged != null) {
      treeView.onExpansionChanged!(widget.node.key, _isExpanded);
    }
  }

  void _handleTap() {
    TreeView? treeView = TreeView.of(context);
    assert(treeView != null, 'TreeView must exist in context');
    if (treeView!.onNodeTap != null) {
      treeView.onNodeTap!(widget.node.key);
    }
  }

  void _handleDoubleTap() {
    TreeView? treeView = TreeView.of(context);
    assert(treeView != null, 'TreeView must exist in context');
    if (treeView!.onNodeDoubleTap != null) {
      treeView.onNodeDoubleTap!(widget.node.key);
    }
  }

  void _handleSubmitted(String str) {
    TreeView? treeView = TreeView.of(context);
    assert(treeView != null, 'TreeView must exist in context');
    if (treeView!.onSubmitted != null) {
      treeView.onSubmitted!(widget.node.key, str);
    }
  }

  void _handleAddingWorksapce() {
    TreeView? treeView = TreeView.of(context);
    assert(treeView != null, 'TreeView must exist in context');
    if (treeView!.onAddingWorksapce != null) {
      treeView.onAddingWorksapce!(widget.node.key);
    }
  }

  Widget _buildNodeExpander() {
    TreeView? treeView = TreeView.of(context);
    assert(treeView != null, 'TreeView must exist in context');
    TreeViewTheme theme = treeView!.theme;
    if (theme.expanderTheme.type == ExpanderType.none) return Container();
    switch (widget.node.runtimeType) {
      case NodeWorkspace:
        return GestureDetector(
          onTap: () => _handleExpand(),
          child: _TreeNodeExpander(
            speed: _controller.duration!,
            expanded: (widget.node as NodeWorkspace).expanded,
            themeData: theme.expanderTheme,
          ),
        );
      case NodeParent:
        return GestureDetector(
          onTap: () => _handleExpand(),
          child: _TreeNodeExpander(
            speed: _controller.duration!,
            expanded: (widget.node as NodeParent).expanded,
            themeData: theme.expanderTheme,
          ),
        );
      case NodeWorkspaceAdd:
        return Container();
      default:
        return Container(width: theme.expanderTheme.size);
    }
  }

  Widget _buildNodeIcon() {
    TreeView? treeView = TreeView.of(context);
    assert(treeView != null, 'TreeView must exist in context');
    TreeViewTheme theme = treeView!.theme;
    bool isSelected = treeView.controller.selectedKey == widget.node.key &&
        !treeView.controller.selectedKey.contains("workspace");
    return Container(
      alignment: Alignment.center,
      width:
          widget.node.hasIcon ? theme.iconTheme.size! + theme.iconPadding : 0,
      child: widget.node.hasIcon
          ? Icon(
              widget.node.icon,
              size: theme.iconTheme.size,
              color: isSelected
                  ? widget.node.selectedIconColor ?? theme.colorScheme.onPrimary
                  : widget.node.iconColor ?? theme.iconTheme.color,
            )
          : null,
    );
  }

  Widget _buildNodeLabel() {
    TreeView? treeView = TreeView.of(context);
    assert(treeView != null, 'TreeView must exist in context');
    TreeViewTheme theme = treeView!.theme;
    bool isSelected = treeView.controller.selectedKey == widget.node.key &&
        !treeView.controller.selectedKey.contains("workspace");
    final icon = _buildNodeIcon();
    switch (widget.node.runtimeType) {
      case NodeWorkspaceAdd:
        return Container(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // icon,
              Expanded(
                child: _nodeText(widget.node, theme, isSelected),
              ),
            ],
          ),
        );
      case NodeWorkspace:
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: theme.verticalSpacing ?? (theme.dense ? 10 : 15),
            horizontal: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // icon,
              Expanded(
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _nodeText(widget.node, theme, isSelected)),
                    SizedBox(
                      height: 20,
                      child: Builder(
                        builder: (context) {
                          if (!_showAddIconNodeWorksapceAdd) {
                            return Container();
                          }
                          return IconButton(
                            onPressed: () => {
                              debugPrint("add worksapce"),
                              _handleAddingWorksapce()
                            },
                            splashRadius: 20,
                            // iconSize: 20,
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.add_rounded,
                            ),
                          );
                        },
                        // )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      default:
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: theme.verticalSpacing ?? (theme.dense ? 10 : 15),
            horizontal: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              icon,
              Expanded(child: _nodeText(widget.node, theme, isSelected)),
            ],
          ),
        );
    }
  }

  Widget _nodeText(thisNode, TreeViewTheme theme, bool isSelected) {
    switch (thisNode.runtimeType) {
      case NodeWorkspace:
        // if (_editNodeWorksapce) {
        return Text(
          widget.node.label,
          softWrap: theme.parentLabelOverflow == null,
          overflow: theme.parentLabelOverflow,
          style: theme.parentLabelStyle.copyWith(
            fontWeight: theme.parentLabelStyle.fontWeight,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.parentLabelStyle.color,
          ),
        );
      // } else {
      //   _controllerTextEditing.text = widget.node.label;
      //   return TextField();
      // }

      case NodeParent:
        return Text(
          widget.node.label,
          softWrap: theme.parentLabelOverflow == null,
          overflow: theme.parentLabelOverflow,
          style: theme.parentLabelStyle.copyWith(
            fontWeight: theme.parentLabelStyle.fontWeight,
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.parentLabelStyle.color,
          ),
        );
      case NodeChild:
        return Text(
          widget.node.label,
          softWrap: theme.labelOverflow == null,
          overflow: theme.labelOverflow,
          style: theme.labelStyle.copyWith(
            fontWeight: theme.labelStyle.fontWeight,
            color: isSelected ? theme.colorScheme.onPrimary : null,
          ),
        );
      case NodeWorkspaceAdd:
        return
            // DecoratedBox(
            //   decoration: const BoxDecoration(
            //     boxShadow: <BoxShadow>[
            //       BoxShadow(
            //         color: Colors.white,
            //         offset: Offset(-2, 2),
            //         blurRadius: 1,
            //       ),
            //     ],
            //   ),
            //   child:
            Text(widget.node.label,
                textAlign: TextAlign.center,
                softWrap: theme.labelOverflow == null,
                overflow: theme.labelOverflow,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                )
                // style: theme.labelStyle.copyWith(
                //   fontWeight: theme.labelStyle.fontWeight,
                //   color: isSelected ? theme.colorScheme.onPrimary : null,
                // ),
                // ),
                );
      default:
        return const Text("error type node");
    }
  }

  Widget _buildNodeWidget() {
    TreeView? treeView = TreeView.of(context);
    assert(treeView != null, 'TreeView must exist in context');
    TreeViewTheme theme = treeView!.theme;
    bool isSelected = treeView.controller.selectedKey == widget.node.key &&
        !treeView.controller.selectedKey.contains("workspace");
    bool canSelectParent = treeView.allowParentSelect;
    final arrowContainer = _buildNodeExpander();
    final labelContainer = treeView.nodeBuilder != null
        ? treeView.nodeBuilder!(context, widget.node)
        : _buildNodeLabel();
    Widget tappable = treeView.onNodeDoubleTap != null
        ? InkWell(
            onTap: _handleTap,
            onDoubleTap: _handleDoubleTap,
            child: labelContainer,
          )
        : InkWell(
            onTap: _handleTap,
            child: labelContainer,
          );

    switch (widget.node.runtimeType) {
      case NodeWorkspaceAdd:
        isSelected = false;
        tappable = InkWell(
          onTap: _handleTap,
          child: labelContainer,
        );
        break;
      case NodeWorkspace:
        tappable = InkWell(
          onHover: (value) => setState(() {
            _showAddIconNodeWorksapceAdd = !_showAddIconNodeWorksapceAdd;
          }),
          onTap: _handleExpand,
          // onDoubleTap: _handleDoubleTap,
          child: labelContainer,
        );
        break;

      case NodeParent:
        if (treeView.supportParentDoubleTap && canSelectParent) {
          tappable = InkWell(
            onTap: canSelectParent ? _handleTap : _handleExpand,
            onDoubleTap: () {
              _handleExpand();
              _handleDoubleTap();
            },
            child: labelContainer,
          );
        } else if (treeView.supportParentDoubleTap) {
          tappable = InkWell(
            onTap: _handleExpand,
            onDoubleTap: _handleDoubleTap,
            child: labelContainer,
          );
        } else {
          tappable = InkWell(
            onTap: canSelectParent ? _handleTap : _handleExpand,
            child: labelContainer,
          );
        }
        break;
      case NodeChild:
        tappable = InkWell(
          onTap: _handleTap,
          child: labelContainer,
        );
        break;
      case NodeWorkspaceEditable:
        tappable = TextField(
          obscureText: false,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'worksapce',
          ),
          onSubmitted: (str) {
            if (str.isEmpty) {
              return;
            }
            _handleSubmitted(str);
          },
        );
        break;
      default:
    }
    return Container(
      color: isSelected ? theme.colorScheme.primary : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: theme.expanderTheme.position == ExpanderPosition.end
            ? <Widget>[
                Expanded(
                  child: tappable,
                ),
                arrowContainer,
              ]
            : <Widget>[
                arrowContainer,
                Expanded(
                  child: tappable,
                ),
              ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TreeView? treeView = TreeView.of(context);
    assert(treeView != null, 'TreeView must exist in context');
    // debugPrint(
    //     "tree_node.build() >> widget.node which key:  ${widget.node.key}; runtimeType: ${widget.node.runtimeType}");
    final nodeWidget = _buildNodeWidget();
    switch (widget.node.runtimeType) {
      case NodeWorkspace:
        final bool closed =
            (!_isExpanded || !(widget.node as NodeWorkspace).expanded) &&
                _controller.isDismissed;
        return AnimatedBuilder(
          animation: _controller.view,
          builder: (BuildContext context, Widget? child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                nodeWidget,
                ClipRect(
                  child: Align(
                    heightFactor: _heightFactor.value,
                    child: child,
                  ),
                ),
              ],
            );
          },
          child: closed
              ? null
              : Container(
                  margin: EdgeInsets.only(
                      left: treeView!.theme.horizontalSpacing ??
                          treeView.theme.iconTheme.size!),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          (widget.node as NodeWorkspace).children!.map((node) {
                        return TreeNode(node: node);
                      }).toList()),
                ),
        );
      case NodeParent:
        final bool closed =
            (!_isExpanded || !(widget.node as NodeParent).expanded) &&
                _controller.isDismissed;
        return AnimatedBuilder(
          animation: _controller.view,
          builder: (BuildContext context, Widget? child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                nodeWidget,
                ClipRect(
                  child: Align(
                    heightFactor: _heightFactor.value,
                    child: child,
                  ),
                ),
              ],
            );
          },
          child: closed
              ? null
              : Container(
                  margin: EdgeInsets.only(
                      left: treeView!.theme.horizontalSpacing ??
                          treeView.theme.iconTheme.size!),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: (widget.node as NodeParent).children!.map((node) {
                      return TreeNode(node: node);
                    }).toList(),
                  ),
                ),
        );
      case NodeChild:
      case NodeWorkspaceAdd:
      default:
        return Container(
          child: nodeWidget,
        );
    }
  }
}

class _TreeNodeExpander extends StatefulWidget {
  final ExpanderThemeData themeData;
  final bool expanded;
  final Duration _expandSpeed;

  const _TreeNodeExpander({
    required Duration speed,
    required this.themeData,
    required this.expanded,
  }) : _expandSpeed = speed;

  @override
  _TreeNodeExpanderState createState() => _TreeNodeExpanderState();
}

class _TreeNodeExpanderState extends State<_TreeNodeExpander>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    bool isEnd = widget.themeData.position == ExpanderPosition.end;
    if (widget.themeData.type != ExpanderType.plusMinus) {
      controller = AnimationController(
        duration: widget.themeData.animated
            ? isEnd
                ? widget._expandSpeed * 0.625
                : widget._expandSpeed
            : const Duration(milliseconds: 0),
        vsync: this,
      );
      animation = Tween<double>(
        begin: 0,
        end: isEnd ? 180 : 90,
      ).animate(controller);
    } else {
      controller = AnimationController(
          duration: const Duration(milliseconds: 0), vsync: this);
      animation = Tween<double>(begin: 0, end: 0).animate(controller);
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(_TreeNodeExpander oldWidget) {
    if (widget.themeData != oldWidget.themeData ||
        widget.expanded != oldWidget.expanded) {
      bool isEnd = widget.themeData.position == ExpanderPosition.end;
      setState(() {
        if (widget.themeData.type != ExpanderType.plusMinus) {
          controller.duration = widget.themeData.animated
              ? isEnd
                  ? widget._expandSpeed * 0.625
                  : widget._expandSpeed
              : const Duration(milliseconds: 0);
          animation = Tween<double>(
            begin: 0,
            end: isEnd ? 180 : 90,
          ).animate(controller);
        } else {
          controller.duration = const Duration(milliseconds: 0);
          animation = Tween<double>(begin: 0, end: 0).animate(controller);
        }
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  Color? _onColor(Color? color) {
    if (color != null) {
      if (color.computeLuminance() > 0.6) {
        return Colors.black;
      } else {
        return Colors.white;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    IconData arrow;
    double iconSize = widget.themeData.size;
    double borderWidth = 0;
    BoxShape shapeBorder = BoxShape.rectangle;
    Color backColor = Colors.transparent;
    Color? iconColor =
        widget.themeData.color ?? Theme.of(context).iconTheme.color;
    switch (widget.themeData.modifier) {
      case ExpanderModifier.none:
        break;
      case ExpanderModifier.circleFilled:
        shapeBorder = BoxShape.circle;
        backColor = widget.themeData.color ?? Colors.black;
        iconColor = _onColor(backColor);
        break;
      case ExpanderModifier.circleOutlined:
        borderWidth = _kBorderWidth;
        shapeBorder = BoxShape.circle;
        break;
      case ExpanderModifier.squareFilled:
        backColor = widget.themeData.color ?? Colors.black;
        iconColor = _onColor(backColor);
        break;
      case ExpanderModifier.squareOutlined:
        borderWidth = _kBorderWidth;
        break;
    }
    switch (widget.themeData.type) {
      case ExpanderType.chevron:
        arrow = Icons.expand_more;
        break;
      case ExpanderType.arrow:
        arrow = Icons.arrow_downward;
        iconSize = widget.themeData.size > 20
            ? widget.themeData.size - 8
            : widget.themeData.size;
        break;
      case ExpanderType.none:
      case ExpanderType.caret:
        arrow = Icons.arrow_drop_down;
        break;
      case ExpanderType.plusMinus:
        arrow = widget.expanded ? Icons.remove : Icons.add;
        break;
    }

    Icon icon = Icon(
      arrow,
      size: iconSize,
      color: iconColor,
    );

    if (widget.expanded) {
      controller.reverse();
    } else {
      controller.forward();
    }
    return Container(
      width: widget.themeData.size + 2,
      height: widget.themeData.size + 2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: shapeBorder,
        border: borderWidth == 0
            ? null
            : Border.all(
                width: borderWidth,
                color: widget.themeData.color ?? Colors.black,
              ),
        color: backColor,
      ),
      child: AnimatedBuilder(
        animation: controller,
        child: icon,
        builder: (context, child) {
          return Transform.rotate(
            angle: animation.value * (-pi / 180),
            child: child,
          );
        },
      ),
    );
  }
}
