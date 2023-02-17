import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [outline_button_preview.dart] with [fileName]
class OutlinedButtonPreviewBuilder extends JsonWidgetBuilder {
  const OutlinedButtonPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'outline_button_preview.dart';

  static OutlinedButtonPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const OutlinedButtonPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const OutlinedButtonPreview();
  }
}
