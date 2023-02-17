import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [dropdown_button_preview.dart] with [fileName]
class DropdownButtonPreviewBuilder extends JsonWidgetBuilder {
  const DropdownButtonPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'dropdown_button_preview.dart';

  static DropdownButtonPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const DropdownButtonPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const DropdownButtonPreview();
  }
}
