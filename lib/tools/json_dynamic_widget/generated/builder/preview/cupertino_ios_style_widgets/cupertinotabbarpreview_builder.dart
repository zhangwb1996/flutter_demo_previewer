import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [cupertino_tab_bar_preview.dart] with [fileName]
class CupertinoTabBarPreviewBuilder extends JsonWidgetBuilder {
  const CupertinoTabBarPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'cupertino_tab_bar_preview.dart';

  static CupertinoTabBarPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CupertinoTabBarPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CupertinoTabBarPreview();
  }
}
