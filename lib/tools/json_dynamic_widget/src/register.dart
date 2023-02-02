import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:tree/tools/json_dynamic_widget/lib/appbar_example_builder.dart';
import 'package:tree/tools/json_dynamic_widget/lib/bottom_navigation_bar_builder.dart';

void register() {
  var registry = JsonWidgetRegistry.instance;
  registry.registerCustomBuilder(
    AppBarExampleBuilder.type,
    const JsonWidgetBuilderContainer(builder: AppBarExampleBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    BottomNavigationBarExampleBuilder.type,
    const JsonWidgetBuilderContainer(
        builder: BottomNavigationBarExampleBuilder.fromDynamic),
  );
}
