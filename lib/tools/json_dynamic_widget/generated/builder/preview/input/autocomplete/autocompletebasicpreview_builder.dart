import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [autocomplete_basic_preview.dart] with [fileName]
class AutocompleteBasicPreviewBuilder extends JsonWidgetBuilder {
  const AutocompleteBasicPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'autocomplete_basic_preview.dart';

  static AutocompleteBasicPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const AutocompleteBasicPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const AutocompleteBasicPreview();
  }
}
