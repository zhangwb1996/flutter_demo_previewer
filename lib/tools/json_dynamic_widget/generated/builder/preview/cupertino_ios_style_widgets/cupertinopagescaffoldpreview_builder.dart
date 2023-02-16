import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [cupertino_page_scaffold_preview.dart] with [fileName]
class CupertinoPageScaffoldPreviewBuilder extends JsonWidgetBuilder {
  const CupertinoPageScaffoldPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'cupertino_page_scaffold_preview.dart';

  static CupertinoPageScaffoldPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CupertinoPageScaffoldPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CupertinoPageScaffoldPreview();
  }
}
