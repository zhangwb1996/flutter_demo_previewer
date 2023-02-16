import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [ignore_pointer_preview.dart] with [fileName]
class IgnorePointerPreviewBuilder extends JsonWidgetBuilder {
  const IgnorePointerPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'ignore_pointer_preview.dart';

  static IgnorePointerPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const IgnorePointerPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const IgnorePointerPreview();
  }
}
