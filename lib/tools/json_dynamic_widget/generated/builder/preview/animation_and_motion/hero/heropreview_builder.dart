import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [hero_preview.dart] with [fileName]
class HeroPreviewBuilder extends JsonWidgetBuilder {
  const HeroPreviewBuilder({
    super.numSupportedChildren = 0,
  });

  static const type = 'hero_preview.dart';

  static HeroPreviewBuilder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const HeroPreviewBuilder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const HeroPreview();
  }
}
