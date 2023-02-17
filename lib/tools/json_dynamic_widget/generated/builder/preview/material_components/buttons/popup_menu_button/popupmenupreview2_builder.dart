import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [popup_menu_button_preview2.dart] with [fileName]
class PopupMenuPreview2Builder extends JsonWidgetBuilder {
  const PopupMenuPreview2Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'popup_menu_button_preview2.dart';

  static PopupMenuPreview2Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const PopupMenuPreview2Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const PopupMenuPreview2();
  }
}
