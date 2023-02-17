import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [text_button_preview1.dart] with [fileName]
class TextButtonPreview1Builder extends JsonWidgetBuilder {
  const TextButtonPreview1Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'text_button_preview1.dart';

  static TextButtonPreview1Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const TextButtonPreview1Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const TextButtonPreview1();
  }
}
