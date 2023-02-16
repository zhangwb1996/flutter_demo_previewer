import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [interactive_viewer_preview.dart] with [fileName]
class InteractiveViewerPreviewBuilder extends JsonWidgetBuilder {
  const InteractiveViewerPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'interactive_viewer_preview.dart';

  static InteractiveViewerPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const InteractiveViewerPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const InteractiveViewerPreview();
  }
}
