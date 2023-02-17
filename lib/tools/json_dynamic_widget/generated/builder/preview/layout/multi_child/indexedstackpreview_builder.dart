import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [indexed_stack_preview.dart] with [fileName]
class IndexedStackPreviewBuilder extends JsonWidgetBuilder {
  const IndexedStackPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'indexed_stack_preview.dart';

  static IndexedStackPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const IndexedStackPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const IndexedStackPreview();
  }
}
