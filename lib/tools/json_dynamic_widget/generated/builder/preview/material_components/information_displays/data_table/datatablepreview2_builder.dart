import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [data_table_preview2.dart] with [fileName]
class DataTablePreview2Builder extends JsonWidgetBuilder {
  const DataTablePreview2Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'data_table_preview2.dart';

  static DataTablePreview2Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const DataTablePreview2Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const DataTablePreview2();
  }
}
