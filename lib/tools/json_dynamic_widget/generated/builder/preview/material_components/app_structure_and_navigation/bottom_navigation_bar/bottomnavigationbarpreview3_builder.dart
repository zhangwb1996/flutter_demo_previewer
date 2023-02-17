import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [bottom_navigation_bar_preview3.dart] with [fileName]
class BottomNavigationBarPreview3Builder extends JsonWidgetBuilder {
  const BottomNavigationBarPreview3Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'bottom_navigation_bar_preview3.dart';

  static BottomNavigationBarPreview3Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const BottomNavigationBarPreview3Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const BottomNavigationBarPreview3();
  }
}
