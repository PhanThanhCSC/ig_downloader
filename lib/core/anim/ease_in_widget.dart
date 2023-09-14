import 'package:flutter/material.dart';

class EaseInWidget extends StatefulWidget {
  final Widget child;
  Function? onTap;

  EaseInWidget({Key? key, required this.child, this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EaseInWidgetState();
}

class _EaseInWidgetState extends State<EaseInWidget> with TickerProviderStateMixin<EaseInWidget> {
  late AnimationController controller;

  // late Animation<double> easeInAnimation;
  Tween<double> _tween = Tween(begin: 1, end: 0.8);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
    // controller.repeat(reverse: true);
    /*  controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 100,
        ),
        value: 1.0);
    easeInAnimation = Tween(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInCubic,
      ),
    );
    controller.reverse();*/
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap == null) {
          return;
        }
        controller.forward().then((val) {
          // widget.onTap();
          controller.reverse().then((val) {
            // widget.onTap();
          });
        });
        widget.onTap != null ? widget.onTap!() : () {};
      },
      child: ScaleTransition(
          scale: _tween.animate(CurvedAnimation(parent: controller, curve: Curves.easeIn)),
          // scale: _tween.animate(CurvedAnimation(parent: controller, curve: Curves.elasticIn)),
          child: widget.child), /*ScaleTransition(
        scale: easeInAnimation,
        child: widget.child,
      ),*/
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
