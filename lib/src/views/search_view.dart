///
/// File: \lib\src\views\search_view.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Sunday, 2023-02-19 9:28:52 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-20 3:29:07 pm
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
import 'package:provider/provider.dart';

import '../flag.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SearchModel(),
      // TODO: Need to be improved
      child: Selector<SearchModel, Offset>(
        selector: (p0, p1) => p1.position,
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
            // TODO: click and navigate by result entity
            // Search result
            if (!model.showSearchBar || model.strSearch.isEmpty)
              Container()
            else
              child!,
          ]),
          child: Selector<SearchModel, String>(
            selector: (_, p1) => p1.strSearch,
            builder: (context, txt, child) {
              return FutureBuilder<List<String>>(
                future: getMatchResult(txt),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    child = SizedBox(
                      height: 300,
                      width: 300,
                      child: ListView(
                        children: snapshot.data!
                            .map((e) => Column(
                                  children: [
                                    // TODO: highlight matched string
                                    Text(
                                      e,
                                      // style: ,
                                    ),
                                    const Divider(),
                                  ],
                                ))
                            .toList(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    child = const Text("match none ");
                  } else {
                    child = const CircularProgressIndicator();
                  }
                  return child ?? Container();
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<List<String>> getMatchResult(String txt) async {
    List<String> temp = [];
    debugPrint('getMatchResult');
    if (!searching) {
      // model.searchMatchedResult.clear();
      for (var e in await searchHelper(searchPath).whenComplete(() {
        searching = false;
      })) {
        if (e.contains(txt)) {
          temp.add(e);
        }
      }
    }
    return temp;
  }
}
