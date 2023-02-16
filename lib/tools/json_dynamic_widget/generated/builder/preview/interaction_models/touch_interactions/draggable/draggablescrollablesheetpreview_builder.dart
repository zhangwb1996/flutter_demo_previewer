import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [draggable_scrollable_sheet_preview.dart] with [fileName]
class DraggableScrollableSheetPreviewBuilder extends JsonWidgetBuilder {
  const DraggableScrollableSheetPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'draggable_scrollable_sheet_preview.dart';

  static DraggableScrollableSheetPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const DraggableScrollableSheetPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const DraggableScrollableSheetPreview();
  }
}
