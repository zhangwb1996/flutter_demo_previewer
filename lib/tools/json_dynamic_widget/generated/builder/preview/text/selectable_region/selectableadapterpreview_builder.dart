import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [selectable_adapter_preview.dart] with [fileName]
class SelectableAdapterPreviewBuilder extends JsonWidgetBuilder {
  const SelectableAdapterPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'selectable_adapter_preview.dart';

  static SelectableAdapterPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const SelectableAdapterPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const SelectableAdapterPreview();
  }
}
