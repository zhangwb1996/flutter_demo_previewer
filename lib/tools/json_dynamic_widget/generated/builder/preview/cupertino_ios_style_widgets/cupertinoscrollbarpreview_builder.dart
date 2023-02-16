import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [cupertino_scrollbar_preview.dart] with [fileName]
class CupertinoScrollbarPreviewBuilder extends JsonWidgetBuilder {
  const CupertinoScrollbarPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'cupertino_scrollbar_preview.dart';

  static CupertinoScrollbarPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CupertinoScrollbarPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CupertinoScrollbarPreview();
  }
}
