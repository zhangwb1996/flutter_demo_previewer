import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [switch_preview2.dart] with [fileName]
class SwitchPreview2Builder extends JsonWidgetBuilder {
  const SwitchPreview2Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'switch_preview2.dart';

  static SwitchPreview2Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const SwitchPreview2Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const SwitchPreview2();
  }
}
