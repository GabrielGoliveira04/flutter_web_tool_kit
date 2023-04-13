import 'package:flutter/material.dart';
import 'package:flutter_web_tool_kit/widgets/atoms/navlinks/navlinks_widget.dart';

//TODO: Criar navbar fixedAboveContent

class WebNavbarWidget extends StatefulWidget implements PreferredSizeWidget {
  final Widget? logo;
  final List<NavlinksWidget> navLinks;
  final Color? backgroundColor;
  final bool isFloating;
  final Color? floatingColor;
  final NavbarAlignment? navBarAlignment;
  final double navLinksSpacing;
  final double elevation;
  final EdgeInsets padding;
  final ScrollController? scrollController;
  final double size;

  const WebNavbarWidget.fixed({
    Key? key,
    this.logo,
    this.navLinks = const [],
    this.backgroundColor = Colors.transparent,
    this.navBarAlignment = NavbarAlignment.spaceBetweenLogoAndNavLinks,
    this.navLinksSpacing = 5,
    this.elevation = 1,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.size = kToolbarHeight,
  })  : isFloating = false,
        floatingColor = null,
        scrollController = null,
        super(key: key);

  const WebNavbarWidget.floating(
      {Key? key,
      this.logo,
      this.navLinks = const [],
      this.backgroundColor = Colors.transparent,
      this.floatingColor = Colors.transparent,
      this.navBarAlignment = NavbarAlignment.spaceBetweenLogoAndNavLinks,
      this.navLinksSpacing = 5,
      this.elevation = 0,
      this.scrollController,
      this.size = kToolbarHeight,
      this.padding = const EdgeInsets.symmetric(horizontal: 16)})
      : isFloating = true,
        super(key: key);

  @override
  State<WebNavbarWidget> createState() => _WebNavbarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(size);
}

class _WebNavbarWidgetState extends State<WebNavbarWidget> {
  late final ValueNotifier<Color> backgroundColor;

  @override
  void initState() {
    backgroundColor = ValueNotifier<Color>(
        widget.backgroundColor ?? Theme.of(context).colorScheme.primary);

    widget.scrollController?.addListener(() {
      if (widget.scrollController?.position.pixels !=
          widget.scrollController?.initialScrollOffset) {
        backgroundColor.value =
            widget.floatingColor ?? Theme.of(context).colorScheme.primary;
      } else {
        backgroundColor.value =
            widget.backgroundColor ?? Theme.of(context).colorScheme.primary;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
        valueListenable: backgroundColor,
        builder: (context, color, child) => AppBar(
            toolbarHeight: widget.size,
            elevation: widget.elevation,
            backgroundColor: color,
            title: _title));
  }

  Widget get _title => Padding(
        padding: widget.padding,
        child: Row(
          mainAxisAlignment: widget.navBarAlignment!.align,
          children: [
            Visibility(
                visible: widget.logo != null,
                replacement: const Offstage(),
                child: widget.logo ?? const Offstage()),
            Row(
              children: [
                const SizedBox(width: 20),
                ...widget.navLinks
                    .map((e) => Padding(
                          padding:
                              EdgeInsets.only(right: widget.navLinksSpacing),
                          child: e,
                        ))
                    .toList(),
                Visibility(
                    visible: widget.navBarAlignment!.align ==
                        NavbarAlignment.centerNavLinks,
                    child: const Offstage())
              ],
            )
          ],
        ),
      );
}

enum NavbarAlignment {
  spaceBetweenLogoAndNavLinks(align: MainAxisAlignment.spaceBetween),
  center(align: MainAxisAlignment.center),
  start(align: MainAxisAlignment.start),
  end(align: MainAxisAlignment.end),
  centerNavLinks(align: MainAxisAlignment.spaceBetween);

  final MainAxisAlignment align;

  const NavbarAlignment({required this.align});
}
