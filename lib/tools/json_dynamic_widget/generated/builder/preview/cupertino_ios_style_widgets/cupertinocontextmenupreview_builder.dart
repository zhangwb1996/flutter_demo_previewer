import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [cupertino_context_menu_preview.dart] with [fileName]
class CupertinoContextMenuPreviewBuilder extends JsonWidgetBuilder {
  const CupertinoContextMenuPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'cupertino_context_menu_preview.dart';

  static CupertinoContextMenuPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CupertinoContextMenuPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CupertinoContextMenuPreview();
  }
}
