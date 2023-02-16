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

  registry.registerCustomBuilder(
    AnimatedContainerViewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedContainerViewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AnimatedCrossFadeViewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedCrossFadeViewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AnimatedOpacityViewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedOpacityViewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AnimatedGridPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedGridPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AnimatedListPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedListPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SliverAnimatedGridPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: SliverAnimatedGridPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SliverAnimatedListPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: SliverAnimatedListPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AnimatedOpacityPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedOpacityPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AnimatedSwitcherPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedSwitcherPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    FadeTransitionPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: FadeTransitionPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SliverAnimatedOpacityPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: SliverAnimatedOpacityPreviewBuilder.fromDynamic),
  );
  /// BODY
}