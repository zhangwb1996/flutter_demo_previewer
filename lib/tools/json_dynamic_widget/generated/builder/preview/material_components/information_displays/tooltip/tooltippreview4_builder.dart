import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [tooltip_preview4.dart] with [fileName]
class TooltipPreview4Builder extends JsonWidgetBuilder {
  const TooltipPreview4Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'tooltip_preview4.dart';

  static TooltipPreview4Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const TooltipPreview4Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const TooltipPreview4();
  }
}
