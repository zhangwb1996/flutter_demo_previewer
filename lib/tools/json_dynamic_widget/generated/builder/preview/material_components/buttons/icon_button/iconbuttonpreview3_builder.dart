import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [icon_button_preview3.dart] with [fileName]
class IconButtonPreview3Builder extends JsonWidgetBuilder {
  const IconButtonPreview3Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'icon_button_preview3.dart';

  static IconButtonPreview3Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const IconButtonPreview3Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const IconButtonPreview3();
  }
}
