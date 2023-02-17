import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [stepper_preview.dart] with [fileName]
class StepperPreviewBuilder extends JsonWidgetBuilder {
  const StepperPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'stepper_preview.dart';

  static StepperPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const StepperPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const StepperPreview();
  }
}
