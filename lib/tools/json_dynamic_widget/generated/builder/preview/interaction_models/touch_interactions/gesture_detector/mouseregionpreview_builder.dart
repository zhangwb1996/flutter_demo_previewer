import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [mouse_region_preview.dart] with [fileName]
class MouseRegionPreviewBuilder extends JsonWidgetBuilder {
  const MouseRegionPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'mouse_region_preview.dart';

  static MouseRegionPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const MouseRegionPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const MouseRegionPreview();
  }
}
