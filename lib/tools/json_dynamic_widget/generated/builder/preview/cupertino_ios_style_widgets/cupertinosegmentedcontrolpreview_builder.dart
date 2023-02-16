import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [cupertino_segmented_control_preview.dart] with [fileName]
class CupertinoSegmentedControlPreviewBuilder extends JsonWidgetBuilder {
  const CupertinoSegmentedControlPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'cupertino_segmented_control_preview.dart';

  static CupertinoSegmentedControlPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CupertinoSegmentedControlPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CupertinoSegmentedControlPreview();
  }
}
