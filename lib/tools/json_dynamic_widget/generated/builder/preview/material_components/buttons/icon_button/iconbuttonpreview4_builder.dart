import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [icon_button_preview4.dart] with [fileName]
class IconButtonPreview4Builder extends JsonWidgetBuilder {
  const IconButtonPreview4Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'icon_button_preview4.dart';

  static IconButtonPreview4Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const IconButtonPreview4Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const IconButtonPreview4();
  }
}
