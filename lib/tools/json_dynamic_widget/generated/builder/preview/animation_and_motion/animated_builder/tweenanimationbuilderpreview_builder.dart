import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [tween_animated_builder_preview.dart] with [fileName]
class TweenAnimationBuilderPreviewBuilder extends JsonWidgetBuilder {
  const TweenAnimationBuilderPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'tween_animated_builder_preview.dart';

  static TweenAnimationBuilderPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const TweenAnimationBuilderPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const TweenAnimationBuilderPreview();
  }
}
