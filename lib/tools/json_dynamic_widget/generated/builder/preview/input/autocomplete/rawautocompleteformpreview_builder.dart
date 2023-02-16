import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [raw_autocomplete_form_preview.dart] with [fileName]
class RawAutocompleteFormPreviewBuilder extends JsonWidgetBuilder {
  const RawAutocompleteFormPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'raw_autocomplete_form_preview.dart';

  static RawAutocompleteFormPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const RawAutocompleteFormPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const RawAutocompleteFormPreview();
  }
}
