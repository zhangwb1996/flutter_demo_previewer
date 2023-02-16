import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [cupertino_button_preview.dart] with [fileName]
class CupertinoButtonPreviewBuilder extends JsonWidgetBuilder {
  const CupertinoButtonPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'cupertino_button_preview.dart';

  static CupertinoButtonPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CupertinoButtonPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CupertinoButtonPreview();
  }
}
