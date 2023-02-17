import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [filter_chip_preview.dart] with [fileName]
class FilterChipPreviewBuilder extends JsonWidgetBuilder {
  const FilterChipPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'filter_chip_preview.dart';

  static FilterChipPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const FilterChipPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const FilterChipPreview();
  }
}
