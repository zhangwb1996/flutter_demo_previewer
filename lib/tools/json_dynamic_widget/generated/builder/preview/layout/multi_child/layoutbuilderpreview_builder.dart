import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [layout_builder_preview.dart] with [fileName]
class LayoutBuilderPreviewBuilder extends JsonWidgetBuilder {
  const LayoutBuilderPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'layout_builder_preview.dart';

  static LayoutBuilderPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const LayoutBuilderPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const LayoutBuilderPreview();
  }
}
