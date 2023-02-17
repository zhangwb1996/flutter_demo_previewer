import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [grid_list_preview.dart] with [fileName]
class GridListPreviewBuilder extends JsonWidgetBuilder {
  const GridListPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'grid_list_preview.dart';

  static GridListPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const GridListPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const GridListPreview();
  }
}
