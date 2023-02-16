import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:child_builder/child_builder.dart';
import 'package:widget_design/widget.dart';//only for pre branch

/// replace  '[Json2widgetTemp]' with [className]
/// replace  [hero_preview_2.dart] with [fileName]
class HeroPreview2Builder extends JsonWidgetBuilder {
  const HeroPreview2Builder({
    super.numSupportedChildren = 0,
  });

  static const type = 'hero_preview_2.dart';

  static HeroPreview2Builder fromDynamic(
    dynamic map, {
    JsonWidgetRegistry? registry,
  }) {
    return const HeroPreview2Builder();
  }
    @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    
    return const HeroPreview2();
  }
}
