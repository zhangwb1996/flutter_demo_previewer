import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [autocomplete_basic_user_preview.dart] with [fileName]
class AutocompleteBasicUserPreviewBuilder extends JsonWidgetBuilder {
  const AutocompleteBasicUserPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'autocomplete_basic_user_preview.dart';

  static AutocompleteBasicUserPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AutocompleteBasicUserPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AutocompleteBasicUserPreview();
  }
}
