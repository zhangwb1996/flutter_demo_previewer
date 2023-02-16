import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [animated_align_view.dart] with [fileName]
class AnimatedAlignViewBuilder extends JsonWidgetBuilder {
  const AnimatedAlignViewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'animated_align_view.dart';

  static AnimatedAlignViewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AnimatedAlignViewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AnimatedAlignView();
  }
}
