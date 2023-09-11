import 'package:flutter/material.dart';
import 'package:flutter_web_tool_kit/flutter_web_tool_kit.dart';

class WebRowWidget extends ResponsiveStatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final List<Widget> children;

  ///[RowResponsiveItemOrdenation] works just for responsive purpose. Change row items ordenation on mobile.
  final RowResponsiveItemOrdenation rowResponsiveItemOrdenation;
  @override
  const WebRowWidget({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.verticalDirection = VerticalDirection.down,
    this.children = const <Widget>[],
    this.rowResponsiveItemOrdenation = RowResponsiveItemOrdenation.linear,
  });

  @override
  renderMobile(BuildContext context) {
    return Semantics(
        label: 'WebRow',
        hint: 'This is WebRow',
        tooltip: 'WebRow',
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisSize: mainAxisSize,
          verticalDirection: verticalDirection,
          children: [
            if (rowResponsiveItemOrdenation ==
                RowResponsiveItemOrdenation.reverse)
              ...children.reversed.toList(),
            if (rowResponsiveItemOrdenation ==
                RowResponsiveItemOrdenation.linear)
              ...children,
          ],
        ));
  }

  @override
  renderWeb(BuildContext context) {
    return Semantics(
        label: 'WebRow',
        hint: 'This is WebRow',
        tooltip: 'WebRow',
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          verticalDirection: verticalDirection,
          children: children,
        ));
  }
}

enum RowResponsiveItemOrdenation {
  linear,
  reverse,
}
