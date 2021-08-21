import 'package:flutter/material.dart';

class ResponsiveRow extends StatelessWidget {
  /// How the children within a run should be placed in the main axis.
  ///
  /// For example, if [alignment] is [WrapAlignment.center], the children in
  /// each run are grouped together in the center of their run in the main axis.
  ///
  /// Defaults to [WrapAlignment.start].
  final WrapAlignment alignment;

  /// How the children within a run should be aligned relative to each other in
  /// the cross axis.
  ///
  /// For example, if this is set to [WrapCrossAlignment.end], and the
  /// [direction] is [Axis.horizontal], then the children within each
  /// run will have their bottom edges aligned to the bottom edge of the run.
  ///
  /// Defaults to [WrapCrossAlignment.start].
  final WrapCrossAlignment crossAxisAlignment;

  /// How the runs themselves should be placed in the cross axis.
  ///
  /// For example, if [runAlignment] is [WrapAlignment.center], the runs are
  /// grouped together in the center of the overall [Wrap] in the cross axis.
  ///
  /// Defaults to [WrapAlignment.start].
  final WrapAlignment runAlignment;

  /// How much space to place between children in a run in the main axis.
  ///
  /// For example, if [spacing] is 10.0, the children will be spaced at least
  /// 10.0 logical pixels apart in the main axis.
  ///
  /// If there is additional free space in a run (e.g., because the wrap has a
  /// minimum size that is not filled or because some runs are longer than
  /// others), the additional free space will be allocated according to the
  /// [alignment].
  ///
  /// Defaults to 0.0.
  final double spacing;

  /// How much space to place between the runs themselves in the cross axis.
  ///
  /// For example, if [runSpacing] is 10.0, the runs will be spaced at least
  /// 10.0 logical pixels apart in the cross axis.
  ///
  /// If there is additional free space in the overall [Wrap] (e.g., because
  /// the wrap has a minimum size that is not filled), the additional free space
  /// will be allocated according to the [runAlignment].
  ///
  /// Defaults to 0.0.
  final double runSpacing;

  /// The widgets below this widget in the tree.
  final List<Widget> children;

  /// Determine how many columns available in a row
  final int columnCount;

  const ResponsiveRow({
    Key? key,
    this.alignment = WrapAlignment.start,
    this.children = const <Widget>[],
    this.spacing = 0.0,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.columnCount = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowSettings(
      columnCount: columnCount,
      spacing: spacing,
      child: Wrap(
        alignment: alignment,
        children: children,
        spacing: spacing,
        crossAxisAlignment: crossAxisAlignment,
        key: key,
        runAlignment: runAlignment,
        runSpacing: runSpacing,
      ),
    );
  }
}

class ResponsiveRowSettings extends InheritedWidget {
  final double spacing;
  final int columnCount;
  const ResponsiveRowSettings({
    Key? key,
    required Widget child,
    required this.spacing,
    required this.columnCount,
  }) : super(key: key, child: child);

  static ResponsiveRowSettings? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ResponsiveRowSettings>();
  }

  @override
  bool updateShouldNotify(ResponsiveRowSettings oldWidget) =>
      columnCount != oldWidget.columnCount;
}
