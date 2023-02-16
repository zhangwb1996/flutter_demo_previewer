import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [cupertino_switch_preview.dart] with [fileName]
class CupertinoSwitchPreviewBuilder extends JsonWidgetBuilder {
  const CupertinoSwitchPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'cupertino_switch_preview.dart';

  static CupertinoSwitchPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CupertinoSwitchPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CupertinoSwitchPreview();
  }
}
