import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [stream_builder_preview.dart] with [fileName]
class StreamBuilderPreviewBuilder extends JsonWidgetBuilder {
  const StreamBuilderPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'stream_builder_preview.dart';

  static StreamBuilderPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const StreamBuilderPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const StreamBuilderPreview();
  }
}
