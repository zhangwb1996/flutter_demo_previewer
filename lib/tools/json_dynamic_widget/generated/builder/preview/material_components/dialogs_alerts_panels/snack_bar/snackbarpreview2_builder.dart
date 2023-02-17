import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [snack_bar_preview2.dart] with [fileName]
class SnackBarPreview2Builder extends JsonWidgetBuilder {
  const SnackBarPreview2Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'snack_bar_preview2.dart';

  static SnackBarPreview2Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const SnackBarPreview2Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const SnackBarPreview2();
  }
}
