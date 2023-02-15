import 'file:C:/Users/12700/Documents/FlutterProjects/Src/widget_design/lib/src/views/animation_and_motion/animated_container_view.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
/// replace  '[Json2widgetTemp]' with [className]
/// replace  [animated_container_view.dart] with [fileName]
class AnimatedContainerViewBuilder extends JsonWidgetBuilder {
  const AnimatedContainerViewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'animated_container_view.dart';

  static AnimatedContainerViewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AnimatedContainerViewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AnimatedContainerView();
  }
}
