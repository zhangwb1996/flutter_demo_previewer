import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [refresh_indicator_preview2.dart] with [fileName]
class RefreshIndicatorPreview2Builder extends JsonWidgetBuilder {
  const RefreshIndicatorPreview2Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'refresh_indicator_preview2.dart';

  static RefreshIndicatorPreview2Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const RefreshIndicatorPreview2Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const RefreshIndicatorPreview2();
  }
}
