import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [dismissible_preview.dart] with [fileName]
class DismissibleoPreviewBuilder extends JsonWidgetBuilder {
  const DismissibleoPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'dismissible_preview.dart';

  static DismissibleoPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const DismissibleoPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const DismissibleoPreview();
  }
}
