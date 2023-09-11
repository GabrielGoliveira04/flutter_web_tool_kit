import 'package:flutter/material.dart';

class StructureScrollController extends InheritedWidget {
  final ScrollController? scrollController;

  const StructureScrollController(
      {super.key, required this.scrollController, required super.child});

  static StructureScrollController? of(BuildContext context) {
    final StructureScrollController? result =
        context.dependOnInheritedWidgetOfExactType<StructureScrollController>();

    return result;
  }

  @override
  bool updateShouldNotify(covariant StructureScrollController oldWidget) {
    return scrollController != oldWidget.scrollController;
  }
}
