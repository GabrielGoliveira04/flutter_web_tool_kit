import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_web_tool_kit/widgets/template/web_structure/structure_scroll_controller.dart';

class DelayedSlideAnimation extends StatefulWidget {
  final Widget child;

  final int? delay;

  final Duration? duration;

  final Curve curve;

  final Offset positionBegin;

  final Offset positionEnd;

  final Function()? whenComplete;
  final GlobalKey widgetKey;

  const DelayedSlideAnimation({
    required this.child,
    Key? key,
    this.delay,
    this.duration,
    this.curve = Curves.easeInOutBack,
    this.positionBegin = const Offset(0, 0),
    this.positionEnd = const Offset(0, 0),
    this.whenComplete,
    required this.widgetKey,
  }) : super(key: key);

  @override
  DelayedSlideAnimationState createState() => DelayedSlideAnimationState();
}

class DelayedSlideAnimationState extends State<DelayedSlideAnimation>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;
  late final ScrollController? _scrollController;

  late Animation<Offset> _animOffset;

  final ValueNotifier<bool> mustAnimateChild = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: widget.duration ?? const Duration(milliseconds: 800));

    final curve = CurvedAnimation(curve: widget.curve, parent: _controller);

    _animOffset =
        ScreenSizeTween(begin: widget.positionBegin, end: widget.positionEnd)
            .animate(curve);
  }

  @override
  void didChangeDependencies() {
    _scrollController = StructureScrollController.of(context)?.scrollController;
    if (_scrollController != null) {
      _scrollController?.addListener(() {
        _scrollAnimate();
      });
    } else {
      _animate();
    }
    super.didChangeDependencies();
  }

  _scrollAnimate() {
    if (mustAnimateChild.value) {
      final widgetLocation = (widget.widgetKey.currentContext
                  ?.findRenderObject() as RenderBox)
              .localToGlobal(Offset(
                  0,
                  StructureScrollController.of(context)!
                      .scrollController!
                      .offset))
              .dy +
          ((widget.widgetKey.currentContext?.findRenderObject() as RenderBox)
                      .size
                      .height -
                  MediaQuery.of(context).size.height) *
              0.8;

      final mustAnimate = _scrollController!.position.pixels >= widgetLocation;

      if (mustAnimate) {
        _animate();
      }
    }
  }

  _animate() {
    if (widget.delay == null) {
      _controller.forward().then((value) {
        if (widget.whenComplete != null) {
          widget.whenComplete!();
        }
        mustAnimateChild.value = false;
      });
    } else {
      Timer(Duration(milliseconds: widget.delay!), () {
        _controller.forward().then((value) {
          {
            if (widget.whenComplete != null) {
              widget.whenComplete!();
            }
            mustAnimateChild.value = false;
          }
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ValueListenableBuilder(
        valueListenable: mustAnimateChild,
        builder: ((context, value, child) => Visibility(
              visible: value,
              replacement: widget.child,
              child: SlideTransition(
                position: _animOffset,
                child: widget.child,
              ),
            )));
  }

  @override
  bool get wantKeepAlive => true;
}

class ScreenSizeTween extends Tween<Offset> {
  ScreenSizeTween({required Offset begin, required Offset end})
      : super(begin: begin, end: end);

  @override
  Offset lerp(double t) {
    final dx = lerpDouble(begin!.dx, end!.dx, t);
    final dy = lerpDouble(begin!.dy, end!.dy, t);
    return Offset(dx!, dy!);
  }
}
