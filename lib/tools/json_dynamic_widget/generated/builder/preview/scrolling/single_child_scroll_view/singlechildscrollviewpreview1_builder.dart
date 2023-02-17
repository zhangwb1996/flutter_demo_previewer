import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [single_child_scroll_view_preview1.dart] with [fileName]
class SingleChildScrollViewPreview1Builder extends JsonWidgetBuilder {
  const SingleChildScrollViewPreview1Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'single_child_scroll_view_preview1.dart';

  static SingleChildScrollViewPreview1Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const SingleChildScrollViewPreview1Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const SingleChildScrollViewPreview1();
  }
}
