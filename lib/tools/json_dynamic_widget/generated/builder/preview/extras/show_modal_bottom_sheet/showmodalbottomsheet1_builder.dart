import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [show_modal_bottom_sheet1.dart] with [fileName]
class ShowModalBottomSheet1Builder extends JsonWidgetBuilder {
  const ShowModalBottomSheet1Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'show_modal_bottom_sheet1.dart';

  static ShowModalBottomSheet1Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const ShowModalBottomSheet1Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const ShowModalBottomSheet1();
  }
}
