///
/// File: \lib\src\views\search_view.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Sunday, 2023-02-19 9:28:52 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-20 3:00:05 pm
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
      child: Consumer<SearchModel>(
        builder: (context, model, child) => Positioned(
          left: model.position.dx,
          top: model.position.dy,
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
            child!,
          ]),
          // TODO: click and navigate by result entity
          // Search result
          child: Consumer<SearchModel>(
            builder: (context, model, child) => !model.showSearchBar ||
                    model.strSearch.isEmpty
                ? Container()
                : FutureBuilder<List<String>>(
                    future: getMatchResult(model, model.strSearch),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        child = SizedBox(
                          height: 300,
                          width: 300,
                          child: Selector<SearchModel, List<String>>(
                            selector: (_, model) => model.searchMatchedResult,
                            builder: (context, matchedResult, _) {
                              return ListView(
                                children: matchedResult
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
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        child = const Text("match none ");
                      } else {
                        child = const CircularProgressIndicator();
                      }
                      return child ?? Container();
                    },
                  ),
            child: null,
          ),
        ),
      ),
    );
  }

  Future<List<String>> getMatchResult(SearchModel model, String txt) async {
    // if (!searching) {
    //   model.searchResult = await Isolate.run(() async {
    //     searching = true;
    //     return await searchHelper(searchPath).whenComplete(() {
    //       searching = false;
    //     });
    //   });
    // }
    // model.searchMatchedResult.clear();
    // for (var e in model.searchResult) {
    //   if (e.contains(txt)) {
    //     model.searchMatchedResult.add(e);
    //   }
    // }
    if (!searching) {
      model.searchMatchedResult.clear();
      for (var e in await searchHelper(searchPath).whenComplete(() {
        searching = false;
      })) {
        if (e.contains(txt)) {
          model.searchMatchedResult.add(e);
        }
      }
    }
    return model.searchMatchedResult;
  }
}
