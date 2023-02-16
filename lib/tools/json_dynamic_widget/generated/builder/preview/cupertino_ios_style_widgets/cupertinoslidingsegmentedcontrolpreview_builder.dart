import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [cupertino_sliding_segmented_control_preview.dart] with [fileName]
class CupertinoSlidingSegmentedControlPreviewBuilder extends JsonWidgetBuilder {
  const CupertinoSlidingSegmentedControlPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'cupertino_sliding_segmented_control_preview.dart';

  static CupertinoSlidingSegmentedControlPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CupertinoSlidingSegmentedControlPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CupertinoSlidingSegmentedControlPreview();
  }
}
