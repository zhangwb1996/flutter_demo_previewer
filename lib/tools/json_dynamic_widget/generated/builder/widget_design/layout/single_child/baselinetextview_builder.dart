import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [baseline_text_view.dart] with [fileName]
class BaselineTextViewBuilder extends JsonWidgetBuilder {
  const BaselineTextViewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'baseline_text_view.dart';

  static BaselineTextViewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const BaselineTextViewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const BaselineTextView();
  }
}
