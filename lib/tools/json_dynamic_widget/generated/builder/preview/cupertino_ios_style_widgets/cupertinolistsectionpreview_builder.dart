import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [cupertino_list_section_preview.dart] with [fileName]
class CupertinoListSectionPreviewBuilder extends JsonWidgetBuilder {
  const CupertinoListSectionPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'cupertino_list_section_preview.dart';

  static CupertinoListSectionPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CupertinoListSectionPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CupertinoListSectionPreview();
  }
}
