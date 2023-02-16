import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

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
