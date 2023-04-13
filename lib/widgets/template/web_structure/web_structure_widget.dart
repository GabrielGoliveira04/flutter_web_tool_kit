import 'package:flutter/material.dart';
import 'package:flutter_web_tool_kit/flutter_web_tool_kit.dart';

class WebStructureWidget extends StatelessWidget {
  final WebNavbarWidget? navbar;
  final List<Widget> children;
  final ScrollController? scrollController;

  const WebStructureWidget({
    Key? key,
    this.navbar,
    required this.children,
    this.scrollController,
  }) : super(key: key);

  bool get isFloatingNavbar => navbar?.isFloating ?? false;

  @override
  Widget build(BuildContext context) {
    return Resize(
      builder: () => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: isFloatingNavbar ? navbar : null,
        body: Semantics(
            label: 'WebStructure',
            hint: 'This is WebStructure',
            tooltip: 'WebStructure',
            child: ResponsiveBuilder(
              builder: (context, size) => RenderBehavior(
                  behavior: size.isDesktop
                      ? RenderBehaviorEnum.renderWeb
                      : RenderBehaviorEnum.renderMobile,
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      if (!isFloatingNavbar && navbar != null)
                        SliverList(
                            delegate: SliverChildListDelegate([
                          Stack(
                            children: [
                              Column(
                                children: children,
                              ),
                              navbar!
                            ],
                          )
                        ])),
                      if (isFloatingNavbar)
                        SliverList(delegate: SliverChildListDelegate(children))
                    ],
                  )),
            )),
      ),
    );
  }
}
