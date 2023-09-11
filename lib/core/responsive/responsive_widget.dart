import 'package:flutter/material.dart';
import 'package:flutter_web_tool_kit/widgets/behavior/render_behavior.dart';

mixin ResponsiveWidget {
  renderWeb(BuildContext context);
  renderTablet(BuildContext context);
  renderMobile(BuildContext context);

  Widget render(
      {required BuildContext context, required RenderBehaviorEnum behaviour}) {
    if (behaviour == RenderBehaviorEnum.renderWeb) return renderWeb(context);
    if (behaviour == RenderBehaviorEnum.renderTablet) {
      return renderTablet(context);
    }
    return renderMobile(context);
  }
}

abstract class ResponsiveStatelessWidget extends StatelessWidget
    with ResponsiveWidget {
  const ResponsiveStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return render(
        context: context, behaviour: RenderBehavior.of(context).behavior);
  }

  @override
  renderMobile(BuildContext context);

  @override
  renderTablet(BuildContext context) {
    return renderMobile(context);
  }

  @override
  renderWeb(BuildContext context);
}
