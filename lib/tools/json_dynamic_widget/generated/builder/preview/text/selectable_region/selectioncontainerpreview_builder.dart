import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [selection_container_preview.dart] with [fileName]
class SelectionContainerPreviewBuilder extends JsonWidgetBuilder {
  const SelectionContainerPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'selection_container_preview.dart';

  static SelectionContainerPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const SelectionContainerPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const SelectionContainerPreview();
  }
}
