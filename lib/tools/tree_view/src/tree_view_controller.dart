///
/// File: \lib\tools\tree_view\src\tree_view_controller.dart
/// Project: flutter_demo_previewer
///
/// Created Date: Thursday, 2023-02-02 11:14:33 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-06 12:56:45 pm
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:flutter/widgets.dart';
import 'package:flutter_demo_previewer/tools/tree_view/flutter_treeview.dart';
import 'models/widget.dart';

/// Defines the insertion mode adding a new [Node] to the [TreeView].
enum InsertMode {
  prepend,
  append,
  insert,
}

/// Defines the controller needed to display the [TreeView].
///
/// Used by [TreeView] to display the nodes and selected node.
///
/// This class also defines methods used to manipulate data in
/// the [TreeView]. The methods ([addNode], [updateNode],
/// and [deleteNode]) are non-mutilating, meaning they will not
/// modify the tree but instead they will return a mutilated
/// copy of the data. You can then use your own logic to appropriately
/// update the [TreeView]. e.g.
///
/// ```dart
/// TreeViewController controller = TreeViewController(children: nodes);
/// Node node = controller.getNode('unique_key')!;
/// Node updatedNode = node.copyWith(
///   key: 'another_unique_key',
///   label: 'Another Node',
/// );
/// List<Node> newChildren = controller.updateNode(node.key, updatedNode);
/// controller = TreeViewController(children: newChildren);
/// ```
class TreeViewController<N extends NodeBase> {
  /// The data for the [TreeView].
  final List<N> children;

  /// The key of the select node in the [TreeView].
  final String? selectedKey;

  TreeViewController({
    this.children = const [],
    this.selectedKey,
  });

  /// Creates a copy of this controller but with the given fields
  /// replaced with the new values.
  TreeViewController copyWith<T>(
      {List<NodeBase<T>>? children, String? selectedKey}) {
    return TreeViewController(
      children: children ?? this.children,
      selectedKey: selectedKey ?? this.selectedKey,
    );
  }

  /// Loads this controller with data from a JSON String
  /// This method expects the user to properly update the state
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.loadJSON(json: jsonString);
  /// });
  /// ```
  TreeViewController loadJSON<T>({String json = '[]'}) {
    List jsonList = jsonDecode(json);
    List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(jsonList);
    return loadMap<T>(list: list);
  }

  /// Loads this controller with data from a Map.
  /// This method expects the user to properly update the state
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.loadMap(map: dataMap);
  /// });
  /// ```
  TreeViewController loadMap<T>({List<Map<String, dynamic>> list = const []}) {
    var treeData = list.map((Map<String, dynamic> item) {
      switch (item['nodeTpye']) {
        case 'NodeChild':
          return NodeChild.fromMap(item);
        case 'NodeParent':
          return NodeParent.fromMap(item);
        default:
          return const NodeError(key: "NodeError", label: "Node Error....");
      }
    }).toList();
    return TreeViewController(
      children: treeData,
      selectedKey: selectedKey,
    );
  }

  /// Adds a new node to an existing node identified by specified key.
  /// It returns a new controller with the new node added. This method
  /// expects the user to properly place this call so that the state is
  /// updated.
  ///
  /// See [TreeViewController.addNode] for info on optional parameters.
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withAddNode(key, newNode);
  /// });
  /// ```
  TreeViewController<NodeBase> withAddNode<T>(
    String key,
    N newNode, {
    N? parent,
    int? index,
    InsertMode mode = InsertMode.append,
  }) {
    List<NodeBase> data =
        addNode<T>(key, newNode, parent: parent, mode: mode, index: index);
    return TreeViewController(
      children: data,
      selectedKey: selectedKey,
    );
  }

  /// Replaces an existing node identified by specified key with a new node.
  /// It returns a new controller with the updated node replaced. This method
  /// expects the user to properly place this call so that the state is
  /// updated.
  ///
  /// See [TreeViewController.updateNode] for info on optional parameters.
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withUpdateNode(key, newNode);
  /// });
  /// ```
  TreeViewController withUpdateNode<T>(String key, N newNode, {N? parent}) {
    List<NodeBase> data = updateNode<T>(key, newNode, parent: parent);
    return TreeViewController(
      children: data,
      selectedKey: selectedKey,
    );
  }

  /// Removes an existing node identified by specified key.
  /// It returns a new controller with the node removed. This method
  /// expects the user to properly place this call so that the state is
  /// updated.
  ///
  /// See [TreeViewController.deleteNode] for info on optional parameters.
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withDeleteNode(key);
  /// });
  /// ```
  TreeViewController withDeleteNode<T>(String key, {N? parent}) {
    List<NodeBase> data = deleteNode<T>(key, parent: parent);
    return TreeViewController(
      children: data,
      selectedKey: selectedKey,
    );
  }

  /// Toggles the expanded property of an existing node identified by
  /// specified key. It returns a new controller with the node toggled.
  /// This method expects the user to properly place this call so
  /// that the state is updated.
  ///
  /// See [TreeViewController.toggleNode] for info on optional parameters.
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withToggleNode(key, newNode);
  /// });
  /// ```
  TreeViewController withToggleNode<T>(String key, {N? parent}) {
    List<NodeBase> data = toggleNode<T>(key, parent: parent);
    return TreeViewController(
      children: data,
      selectedKey: selectedKey,
    );
  }

  /// Expands all nodes down to Node identified by specified key.
  /// It returns a new controller with the nodes expanded.
  /// This method expects the user to properly place this call so
  /// that the state is updated.
  ///
  /// Internally uses [TreeViewController.expandToNode].
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withExpandToNode(key, newNode);
  /// });
  /// ```
  TreeViewController withExpandToNode(String key) {
    List<NodeBase> data = expandToNode(key);
    return TreeViewController(
      children: data,
      selectedKey: selectedKey,
    );
  }

  /// Collapses all nodes down to Node identified by specified key.
  /// It returns a new controller with the nodes collapsed.
  /// This method expects the user to properly place this call so
  /// that the state is updated.
  ///
  /// Internally uses [TreeViewController.collapseToNode].
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withCollapseToNode(key, newNode);
  /// });
  /// ```
  TreeViewController withCollapseToNode(String key) {
    List<NodeBase> data = collapseToNode(key);
    return TreeViewController(
      children: data,
      selectedKey: selectedKey,
    );
  }

  /// Expands all nodes down to parent Node.
  /// It returns a new controller with the nodes expanded.
  /// This method expects the user to properly place this call so
  /// that the state is updated.
  ///
  /// Internally uses [TreeViewController.expandAll].
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withExpandAll();
  /// });
  /// ```
  TreeViewController withExpandAll({N? parent}) {
    List<NodeBase> data = expandAll(parent: parent)!;
    return TreeViewController(
      children: data,
      selectedKey: selectedKey,
    );
  }

  /// Collapses all nodes down to parent Node.
  /// It returns a new controller with the nodes collapsed.
  /// This method expects the user to properly place this call so
  /// that the state is updated.
  ///
  /// Internally uses [TreeViewController.collapseAll].
  ///
  /// ```dart
  /// setState((){
  ///   controller = controller.withCollapseAll();
  /// });
  /// ```
  TreeViewController withCollapseAll({N? parent}) {
    List<NodeBase> data = collapseAll(parent: parent);
    return TreeViewController(
      children: data,
      selectedKey: selectedKey,
    );
  }

  /// Gets the node that has a key value equal to the specified key.
  N? getNode<T>(String? key, {N? parent}) {
    N? found;
    Iterator? nodes;
    switch (parent.runtimeType) {
      case NodeWorkspace:
        nodes = parent == null
            ? children.iterator
            : (parent as NodeWorkspace).children?.iterator;
        break;
      case NodeParent:
        nodes = parent == null
            ? children.iterator
            : (parent as NodeParent).children?.iterator;
        break;
      default:
        nodes = children.iterator;
    }
    nodes ??= children.iterator;

    while (nodes.moveNext()) {
      N child = nodes.current;
      if (child.key == key) {
        //   switch (child.nodeType) {
        //     case 'NodeParent':
        //       found = child;
        //       break;
        //     case 'NodeChild':
        //       found = child;
        //       break;
        //     default:
        //     // found = child as NodeError;
        //   }
        found = child;
        break;
      } else {
        if (child.nodeType == 'NodeParent') {
          found = getNode(key, parent: child);
          if (found != null) {
            break;
          }
        }
      }
    }
    return found;
  }

  /// Expands all node that are children of the parent node parameter. If no parent is passed, uses the root node as the parent.
  List<NodeBase>? expandAll({NodeBase? parent}) {
    List<NodeBase> children = [];
    Iterator iter = parent == null
        ? children.iterator
        : (parent as NodeParent).children!.iterator;
    while (iter.moveNext()) {
      NodeBase? child = iter.current;
      if (child!.nodeType == 'NodeParent') {
        children.add((child as NodeParent).copyWith(
          expanded: true,
          children: expandAll(parent: child),
        ));
      } else {
        children.add(child);
      }
    }
    return children;
  }

  /// Collapses all node that are children of the parent node parameter. If no parent is passed, uses the root node as the parent.
  List<NodeBase> collapseAll({NodeBase? parent}) {
    List<NodeBase> children = [];
    Iterator iter = parent == null
        ? children.iterator
        : (parent as NodeParent).children!.iterator;
    while (iter.moveNext()) {
      NodeBase? child = iter.current;
      if (child!.nodeType == 'NodeParent') {
        children.add((child as NodeParent).copyWith(
          expanded: false,
          children: expandAll(parent: child),
        ));
      } else {
        children.add(child);
      }
    }
    return children;
  }

  /// Gets the parent of the node identified by specified key.
  N? getParent<T>(String key, {N? parent}) {
    N? found;
    Iterator iter = parent == null
        ? children.iterator
        : (parent as NodeParent).children!.iterator;

    while (iter.moveNext()) {
      N child = iter.current;
      if (child.key == key) {
        found = parent ?? child;
        break;
      } else {
        if (child.nodeType == 'NodeParent') {
          found = getParent<T>(key, parent: child);
          if (found != null) {
            break;
          }
        }
      }
    }
    return found;
  }

  /// Expands a node and all of the node's ancestors so that the node is
  /// visible without the need to manually expand each node.
  List<NodeBase> expandToNode(String key) {
    List<String> ancestors = [];
    String currentKey = key;

    ancestors.add(currentKey);

    N? parent = getParent(currentKey);
    if (parent != null) {
      while (parent!.key != currentKey) {
        currentKey = parent.key;
        ancestors.add(currentKey);
        parent = getParent(currentKey);
      }
      TreeViewController tvCtrl = this;
      for (var k in ancestors) {
        NodeBase? node = tvCtrl.getNode(k);
        var updated;
        if (node.runtimeType == NodeParent) {
          updated = (node as NodeParent).copyWith(expanded: true);
        }
        tvCtrl = tvCtrl.withUpdateNode(k, updated);
      }
      return tvCtrl.children;
    }
    return children;
  }

  /// Collapses a node and all of the node's ancestors without the need to
  /// manually collapse each node.
  List<NodeBase> collapseToNode(String key) {
    List<String> ancestors = [];
    String currentKey = key;

    ancestors.add(currentKey);

    NodeBase? parent = getParent(currentKey);
    if (parent != null) {
      while (parent!.key != currentKey) {
        currentKey = parent.key;
        ancestors.add(currentKey);
        parent = getParent(currentKey);
      }
      TreeViewController tvCtrl = this;
      for (var k in ancestors) {
        NodeBase? node = tvCtrl.getNode(k);
        var updated;
        if (node.runtimeType == NodeParent) {
          updated = (node as NodeParent).copyWith(expanded: true);
        }
        tvCtrl = tvCtrl.withUpdateNode(k, updated);
      }
      return tvCtrl.children;
    }
    return children;
  }

  /// Adds a new node to an existing node identified by specified key. It optionally
  /// accepts an [InsertMode] and index. If no [InsertMode] is specified,
  /// it appends the new node as a child at the end. This method returns
  /// a new list with the added node.
  List<NodeBase> addNode<T>(
    String key,
    NodeBase newNode, {
    NodeBase? parent,
    int? index,
    InsertMode mode = InsertMode.append,
  }) {
    List<NodeBase> cunrentChildren =
        parent == null ? children : (parent as NodeParent).children!;
    return cunrentChildren.map((child) {
      if (child.key == key) {
        List<NodeBase> cunrentChildrenChildren =
            (child as NodeParent).children!.toList(growable: true);
        if (mode == InsertMode.prepend) {
          cunrentChildrenChildren.insert(0, newNode);
        } else if (mode == InsertMode.insert) {
          cunrentChildrenChildren.insert(
              index ?? cunrentChildrenChildren.length, newNode);
        } else {
          cunrentChildrenChildren.add(newNode);
        }
        return child.copyWith(children: cunrentChildrenChildren);
      } else {
        return (child as NodeParent).copyWith(
          children: addNode<T>(
            key,
            newNode,
            parent: child,
            mode: mode,
            index: index,
          ),
        );
      }
    }).toList();
  }

  /// Updates an existing node identified by specified key. This method
  /// returns a new list with the updated node.
  List<NodeBase> updateNode<T>(String key, NodeBase newNode,
      {NodeBase? parent}) {
    // switch (N.runtimeType) {
    //   case NodeWorkspace:
    //     break;
    //   case NodeParent:
    //     break;
    //   case NodeChild:
    //     break;
    //   default:
    // }

    List<NodeBase> currentChildren =
        parent == null ? children : (parent as NodeParent).children!;
    return currentChildren.map((child) {
      if (child.key == key) {
        return newNode;
      } else {
        if (child.nodeType == 'NodeParent') {
          return (child as NodeParent).copyWith(
            children: updateNode<NodeBase>(
              key,
              newNode,
              parent: child,
            ),
          );
        }
        return child;
      }
    }).toList();
  }

  /// Toggles an existing node identified by specified key. This method
  /// returns a new list with the specified node toggled.
  List<NodeBase> toggleNode<T>(String key, {N? parent}) {
    N? node = getNode<T>(key, parent: parent);
    return updateNode<T>(
        key,
        (node! as NodeParent)
            .copyWith(expanded: (node as NodeParent).expanded));
  }

  /// Deletes an existing node identified by specified key. This method
  /// returns a new list with the specified node removed.
  List<NodeBase> deleteNode<T>(String key, {NodeBase? parent}) {
    Iterator iter = parent == null
        ? children.iterator
        : (parent as NodeParent).children!.iterator;
    List<NodeBase> filteredChildren = [];
    while (iter.moveNext()) {
      NodeBase child = iter.current;
      if (child.key != key) {
        if (child.nodeType == 'NodeParent') {
          filteredChildren.add((child as NodeParent).copyWith(
            children: deleteNode<T>(key, parent: child),
          ));
        } else {
          filteredChildren.add(child);
        }
      }
    }
    return filteredChildren;
  }

  /// Get the current selected node. Returns null if there is no selectedKey
  N? get selectedNode {
    return selectedKey!.isEmpty ? null : getNode(selectedKey!);
  }

  /// Map representation of this object
  List<Map<String, dynamic>> get asMap {
    return children.map((NodeBase child) => child.asMap).toList();
  }

  @override
  String toString() {
    return jsonEncode(asMap);
  }

  /// get data form future
  getDataNode() {}
}
