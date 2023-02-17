import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [shader_mask_preview.dart] with [fileName]
class ShaderMaskPreviewBuilder extends JsonWidgetBuilder {
  const ShaderMaskPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'shader_mask_preview.dart';

  static ShaderMaskPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const ShaderMaskPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const ShaderMaskPreview();
  }
}
