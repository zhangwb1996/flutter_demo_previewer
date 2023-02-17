import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [appbar_preview3.dart] with [fileName]
class AppBarPreview3Builder extends JsonWidgetBuilder {
  const AppBarPreview3Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'appbar_preview3.dart';

  static AppBarPreview3Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AppBarPreview3Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AppBarPreview3();
  }
}
