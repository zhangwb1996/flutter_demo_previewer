import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [fractionally_sizedbox_view.dart] with [fileName]
class FractionallySizedBoxViewBuilder extends JsonWidgetBuilder {
  const FractionallySizedBoxViewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'fractionally_sizedbox_view.dart';

  static FractionallySizedBoxViewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const FractionallySizedBoxViewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const FractionallySizedBoxView();
  }
}
