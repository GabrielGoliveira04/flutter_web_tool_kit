import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_tool_kit/widgets/template/web_structure/structure_scroll_controller.dart';

class DelayedFadeAnimationWidget extends StatefulWidget {
  final Widget child;
  final int? delay;
  final Duration? duration;
  final Curve curve;
  final GlobalKey widgetKey;
  final Function()? whenComplete;

  const DelayedFadeAnimationWidget(
      {super.key,
      required this.child,
      this.delay,
      this.duration,
      this.curve = Curves.decelerate,
      required this.widgetKey,
      this.whenComplete});

  @override
  DelayedFadeAnimationWidgetState createState() =>
      DelayedFadeAnimationWidgetState();
}

class DelayedFadeAnimationWidgetState extends State<DelayedFadeAnimationWidget>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;
  late Animation<double> _animOpacity;
  late final ScrollController? _scrollController;

  final ValueNotifier<bool> mustAnimateChild = ValueNotifier<bool>(true);

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: widget.duration ?? const Duration(milliseconds: 800));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _controller);
    _animOpacity = Tween<double>(begin: 0, end: 1).animate(curve);

    super.initState();
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
        builder: (context, value, child) => Visibility(
              visible: value,
              replacement: widget.child,
              child: FadeTransition(
                opacity: _animOpacity,
                child: widget.child,
              ),
            ));
  }

  @override
  bool get wantKeepAlive => true;
}
