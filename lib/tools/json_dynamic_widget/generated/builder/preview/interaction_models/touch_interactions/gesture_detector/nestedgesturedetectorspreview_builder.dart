import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [nested_gesture_detector_preview.dart] with [fileName]
class NestedGestureDetectorsPreviewBuilder extends JsonWidgetBuilder {
  const NestedGestureDetectorsPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'nested_gesture_detector_preview.dart';

  static NestedGestureDetectorsPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const NestedGestureDetectorsPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const NestedGestureDetectorsPreview();
  }
}
