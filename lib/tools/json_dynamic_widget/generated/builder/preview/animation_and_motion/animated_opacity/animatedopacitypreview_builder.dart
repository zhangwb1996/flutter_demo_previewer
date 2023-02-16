import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [animated_opacity_preview.dart] with [fileName]
class AnimatedOpacityPreviewBuilder extends JsonWidgetBuilder {
  const AnimatedOpacityPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'animated_opacity_preview.dart';

  static AnimatedOpacityPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AnimatedOpacityPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AnimatedOpacityPreview();
  }
}
