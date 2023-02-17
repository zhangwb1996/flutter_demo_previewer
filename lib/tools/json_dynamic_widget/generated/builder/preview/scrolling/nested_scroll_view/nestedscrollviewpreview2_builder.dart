import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [nested_scroll_view_preview2.dart] with [fileName]
class NestedScrollViewPreview2Builder extends JsonWidgetBuilder {
  const NestedScrollViewPreview2Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'nested_scroll_view_preview2.dart';

  static NestedScrollViewPreview2Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const NestedScrollViewPreview2Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const NestedScrollViewPreview2();
  }
}
