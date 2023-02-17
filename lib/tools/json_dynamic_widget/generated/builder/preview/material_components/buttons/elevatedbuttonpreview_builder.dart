import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [elevated_button_preview.dart] with [fileName]
class ElevatedButtonPreviewBuilder extends JsonWidgetBuilder {
  const ElevatedButtonPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'elevated_button_preview.dart';

  static ElevatedButtonPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const ElevatedButtonPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const ElevatedButtonPreview();
  }
}
