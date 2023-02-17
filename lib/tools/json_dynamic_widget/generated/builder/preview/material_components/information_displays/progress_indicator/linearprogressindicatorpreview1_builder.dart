import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [linear_progress_indicator_preview1.dart] with [fileName]
class LinearProgressIndicatorPreview1Builder extends JsonWidgetBuilder {
  const LinearProgressIndicatorPreview1Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'linear_progress_indicator_preview1.dart';

  static LinearProgressIndicatorPreview1Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const LinearProgressIndicatorPreview1Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const LinearProgressIndicatorPreview1();
  }
}
