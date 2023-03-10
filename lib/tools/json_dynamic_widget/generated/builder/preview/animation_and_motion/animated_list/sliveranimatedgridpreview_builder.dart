import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [sliver_animated_grid_preview.dart] with [fileName]
class SliverAnimatedGridPreviewBuilder extends JsonWidgetBuilder {
  const SliverAnimatedGridPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'sliver_animated_grid_preview.dart';

  static SliverAnimatedGridPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const SliverAnimatedGridPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const SliverAnimatedGridPreview();
  }
}
