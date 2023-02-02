import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:tree/src/src.dart';
import 'package:child_builder/child_builder.dart';

class AppBarExampleBuilder extends JsonWidgetBuilder {
  const AppBarExampleBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'AppBarExample';

  static AppBarExampleBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    AppBarExampleBuilder result = const AppBarExampleBuilder();

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

    return const AppBarExample();
  }
}

// class SvgSchema {
//   static final schema = {
//     'title': 'SvgBuilder',
//     'type': 'object',
//     'additionalProperties': false,
//   };
// }
