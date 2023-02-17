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
    AlignViewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AlignViewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AspectRatioViewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AspectRatioViewBuilder.fromDynamic),
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

  registry.registerCustomBuilder(
    AutocompleteBasicPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AutocompleteBasicPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AutocompleteBasicUserPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AutocompleteBasicUserPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    RawAutocompleteBasicPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: RawAutocompleteBasicPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    RawAutocompleteCustomTypePreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: RawAutocompleteCustomTypePreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    RawAutocompleteFormPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: RawAutocompleteFormPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    FormPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: FormPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    TextFormFieldPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: TextFormFieldPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AbsorbPointerPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AbsorbPointerPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    IgnorePointerPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: IgnorePointerPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    DismissibleoPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: DismissibleoPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    DraggablePreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: DraggablePreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    DraggableScrollableSheetPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: DraggableScrollableSheetPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    GestureDetectorPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: GestureDetectorPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    GestureDetectorPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: GestureDetectorPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ListenerPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: ListenerPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    MouseRegionPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: MouseRegionPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    NestedGestureDetectorsPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: NestedGestureDetectorsPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    InteractiveViewerPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: InteractiveViewerPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    BaselineTextViewBuilder.type,
    const JsonWidgetBuilderContainer(builder: BaselineTextViewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CenterViewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CenterViewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    BoxFitViewBuilder.type,
    const JsonWidgetBuilderContainer(builder: BoxFitViewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    FractionallySizedBoxViewBuilder.type,
    const JsonWidgetBuilderContainer(builder: FractionallySizedBoxViewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    OffstagePreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: OffstagePreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AnimatedPaddingPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: AnimatedPaddingPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    FlowMenuPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: FlowMenuPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    GridListPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: GridListPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    IndexedStackPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: IndexedStackPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    LayoutBuilderPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: LayoutBuilderPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    TablePreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: TablePreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CustomScrollViewPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: CustomScrollViewPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CustomScrollViewPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: CustomScrollViewPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SliverAppBarPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: SliverAppBarPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AppBarPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: AppBarPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AppBarPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: AppBarPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AppBarPreview3Builder.type,
    const JsonWidgetBuilderContainer(builder: AppBarPreview3Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    BottomNavigationBarPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: BottomNavigationBarPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    BottomNavigationBarPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: BottomNavigationBarPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    BottomNavigationBarPreview3Builder.type,
    const JsonWidgetBuilderContainer(builder: BottomNavigationBarPreview3Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    DrawerPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: DrawerPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    NavigationRailPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: NavigationRailPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    NavigationRailPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: NavigationRailPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ScaffoldPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: ScaffoldPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ScaffoldPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: ScaffoldPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ScaffoldPreview3Builder.type,
    const JsonWidgetBuilderContainer(builder: ScaffoldPreview3Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    TabBarPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: TabBarPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    DropdownButtonPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: DropdownButtonPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ElevatedButtonPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: ElevatedButtonPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    FloatingActionButtonPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: FloatingActionButtonPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    FloatingActionButtonPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: FloatingActionButtonPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    FloatingActionButtonPreview3Builder.type,
    const JsonWidgetBuilderContainer(builder: FloatingActionButtonPreview3Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    FloatingActionButtonPreview4Builder.type,
    const JsonWidgetBuilderContainer(builder: FloatingActionButtonPreview4Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    IconButtonPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: IconButtonPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    IconButtonPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: IconButtonPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    IconButtonPreview3Builder.type,
    const JsonWidgetBuilderContainer(builder: IconButtonPreview3Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    IconButtonPreview4Builder.type,
    const JsonWidgetBuilderContainer(builder: IconButtonPreview4Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    OutlinedButtonPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: OutlinedButtonPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    PopupMenuPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: PopupMenuPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    PopupMenuPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: PopupMenuPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SelectableButtonPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: SelectableButtonPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    TextButtonPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: TextButtonPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AlertDialogPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: AlertDialogPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    AlertDialogPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: AlertDialogPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ExpansionPanelListPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: ExpansionPanelListPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ExpansionPanelListRadioPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: ExpansionPanelListRadioPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ShowBottomSheetPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: ShowBottomSheetPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SnackBarPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: SnackBarPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SnackBarPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: SnackBarPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CardPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: CardPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CardPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: CardPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CardPreview3Builder.type,
    const JsonWidgetBuilderContainer(builder: CardPreview3Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ActionChipPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: ActionChipPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ActionChoicePreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: ActionChoicePreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    FilterChipPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: FilterChipPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    InputChipPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: InputChipPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    DataTablePreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: DataTablePreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    DataTablePreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: DataTablePreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    DividerPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: DividerPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    DividerPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: DividerPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CustomListItemPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CustomListItemPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CustomListItemTwoPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CustomListItemTwoPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    LisTilePreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: LisTilePreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    LisTilePreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: LisTilePreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    StepperPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: StepperPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CircularProgressIndicatorPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: CircularProgressIndicatorPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CircularProgressIndicatorPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: CircularProgressIndicatorPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    LinearProgressIndicatorPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: LinearProgressIndicatorPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    LinearProgressIndicatorPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: LinearProgressIndicatorPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    RefreshIndicatorPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: RefreshIndicatorPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    RefreshIndicatorPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: RefreshIndicatorPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    TooltipPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: TooltipPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    TooltipPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: TooltipPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    TooltipPreview3Builder.type,
    const JsonWidgetBuilderContainer(builder: TooltipPreview3Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    TooltipPreview4Builder.type,
    const JsonWidgetBuilderContainer(builder: TooltipPreview4Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    CheckboxPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: CheckboxPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    RadioPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: RadioPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    showDatePickerPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: showDatePickerPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SliderPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: SliderPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SliderPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: SliderPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SliderPreview3Builder.type,
    const JsonWidgetBuilderContainer(builder: SliderPreview3Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SwitchPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: SwitchPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SwitchPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: SwitchPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SwitchPreview3Builder.type,
    const JsonWidgetBuilderContainer(builder: SwitchPreview3Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ShaderMaskPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: ShaderMaskPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    NestedScrollViewPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: NestedScrollViewPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    NestedScrollViewPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: NestedScrollViewPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    NestedScrollViewPreview3Builder.type,
    const JsonWidgetBuilderContainer(builder: NestedScrollViewPreview3Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    RawScrollbarPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: RawScrollbarPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    RawScrollbarPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: RawScrollbarPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    RawScrollbarPreview3Builder.type,
    const JsonWidgetBuilderContainer(builder: RawScrollbarPreview3Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    RawScrollbarPreview4Builder.type,
    const JsonWidgetBuilderContainer(builder: RawScrollbarPreview4Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ReorderableListViewPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: ReorderableListViewPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ReorderableListViewPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: ReorderableListViewPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ScrollbarPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: ScrollbarPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ScrollbarPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: ScrollbarPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ScrollbarPreview3Builder.type,
    const JsonWidgetBuilderContainer(builder: ScrollbarPreview3Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    ScrollbarPreview4Builder.type,
    const JsonWidgetBuilderContainer(builder: ScrollbarPreview4Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SingleChildScrollViewPreview1Builder.type,
    const JsonWidgetBuilderContainer(builder: SingleChildScrollViewPreview1Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SingleChildScrollViewPreview2Builder.type,
    const JsonWidgetBuilderContainer(builder: SingleChildScrollViewPreview2Builder.fromDynamic),
  );

  registry.registerCustomBuilder(
    DefaultTextStyleTransitionPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: DefaultTextStyleTransitionPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SelectableAdapterPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: SelectableAdapterPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SelectionAllOrNoneContainerPreivewBuilder.type,
    const JsonWidgetBuilderContainer(builder: SelectionAllOrNoneContainerPreivewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SelectionAreaPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: SelectionAreaPreviewBuilder.fromDynamic),
  );

  registry.registerCustomBuilder(
    SelectionContainerPreviewBuilder.type,
    const JsonWidgetBuilderContainer(builder: SelectionContainerPreviewBuilder.fromDynamic),
  );
  /// BODY
}