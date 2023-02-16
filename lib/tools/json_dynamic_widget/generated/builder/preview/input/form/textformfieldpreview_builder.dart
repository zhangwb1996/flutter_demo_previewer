import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [text_form_field_preview.dart] with [fileName]
class TextFormFieldPreviewBuilder extends JsonWidgetBuilder {
  const TextFormFieldPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'text_form_field_preview.dart';

  static TextFormFieldPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const TextFormFieldPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const TextFormFieldPreview();
  }
}
