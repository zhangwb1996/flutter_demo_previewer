import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [absorb_pointer_preview.dart] with [fileName]
class AbsorbPointerPreviewBuilder extends JsonWidgetBuilder {
  const AbsorbPointerPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'absorb_pointer_preview.dart';

  static AbsorbPointerPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AbsorbPointerPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AbsorbPointerPreview();
  }
}
