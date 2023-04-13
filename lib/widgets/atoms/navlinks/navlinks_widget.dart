import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NavlinksWidget extends StatefulWidget {
  final TextStyle? style;
  final TextStyle? hoverStyle;
  final Function()? onTap;
  final String label;
  const NavlinksWidget({
    Key? key,
    this.style,
    this.hoverStyle,
    this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  State<NavlinksWidget> createState() => _NavlinksWidgetState();
}

class _NavlinksWidgetState extends State<NavlinksWidget> {
  late final ValueNotifier<TextStyle?> style;

  @override
  void initState() {
    style = ValueNotifier<TextStyle?>(widget.style);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
        label: 'Navlinks',
        hint: 'This is Navlinks',
        tooltip: 'Navlinks',
        child: ValueListenableBuilder<TextStyle?>(
            valueListenable: style,
            builder: (context, value, child) => SelectableText.rich(
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = widget.onTap,
                    text: widget.label,
                    style: value,
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onEnter: (event) {
                      style.value = widget.hoverStyle;
                    },
                    onExit: (event) {
                      style.value = widget.style;
                    },
                  ),
                  maxLines: 1,
                  showCursor: true,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                )));
  }
}
