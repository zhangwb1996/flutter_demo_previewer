import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [animated_grid_preview.dart] with [fileName]
class AnimatedGridPreviewBuilder extends JsonWidgetBuilder {
  const AnimatedGridPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'animated_grid_preview.dart';

  static AnimatedGridPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AnimatedGridPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AnimatedGridPreview();
  }
}
