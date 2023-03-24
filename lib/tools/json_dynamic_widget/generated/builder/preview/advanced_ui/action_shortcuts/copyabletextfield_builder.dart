import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [copyable_text_field.dart] with [fileName]
class CopyableTextFieldBuilder extends JsonWidgetBuilder {
  const CopyableTextFieldBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'copyable_text_field.dart';

  static CopyableTextFieldBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CopyableTextFieldBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CopyableTextField();
  }
}
