import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [context_menu_builder1.dart] with [fileName]
class ContextMenuBuilder1Builder extends JsonWidgetBuilder {
  const ContextMenuBuilder1Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'context_menu_builder1.dart';

  static ContextMenuBuilder1Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const ContextMenuBuilder1Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const ContextMenuBuilder1();
  }
}
