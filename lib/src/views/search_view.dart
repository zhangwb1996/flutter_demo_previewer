///
/// File: \lib\src\views\search_view.dart
/// Project: flutter_demo_previewer
/// -----
/// Created Date: Sunday, 2023-02-19 9:28:52 pm
/// Author: Wenbo Zhang (zhangwb1996@outlook.com)
/// -----
/// Last Modified: Wednesday, 2023-02-22 7:57:13 pm
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

import '../common.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SearchModel(),
      // [·]TODO: Need to be improved
      child: Selector<SearchModel, Offset>(
        selector: (_, m) => m.getPosition(MediaQuery.of(context).size),
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
                  curve: model.showSearchBar
                      ? Curves.easeInOutSine
                      : Curves.easeInOutSine,
                  duration: const Duration(milliseconds: 300),
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
                  child: InkWell(
                    child: MouseRegion(
                      onEnter: (event) => model.isHovered = true,
                      onExit: (event) => model.isHovered = false,
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            boxShadow: [
                              model.isHovered
                                  ? BoxShadow(
                                      blurRadius: 5,
                                      spreadRadius: 0.3,
                                      color: Colors.blue.shade600,
                                    )
                                  : BoxShadow(
                                      blurRadius: 1,
                                      spreadRadius: 0.1,
                                      color: Colors.blue.shade100,
                                    )
                            ],
                            shape: BoxShape.circle,
                            color: model.showSearchBar || model.isHovered
                                ? Colors.blue.shade400
                                : Colors.blue.shade100,
                          ),
                          child: Icon(
                            Icons.search,
                            color: model.showSearchBar || model.isHovered
                                ? Colors.white
                                : Colors.grey,
                            // weight: model.isHovered ? 8 : 1,
                          )),
                    ),
                  ),
                ),
              ],
            ),

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
                // Note: all word
                if (RegExp(r'\w+').allMatches(txt).isEmpty) {
                  return Container();
                }
                return FutureBuilder<List<String>>(
                  future: getMatchResult(txt),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      // [·]TODO: highlight matched string => RichText
                      // [ ]TODO: Opacity
                      return Container(
                        padding: const EdgeInsets.only(right: 40),
                        constraints: const BoxConstraints(
                          maxWidth: 340,
                          maxHeight: 300,
                        ),
                        child: Consumer<SearchHelperModel>(
                          builder: (context, node, child) =>
                              Builder(builder: (context) {
                            return ListView(
                              children: snapshot.data!
                                  .map(
                                    (e) => TextButton(
                                      style: ButtonStyle(
                                        // Note: The argument type 'EdgeInsets' can't be assigned to the
                                        // parameter type 'MaterialStateProperty<EdgeInsetsGeometry?>?'
                                        padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                            horizontal: 0.0,
                                          ),
                                        ),
                                      ),
                                      // [·]TODO: navigate by clicking result entity
                                      // [·]branch: pre-searching-navigation-01: if node existed, clicking will navigate to relative view
                                      onPressed: () {
                                        debugPrint("search result clicked");
                                        nodeParentTapped = false;
                                        node.selectedKey = pathSeparator(e);
                                      },
                                      child: Container(
                                          constraints: const BoxConstraints(
                                            maxWidth: 340,
                                            maxHeight: 20,
                                          ),
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
    // [·]TODO: Highlight 'AniM' in animation
    List<String> listTarget = [];
    Iterable<Match> matches =
        (RegExp(target, caseSensitive: false)).allMatches(origin, 0);
    for (Match m in matches) {
      listTarget.add(m[0]!);
    }

    List<String> temp = origin.split(RegExp(target, caseSensitive: false));
    int index = 0;
    for (var i = 0; i < temp.length; i++) {
      if (i % 2 == 1) {
        temp.insert(i, listTarget[index]);
        index++;
      } else {}
    }
    // Note: hide redundant string
    var listWidth = 48;
    if (temp[0].length + target.length + temp[2].indexOf("/") > listWidth) {
      index = temp[0].indexOf('/', temp[0].indexOf('/') + 1);
      temp[0] =
          temp[0].replaceRange(index + 1, temp[0].lastIndexOf("/"), '...');
    }
    index = 0;
    debugPrint("matchedRichText: listTarget: $listTarget");
    debugPrint("matchedRichText: origin: $temp");
    // Note: [target] is both end, where will add a null item
    // Note: Solved: textspan sometimes show blank instead of a whole string.
    // [·]TODO: hide redundant string
    return RichText(
      // textAlign: TextAlign.justify,
      overflow: TextOverflow.clip,
      softWrap: false,
      maxLines: 1,
      text: TextSpan(
        style: const TextStyle(color: Colors.blue),
        text: '',
        children: temp.map((e) {
          if (RegExp(target, caseSensitive: false).hasMatch(e)) {
            return TextSpan(
              text: e,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                backgroundColor: Colors.grey.shade300,
              ),
            );
          }
          return TextSpan(text: e);
        }).toList(),
      ),
    );
  }
}
