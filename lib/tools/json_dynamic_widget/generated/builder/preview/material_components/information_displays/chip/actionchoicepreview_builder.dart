import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [choice_chip_preview.dart] with [fileName]
class ActionChoicePreviewBuilder extends JsonWidgetBuilder {
  const ActionChoicePreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'choice_chip_preview.dart';

  static ActionChoicePreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const ActionChoicePreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const ActionChoicePreview();
  }
}
