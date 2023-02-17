import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [scroll_bar_preview4.dart] with [fileName]
class ScrollbarPreview4Builder extends JsonWidgetBuilder {
  const ScrollbarPreview4Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'scroll_bar_preview4.dart';

  static ScrollbarPreview4Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const ScrollbarPreview4Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const ScrollbarPreview4();
  }
}
