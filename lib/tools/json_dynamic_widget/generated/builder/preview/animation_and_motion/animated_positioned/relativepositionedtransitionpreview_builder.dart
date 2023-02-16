import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [relative_position_transition_preview.dart] with [fileName]
class RelativePositionedTransitionPreviewBuilder extends JsonWidgetBuilder {
  const RelativePositionedTransitionPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'relative_position_transition_preview.dart';

  static RelativePositionedTransitionPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const RelativePositionedTransitionPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const RelativePositionedTransitionPreview();
  }
}
