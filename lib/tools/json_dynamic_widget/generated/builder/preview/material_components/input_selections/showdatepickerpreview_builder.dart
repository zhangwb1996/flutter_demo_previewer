import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [show_date_picker_preview.dart] with [fileName]
class showDatePickerPreviewBuilder extends JsonWidgetBuilder {
  const showDatePickerPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'show_date_picker_preview.dart';

  static showDatePickerPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const showDatePickerPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const showDatePickerPreview();
  }
}
