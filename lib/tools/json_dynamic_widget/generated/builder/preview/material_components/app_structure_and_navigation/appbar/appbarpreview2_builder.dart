import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [appbar_preview2.dart] with [fileName]
class AppBarPreview2Builder extends JsonWidgetBuilder {
  const AppBarPreview2Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'appbar_preview2.dart';

  static AppBarPreview2Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AppBarPreview2Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AppBarPreview2();
  }
}
