import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [default_text_style_transition_preview.dart] with [fileName]
class DefaultTextStyleTransitionPreviewBuilder extends JsonWidgetBuilder {
  const DefaultTextStyleTransitionPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'default_text_style_transition_preview.dart';

  static DefaultTextStyleTransitionPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const DefaultTextStyleTransitionPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const DefaultTextStyleTransitionPreview();
  }
}
