import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [snack_bar_preview1.dart] with [fileName]
class SnackBarPreview1Builder extends JsonWidgetBuilder {
  const SnackBarPreview1Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'snack_bar_preview1.dart';

  static SnackBarPreview1Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const SnackBarPreview1Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const SnackBarPreview1();
  }
}
