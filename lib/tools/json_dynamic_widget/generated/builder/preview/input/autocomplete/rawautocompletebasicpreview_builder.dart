import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [raw_autocomplete_basic_preview.dart] with [fileName]
class RawAutocompleteBasicPreviewBuilder extends JsonWidgetBuilder {
  const RawAutocompleteBasicPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'raw_autocomplete_basic_preview.dart';

  static RawAutocompleteBasicPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const RawAutocompleteBasicPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const RawAutocompleteBasicPreview();
  }
}
