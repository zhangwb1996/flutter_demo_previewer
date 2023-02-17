import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [radio_preview.dart] with [fileName]
class RadioPreviewBuilder extends JsonWidgetBuilder {
  const RadioPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'radio_preview.dart';

  static RadioPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const RadioPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const RadioPreview();
  }
}
