import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [tooltip_preview3.dart] with [fileName]
class TooltipPreview3Builder extends JsonWidgetBuilder {
  const TooltipPreview3Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'tooltip_preview3.dart';

  static TooltipPreview3Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const TooltipPreview3Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const TooltipPreview3();
  }
}
