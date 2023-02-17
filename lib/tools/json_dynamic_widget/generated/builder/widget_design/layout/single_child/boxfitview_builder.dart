import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [boxfit_view.dart] with [fileName]
class BoxFitViewBuilder extends JsonWidgetBuilder {
  const BoxFitViewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'boxfit_view.dart';

  static BoxFitViewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const BoxFitViewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const BoxFitView();
  }
}
