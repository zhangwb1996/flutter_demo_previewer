import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [fade_transition_preview.dart] with [fileName]
class FadeTransitionPreviewBuilder extends JsonWidgetBuilder {
  const FadeTransitionPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'fade_transition_preview.dart';

  static FadeTransitionPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const FadeTransitionPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const FadeTransitionPreview();
  }
}
