import 'package:flutter/material.dart';
import 'package:flutter_web_tool_kit/widgets/template/web_structure/structure_scroll_controller.dart';

void navigateToAnchor(BuildContext context, {required GlobalKey contentKey}) {
  StructureScrollController.of(context)?.scrollController?.animateTo(
        (contentKey.currentContext?.findRenderObject() as RenderBox)
                .localToGlobal(Offset(
                    0,
                    StructureScrollController.of(context)!
                        .scrollController!
                        .offset))
                .dy +
            ((contentKey.currentContext?.findRenderObject() as RenderBox)
                        .size
                        .height -
                    MediaQuery.of(context).size.height) *
                0.1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
}
