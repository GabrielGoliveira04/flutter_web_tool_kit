import 'package:flutter/material.dart';
import 'package:flutter_web_tool_kit/flutter_web_tool_kit.dart';

enum RenderBehaviorEnum {
  renderWeb,
  renderTablet,
  renderMobile,
}

final renderPlatform = <DeviceScreenType, RenderBehaviorEnum>{
  DeviceScreenType.desktop: RenderBehaviorEnum.renderWeb,
  DeviceScreenType.tablet: RenderBehaviorEnum.renderTablet,
  DeviceScreenType.mobile: RenderBehaviorEnum.renderMobile,
};

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
