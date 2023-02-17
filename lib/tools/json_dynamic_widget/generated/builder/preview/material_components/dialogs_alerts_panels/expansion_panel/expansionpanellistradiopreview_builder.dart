import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [expansion_panel_list_radio_preview.dart] with [fileName]
class ExpansionPanelListRadioPreviewBuilder extends JsonWidgetBuilder {
  const ExpansionPanelListRadioPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'expansion_panel_list_radio_preview.dart';

  static ExpansionPanelListRadioPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const ExpansionPanelListRadioPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const ExpansionPanelListRadioPreview();
  }
}
