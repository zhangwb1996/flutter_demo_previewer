import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [appbar_preview1.dart] with [fileName]
class AppBarPreview1Builder extends JsonWidgetBuilder {
  const AppBarPreview1Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'appbar_preview1.dart';

  static AppBarPreview1Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AppBarPreview1Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AppBarPreview1();
  }
}
