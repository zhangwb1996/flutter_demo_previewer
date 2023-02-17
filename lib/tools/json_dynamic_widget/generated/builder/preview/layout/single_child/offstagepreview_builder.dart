import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [offstage_preview.dart] with [fileName]
class OffstagePreviewBuilder extends JsonWidgetBuilder {
  const OffstagePreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'offstage_preview.dart';

  static OffstagePreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const OffstagePreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const OffstagePreview();
  }
}
