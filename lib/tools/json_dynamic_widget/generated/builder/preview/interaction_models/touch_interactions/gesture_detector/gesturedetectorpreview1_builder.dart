import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [gesture_detector_preview_1.dart] with [fileName]
class GestureDetectorPreview1Builder extends JsonWidgetBuilder {
  const GestureDetectorPreview1Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'gesture_detector_preview_1.dart';

  static GestureDetectorPreview1Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const GestureDetectorPreview1Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const GestureDetectorPreview1();
  }
}
