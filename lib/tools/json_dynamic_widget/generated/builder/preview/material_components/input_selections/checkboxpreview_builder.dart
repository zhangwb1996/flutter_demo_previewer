import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [checkbox_preview.dart] with [fileName]
class CheckboxPreviewBuilder extends JsonWidgetBuilder {
  const CheckboxPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'checkbox_preview.dart';

  static CheckboxPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CheckboxPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CheckboxPreview();
  }
}
