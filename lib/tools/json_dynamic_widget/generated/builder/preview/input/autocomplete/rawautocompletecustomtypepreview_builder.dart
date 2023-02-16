import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [raw_autocomplete_custom_type_preview.dart] with [fileName]
class RawAutocompleteCustomTypePreviewBuilder extends JsonWidgetBuilder {
  const RawAutocompleteCustomTypePreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'raw_autocomplete_custom_type_preview.dart';

  static RawAutocompleteCustomTypePreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const RawAutocompleteCustomTypePreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const RawAutocompleteCustomTypePreview();
  }
}
