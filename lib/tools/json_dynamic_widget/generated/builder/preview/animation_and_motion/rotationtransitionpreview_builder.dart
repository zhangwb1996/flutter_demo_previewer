import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [rotation_transition_preview.dart] with [fileName]
class RotationTransitionPreviewBuilder extends JsonWidgetBuilder {
  const RotationTransitionPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'rotation_transition_preview.dart';

  static RotationTransitionPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const RotationTransitionPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const RotationTransitionPreview();
  }
}
