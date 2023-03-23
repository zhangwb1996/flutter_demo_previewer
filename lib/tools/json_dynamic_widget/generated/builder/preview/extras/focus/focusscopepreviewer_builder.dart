import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [focus_scope.dart] with [fileName]
class FocusScopePreviewerBuilder extends JsonWidgetBuilder {
  const FocusScopePreviewerBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'focus_scope.dart';

  static FocusScopePreviewerBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const FocusScopePreviewerBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const FocusScopePreviewer();
  }
}
