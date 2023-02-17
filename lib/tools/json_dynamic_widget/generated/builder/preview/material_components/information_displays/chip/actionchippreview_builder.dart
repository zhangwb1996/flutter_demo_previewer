import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [action_chip_preview.dart] with [fileName]
class ActionChipPreviewBuilder extends JsonWidgetBuilder {
  const ActionChipPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'action_chip_preview.dart';

  static ActionChipPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const ActionChipPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const ActionChipPreview();
  }
}
