import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [list_tile_preview2.dart] with [fileName]
class LisTilePreview2Builder extends JsonWidgetBuilder {
  const LisTilePreview2Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'list_tile_preview2.dart';

  static LisTilePreview2Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const LisTilePreview2Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const LisTilePreview2();
  }
}
