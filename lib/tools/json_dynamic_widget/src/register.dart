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
    AnimatedBuilderPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedBuilderPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AnimatedWidgetPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedWidgetPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    TweenAnimationBuilderPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: TweenAnimationBuilderPreviewBuilder.fromDynamic),
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

  registry.registerCustomBuilder(
    AlignTransitionPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AlignTransitionPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AnimatedPositionedPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedPositionedPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    PositionedTransitionPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: PositionedTransitionPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    RelativePositionedTransitionPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: RelativePositionedTransitionPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SlideTransitionPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: SlideTransitionPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AnimatedSizePreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedSizePreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ScaleTransitionPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: ScaleTransitionPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SizeTransitionPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: SizeTransitionPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    DecoratedBoxTransitionPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: DecoratedBoxTransitionPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    HeroPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: HeroPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    HeroPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: HeroPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    RotationTransitionPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: RotationTransitionPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    FutureBuilderPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: FutureBuilderPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    StreamBuilderPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: StreamBuilderPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoActivityIndicatorPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoActivityIndicatorPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoActionSheetPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoActionSheetPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoAlertDialogPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoAlertDialogPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoButtonPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoButtonPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoContextMenuPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoContextMenuPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoDatePickerPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoDatePickerPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoListSectionPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoListSectionPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoNavigationBarPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoNavigationBarPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoPageScaffoldPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoPageScaffoldPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoPickerPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoPickerPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoScrollbarPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoScrollbarPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoSearchTextFieldPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoSearchTextFieldPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoSegmentedControlPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoSegmentedControlPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoSliderPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoSliderPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoSlidingSegmentedControlPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoSlidingSegmentedControlPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoSliverNavigationBarPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoSliverNavigationBarPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoSwitchPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoSwitchPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoTabBarPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoTabBarPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoTabScaffoldPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoTabScaffoldPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoTextFieldPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoTextFieldPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CupertinoTimerPickerPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CupertinoTimerPickerPreviewBuilder.fromDynamic),
  );
  /// BODY
}