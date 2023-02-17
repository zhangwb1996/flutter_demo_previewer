import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [bottom_navigation_bar_preview2.dart] with [fileName]
class BottomNavigationBarPreview2Builder extends JsonWidgetBuilder {
  const BottomNavigationBarPreview2Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'bottom_navigation_bar_preview2.dart';

  static BottomNavigationBarPreview2Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const BottomNavigationBarPreview2Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const BottomNavigationBarPreview2();
  }
}
