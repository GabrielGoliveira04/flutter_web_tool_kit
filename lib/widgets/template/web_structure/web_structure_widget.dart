import 'package:flutter/material.dart';
import 'package:flutter_web_tool_kit/flutter_web_tool_kit.dart';
import 'package:flutter_web_tool_kit/widgets/template/web_structure/structure_scroll_controller.dart';

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
  double get navSize => navbar?.size ?? 0;
  Widget get firstChildren => children.first;
  bool get isFirstChildrenWebSection =>
      firstChildren is WebSectionWidget ? true : false;

  List<Widget> _children() {
    if (isFirstChildrenWebSection && navbar != null) {
      return [
        (firstChildren as WebSectionWidget).copyWith(
            padding: (firstChildren as WebSectionWidget)
                .padding
                .add(EdgeInsets.only(top: navSize))),
        ...children..removeAt(0)
      ];
    } else {
      return children;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Resize(
      builder: () => StructureScrollController(
        scrollController: scrollController ?? ScrollController(),
        child: Scaffold(
          extendBodyBehindAppBar: isFloatingNavbar ? true : false,
          appBar: isFloatingNavbar ? navbar : null,
          body: Semantics(
              label: 'WebStructure',
              hint: 'This is WebStructure',
              tooltip: 'WebStructure',
              child: ResponsiveBuilder(
                builder: (context, size) => RenderBehavior(
                    behavior: renderPlatform[size.deviceScreenType] ??
                        RenderBehaviorEnum.renderWeb,
                    child: CustomScrollView(
                      controller: StructureScrollController.of(context)
                          ?.scrollController,
                      slivers: [
                        if (!isFloatingNavbar && navbar != null)
                          SliverList(
                              delegate: SliverChildListDelegate([
                            Stack(
                              children: [
                                Column(
                                  children: _children(),
                                ),
                                navbar!
                              ],
                            )
                          ])),
                        if (isFloatingNavbar)
                          SliverList(
                              delegate: SliverChildListDelegate(_children()))
                      ],
                    )),
              )),
        ),
      ),
    );
  }
}
