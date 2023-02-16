import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [sliver_animated_opacity.dart] with [fileName]
class SliverAnimatedOpacityPreviewBuilder extends JsonWidgetBuilder {
  const SliverAnimatedOpacityPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'sliver_animated_opacity.dart';

  static SliverAnimatedOpacityPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const SliverAnimatedOpacityPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const SliverAnimatedOpacityPreview();
  }
}
