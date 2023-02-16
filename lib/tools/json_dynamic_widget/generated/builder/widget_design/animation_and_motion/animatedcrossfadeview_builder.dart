import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [animated_crossfade_view.dart] with [fileName]
class AnimatedCrossFadeViewBuilder extends JsonWidgetBuilder {
  const AnimatedCrossFadeViewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'animated_crossfade_view.dart';

  static AnimatedCrossFadeViewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AnimatedCrossFadeViewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AnimatedCrossFadeView();
  }
}
