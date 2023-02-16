import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [draggable_preview.dart] with [fileName]
class DraggablePreviewBuilder extends JsonWidgetBuilder {
  const DraggablePreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'draggable_preview.dart';

  static DraggablePreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const DraggablePreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const DraggablePreview();
  }
}
