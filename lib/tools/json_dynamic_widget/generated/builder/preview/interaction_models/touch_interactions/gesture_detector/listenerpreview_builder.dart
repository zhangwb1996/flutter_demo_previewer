import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [listener_preview.dart] with [fileName]
class ListenerPreviewBuilder extends JsonWidgetBuilder {
  const ListenerPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'listener_preview.dart';

  static ListenerPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const ListenerPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const ListenerPreview();
  }
}
