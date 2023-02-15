import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import '../generated/builder.dart';

///
/// append [content] above the [ /// BODY ]
/// RegEpx('/// REGISTER')
///
void register(JsonWidgetRegistry registry) {


  registry.registerCustomBuilder(
    AnimatedAlignViewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedAlignViewBuilder.fromDynamic),
  );
  /// BODY
}