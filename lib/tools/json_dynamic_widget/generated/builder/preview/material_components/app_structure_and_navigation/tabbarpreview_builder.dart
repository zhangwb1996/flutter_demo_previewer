import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [tabbar_preview.dart] with [fileName]
class TabBarPreviewBuilder extends JsonWidgetBuilder {
  const TabBarPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'tabbar_preview.dart';

  static TabBarPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const TabBarPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const TabBarPreview();
  }
}
