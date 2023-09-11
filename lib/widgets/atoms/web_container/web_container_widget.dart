import 'package:flutter/material.dart';

class WebSectionWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? background;
  final bool backgroundOverlay;
  final Color backgroundOverlayColor;
  final double backgroundOverlayOpacity;
  final double? height;
  final double? width;
  final BoxBorder? border;
  final List<Widget> children;
  final MainAxisAlignment childrenMainAxisAlignment;
  final MainAxisSize childrenMainAxisSize;
  final CrossAxisAlignment childrenCrossAxisAlignment;
  final EdgeInsetsGeometry padding;
  const WebSectionWidget(
      {this.backgroundColor,
      this.background,
      this.backgroundOverlay = false,
      this.backgroundOverlayColor = Colors.black,
      this.backgroundOverlayOpacity = 0.5,
      this.height,
      this.width,
      Key? key,
      this.border,
      this.children = const [],
      this.childrenMainAxisAlignment = MainAxisAlignment.start,
      this.childrenMainAxisSize = MainAxisSize.max,
      this.childrenCrossAxisAlignment = CrossAxisAlignment.center,
      this.padding = const EdgeInsets.all(8)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'WebSectionWidget',
      hint: 'This is WebSectionWidget',
      tooltip: 'WebSectionWidget',
      child: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: height ?? 0,
            minWidth: width ?? double.infinity,
            maxHeight: constraints.maxHeight,
          ),
          child: Stack(children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    color: backgroundColor ??
                        Theme.of(context).colorScheme.background,
                    border: border ??
                        Border.all(
                            color: backgroundColor ??
                                Theme.of(context).colorScheme.background)),
                child: Visibility(
                    visible: background != null,
                    child: background ?? const Offstage()),
              ),
            ),
            Container(
              padding: padding,
              constraints: BoxConstraints(
                minHeight: height ?? 0,
                minWidth: width ?? double.infinity,
                maxHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: childrenMainAxisAlignment,
                crossAxisAlignment: childrenCrossAxisAlignment,
                mainAxisSize: childrenMainAxisSize,
                children: [...children],
              ),
            ),
            Positioned.fill(
              child: Visibility(
                  visible: backgroundOverlay,
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: height ?? MediaQuery.of(context).size.height,
                        minWidth: double.infinity),
                    color: backgroundOverlayColor
                        .withOpacity(backgroundOverlayOpacity),
                  )),
            ),
          ]),
        );
      }),
      // child: Container(
      //   constraints: BoxConstraints(
      //       minHeight: height ?? MediaQuery.of(context).size.height,
      //       minWidth: double.infinity),
      //   child: Stack(
      //     children: [
      //       Positioned.fill(
      //         child: Container(
      //           decoration: BoxDecoration(
      //               color: backgroundColor ??
      //                   Theme.of(context).colorScheme.background,
      //               border: border ??
      //                   Border.all(
      //                       color: backgroundColor ??
      //                           Theme.of(context).colorScheme.background)),
      //           child: Visibility(
      //               visible: background != null,
      //               child: background ?? Container()),
      //         ),
      //       ),
      //       Positioned.fill(
      //         child: Padding(
      //           padding: padding,
      //           child: Column(
      //             mainAxisAlignment: childrenMainAxisAlignment,
      //             crossAxisAlignment: childrenCrossAxisAlignment,
      //             mainAxisSize: childrenMainAxisSize,
      //             children: children,
      //           ),
      //         ),
      //       ),
      //       Visibility(
      //           visible: backgroundOverlay,
      //           child: Container(
      //             constraints: BoxConstraints(
      //                 minHeight: height ?? MediaQuery.of(context).size.height,
      //                 minWidth: double.infinity),
      //             color: backgroundOverlayColor
      //                 .withOpacity(backgroundOverlayOpacity),
      //           )),
      // Positioned(
      //     right: 0,
      //     bottom: 10,
      //     child: Container(
      //         height: 150,
      //         width: 90,
      //         decoration: const BoxDecoration(
      //           color: Colors.amber,
      //           borderRadius: BorderRadius.only(
      //               topLeft: Radius.circular(360),
      //               bottomLeft: Radius.circular(360)),
      //         ))),
    );
  }

  WebSectionWidget copyWith({
    Color? backgroundColor,
    Widget? background,
    bool? backgroundOverlay,
    Color? backgroundOverlayColor,
    double? backgroundOverlayOpacity,
    double? height,
    double? width,
    BoxBorder? border,
    MainAxisAlignment? childrenMainAxisAlignment,
    MainAxisSize? childrenMainAxisSize,
    CrossAxisAlignment? childrenCrossAxisAlignment,
    EdgeInsetsGeometry? padding,
  }) {
    return WebSectionWidget(
      background: background ?? this.background,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOverlay: backgroundOverlay ?? this.backgroundOverlay,
      backgroundOverlayColor:
          backgroundOverlayColor ?? this.backgroundOverlayColor,
      backgroundOverlayOpacity:
          backgroundOverlayOpacity ?? this.backgroundOverlayOpacity,
      height: height ?? this.height,
      width: width ?? this.width,
      border: border ?? this.border,
      childrenMainAxisAlignment:
          childrenMainAxisAlignment ?? this.childrenMainAxisAlignment,
      childrenMainAxisSize: childrenMainAxisSize ?? this.childrenMainAxisSize,
      childrenCrossAxisAlignment:
          childrenCrossAxisAlignment ?? this.childrenCrossAxisAlignment,
      padding: padding ?? this.padding,
      children: children,
    );
  }
}
