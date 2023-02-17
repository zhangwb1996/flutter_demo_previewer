import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [aspect_ratio_view.dart] with [fileName]
class AspectRatioViewBuilder extends JsonWidgetBuilder {
  const AspectRatioViewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'aspect_ratio_view.dart';

  static AspectRatioViewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AspectRatioViewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AspectRatioView();
  }
}
