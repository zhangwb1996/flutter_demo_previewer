import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [navigation_rail_preview1.dart] with [fileName]
class NavigationRailPreview1Builder extends JsonWidgetBuilder {
  const NavigationRailPreview1Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'navigation_rail_preview1.dart';

  static NavigationRailPreview1Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const NavigationRailPreview1Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const NavigationRailPreview1();
  }
}
