import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [custom_list_item_preview.dart] with [fileName]
class CustomListItemPreviewBuilder extends JsonWidgetBuilder {
  const CustomListItemPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'custom_list_item_preview.dart';

  static CustomListItemPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CustomListItemPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CustomListItemPreview();
  }
}
