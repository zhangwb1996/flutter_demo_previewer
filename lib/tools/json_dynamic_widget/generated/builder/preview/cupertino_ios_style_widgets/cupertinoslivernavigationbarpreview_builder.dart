import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [cupertino_sliver_navigation_bar_preview.dart] with [fileName]
class CupertinoSliverNavigationBarPreviewBuilder extends JsonWidgetBuilder {
  const CupertinoSliverNavigationBarPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'cupertino_sliver_navigation_bar_preview.dart';

  static CupertinoSliverNavigationBarPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CupertinoSliverNavigationBarPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CupertinoSliverNavigationBarPreview();
  }
}
