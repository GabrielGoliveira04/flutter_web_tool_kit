import 'package:flutter/material.dart';
import 'package:flutter_web_tool_kit/widgets/behavior/render_behavior.dart';

mixin ResponsiveWidget {
  renderWeb(BuildContext context);
  renderMobile(BuildContext context);

  Widget render(
      {required BuildContext context, required RenderBehaviorEnum behaviour}) {
    if (behaviour == RenderBehaviorEnum.renderWeb) return renderWeb(context);
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
  renderWeb(BuildContext context);
}
