///
/// File: \lib\src\views\search_view.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Sunday, 2023-02-19 9:28:52 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Tuesday, 2023-02-21 12:40:25 am
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo_previewer/src/models/widget.dart';
import 'package:flutter_demo_previewer/tools/dir/widget.dart';
import 'package:flutter_demo_previewer/tools/tree_view/widget.dart';
import 'package:provider/provider.dart';

import '../flag.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SearchModel(),
      // [·]TODO: Need to be improved
      child: Selector<SearchModel, Offset>(
        selector: (_, m) => m.position,
        builder: (context, pos, child) => Positioned(
          left: pos.dx,
          top: pos.dy,
          child: child!,
        ),
        child: Consumer<SearchModel>(
          builder: (context, model, child) => Column(children: [
            Row(
              children: [
                // Search bar
                AnimatedContainer(
                  curve: Curves.easeInCubic,
                  duration: const Duration(milliseconds: 200),
                  width: model.showSearchBar ? 300 : 0,
                  child: TextField(
                    onChanged: (txt) {
                      model.strSearch = txt;
                    },
                  ),
                ),
                // Search button
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onPanUpdate: (details) =>
                      model.movingBox(details, MediaQuery.of(context).size),
                  onTap: () async {
                    debugPrint('search tapped!');
                    model.showSearchBar = !model.showSearchBar;
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                            color: Colors.grey)
                      ],
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
            // [ ]TODO: click and navigate by result entity
            // [ ]TODO: Opacity
            // Search result
            if (!model.showSearchBar || model.strSearch.isEmpty)
              Container()
            else
              child!,
          ]),
          child: SizedBox(
            child: Selector<SearchModel, String>(
              selector: (_, model) => model.strSearch,
              builder: (context, txt, child) {
                // all word
                if (RegExp(r'\w+').allMatches(txt).isEmpty) {
                  return Container();
                }
                return FutureBuilder<List<String>>(
                  future: getMatchResult(txt),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      // [ ]TODO: highlight matched string => RichText
                      return SizedBox(
                        width: 340,
                        height: 300,
                        child: Consumer<TreeViewController>(
                          builder: (context, node, child) =>
                              Builder(builder: (context) {
                            return ListView(
                              children: snapshot.data!
                                  .map(
                                    (e) => TextButton(
                                      onPressed: () => {
                                        debugPrint("search result clicked"),
                                        node.setSelectedKey = e
                                      },
                                      child: SizedBox(
                                          height: 20,
                                          width: 340,
                                          child: Builder(builder: (context) {
                                            return matchedRichText(e, txt);
                                          })),
                                    ),
                                  )
                                  .toList(),
                            );
                          }),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text("match none ");
                    } else {
                      if (searching) {
                        return const CircularProgressIndicator();
                      } else {
                        return const Text('no matched');
                      }
                    }
                  },
                );
              },
              child: null,
            ),
          ),
        ),
      ),
    );
  }

  Future<List<String>>? getMatchResult(String txt) async {
    List<String> temp = [];
    debugPrint('getMatchResult');
    if (!searching) {
      // model.searchMatchedResult.clear();
      for (var e in await searchHelper(searchPath).whenComplete(() {
        searching = false;
      })) {
        if (e.toLowerCase().contains(txt.toLowerCase())) {
          temp.add(e);
        }
      }
    }
    return temp;
  }

  /// [matchedRichText] will mark the **[target]**  which matched within **[origin]**
  Widget matchedRichText(String origin, String target) {
    List<String> temp = origin.split(target);

    for (var i = 0; i < temp.length; i++) {
      if (i % 2 == 1) {
        temp.insert(i, target);
      } else {}
    }
    // debugPrint("matchedRichText: $temp");
    // Note: [target] is both end, where will add a null item
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.blue),
        text: ' ',
        children: temp.map((e) {
          if (e == target) {
            return TextSpan(
              text: e,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  backgroundColor: Colors.grey.shade300,
                  overflow: TextOverflow.fade),
            );
          }
          return TextSpan(text: e);
        }).toList(),
      ),
    );
  }
}
