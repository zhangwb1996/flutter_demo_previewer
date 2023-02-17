import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [selection_all_or_none_container_preview.dart] with [fileName]
class SelectionAllOrNoneContainerPreivewBuilder extends JsonWidgetBuilder {
  const SelectionAllOrNoneContainerPreivewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'selection_all_or_none_container_preview.dart';

  static SelectionAllOrNoneContainerPreivewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const SelectionAllOrNoneContainerPreivewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const SelectionAllOrNoneContainerPreivew();
  }
}
