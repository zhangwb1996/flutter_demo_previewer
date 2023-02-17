import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [floating_action_buttion_preview2.dart] with [fileName]
class FloatingActionButtonPreview2Builder extends JsonWidgetBuilder {
  const FloatingActionButtonPreview2Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'floating_action_buttion_preview2.dart';

  static FloatingActionButtonPreview2Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const FloatingActionButtonPreview2Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const FloatingActionButtonPreview2();
  }
}
