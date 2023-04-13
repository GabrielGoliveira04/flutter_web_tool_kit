import 'package:flutter/material.dart';

enum RenderBehaviorEnum {
  renderWeb,
  renderMobile,
}

class RenderBehavior extends InheritedWidget {
  final RenderBehaviorEnum behavior;

  const RenderBehavior(
      {Key? key, required this.behavior, required Widget child})
      : super(key: key, child: child);

  static RenderBehavior of(BuildContext context) {
    final RenderBehavior? result =
        context.dependOnInheritedWidgetOfExactType<RenderBehavior>();
    assert(result != null, 'No RenderBehaviour found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(RenderBehavior oldWidget) =>
      behavior != oldWidget.behavior;
}
