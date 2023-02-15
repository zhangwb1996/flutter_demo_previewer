import 'file:C:/Users/12700/Documents/FlutterProjects/Src/widget_design/lib/src/preview/animation_and_motion/animated_list/sliver_animated_list_preview.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
/// replace  '[Json2widgetTemp]' with [className]
/// replace  [sliver_animated_list_preview.dart] with [fileName]
class SliverAnimatedListPreviewBuilder extends JsonWidgetBuilder {
  const SliverAnimatedListPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'sliver_animated_list_preview.dart';

  static SliverAnimatedListPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const SliverAnimatedListPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const SliverAnimatedListPreview();
  }
}
