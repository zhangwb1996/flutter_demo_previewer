import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:tree/src/bottom_navigation_bar.dart';
import 'package:tree/src/src.dart';
import 'package:child_builder/child_builder.dart';

class BottomNavigationBarExampleBuilder extends JsonWidgetBuilder {
  const BottomNavigationBarExampleBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'BottomNavigationBarExample';

  static BottomNavigationBarExampleBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    BottomNavigationBarExampleBuilder result =
        const BottomNavigationBarExampleBuilder();

    return result;
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      '[SvgBuilder] does not support children.',
    );

    return const BottomNavigationBarExample();
  }
}

// class SvgSchema {
//   static final schema = {
//     'title': 'SvgBuilder',
//     'type': 'object',
//     'additionalProperties': false,
//   };
// }
