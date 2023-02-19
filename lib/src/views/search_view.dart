///
/// File: \lib\src\views\search_view.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Sunday, 2023-02-19 9:28:52 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Monday, 2023-02-20 12:39:17 am
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
            onPanUpdate: (details) => model.movingBox(details),
            child: Column(children: [
              Row(
                children: [
                  // Search bar
                  Builder(builder: (context) {
                    if (model.showSearchBar) {
                      return SizedBox(
                        width: 300,
                        child: TextField(
                          onChanged: (txt) {
                            // model.strSearch = txt,
                            model.searchMatchedResult.clear();
                            for (var e in model.searchResult) {
                              if (e.contains(txt)) {
                                model.searchMatchedResult.add(e);
                              }
                            }
                            model.showSearchResult =
                                model.searchMatchedResult.isNotEmpty;
                          },
                        ),
                      );
                    }
                    return Container();
                  }),
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
                            .map((e) => Text(e))
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
}
