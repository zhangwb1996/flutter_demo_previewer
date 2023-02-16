import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [animated_builder_preview.dart] with [fileName]
class AnimatedBuilderPreviewBuilder extends JsonWidgetBuilder {
  const AnimatedBuilderPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'animated_builder_preview.dart';

  static AnimatedBuilderPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AnimatedBuilderPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AnimatedBuilderPreview();
  }
}
