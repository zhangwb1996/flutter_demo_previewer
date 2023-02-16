import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [cupertino_search_textfield_preview.dart] with [fileName]
class CupertinoSearchTextFieldPreviewBuilder extends JsonWidgetBuilder {
  const CupertinoSearchTextFieldPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'cupertino_search_textfield_preview.dart';

  static CupertinoSearchTextFieldPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const CupertinoSearchTextFieldPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const CupertinoSearchTextFieldPreview();
  }
}
