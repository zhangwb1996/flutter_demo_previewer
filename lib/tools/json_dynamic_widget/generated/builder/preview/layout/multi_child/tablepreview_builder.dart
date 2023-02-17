import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [table_preview.dart] with [fileName]
class TablePreviewBuilder extends JsonWidgetBuilder {
  const TablePreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'table_preview.dart';

  static TablePreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const TablePreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const TablePreview();
  }
}
