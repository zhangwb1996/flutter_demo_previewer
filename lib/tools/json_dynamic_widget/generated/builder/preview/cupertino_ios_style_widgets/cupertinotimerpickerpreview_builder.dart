import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [cupertino_timer_picker_perview.dart] with [fileName]
class CupertinoTimerPickerPreviewBuilder extends JsonWidgetBuilder {
  const CupertinoTimerPickerPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'cupertino_timer_picker_perview.dart';

  static CupertinoTimerPickerPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CupertinoTimerPickerPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CupertinoTimerPickerPreview();
  }
}
