///
/// File: \lib\src\views\search_view.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Sunday, 2023-02-19 9:28:52 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-20 1:28:11 am
/// Modified By: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Copyright (c) 2023
/// -----
/// HISTORY:
/// Date      	By	Comments
/// ----------	---	---------------------------------------------------------
///

import 'package:flutter/material.dart';
import 'package:flutter_demo_previewer/src/models/widget.dart';
import 'package:flutter_demo_previewer/src/variables.dart';
import 'package:flutter_demo_previewer/tools/dir/widget.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SearchModel(),
      child: Consumer<SearchModel>(
        builder: (context, model, child) => Positioned(
          left: model.position.dx,
          top: model.position.dy,
          child: GestureDetector(
            onPanUpdate: (details) =>
                model.movingBox(details, MediaQuery.of(context).size),
            child: Column(children: [
              Row(
                children: [
                  // Search bar
                  AnimatedContainer(
                    curve: Curves.easeInCubic,
                    duration: const Duration(milliseconds: 200),
                    width: model.showSearchBar ? 300 : 0,
                    child: TextField(
                      onChanged: (txt) {
                        // model.strSearch = txt,
                        getMatchResult(model, txt);
                      },
                    ),
                  ),
                  // TODO: put search view always on the top!
                  // Search button
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () async {
                      debugPrint('search tapped!');
                      debugPrint(model.showSearchResult.toString());
                      model.searchMatchedResult.clear();
                      model.showSearchBar = !model.showSearchBar;
                      if (model.showSearchBar) {
                        model.searchResult = await searchHelper(previewPath);
                      }
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
              // Search result
              Builder(
                builder: (context) {
                  if (model.showSearchResult && model.showSearchBar) {
                    return SizedBox(
                      height: 300,
                      width: 300,
                      child: ListView(
                        children: model.searchMatchedResult
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
                  }
                  return Container();
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void getMatchResult(SearchModel model, String txt) {
    model.searchMatchedResult.clear();
    for (var e in model.searchResult) {
      if (e.contains(txt)) {
        model.searchMatchedResult.add(e);
      }
    }
    if (txt.isEmpty) {
      model.searchMatchedResult.clear();
    }
    model.showSearchResult = model.searchMatchedResult.isNotEmpty;
  }
}
