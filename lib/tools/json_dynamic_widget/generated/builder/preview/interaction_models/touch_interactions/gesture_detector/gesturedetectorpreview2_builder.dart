import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [gesture_detector_preview_2.dart] with [fileName]
class GestureDetectorPreview2Builder extends JsonWidgetBuilder {
  const GestureDetectorPreview2Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'gesture_detector_preview_2.dart';

  static GestureDetectorPreview2Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const GestureDetectorPreview2Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const GestureDetectorPreview2();
  }
}
