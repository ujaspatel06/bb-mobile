import 'package:flutter/material.dart';

class AnimatedListItem extends StatefulWidget {
  final AnimationController? controller;
  final Widget? child;

  const AnimatedListItem({Key? key, this.controller, this.child}) : super(key: key);


  @override
   State<AnimatedListItem> createState() => _AnimatedListItemState();

}

class _AnimatedListItemState extends State<AnimatedListItem> {
  Animation<double>? _opacityAnimation;
  Animation<double>? _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(widget.controller!);
    _sizeAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: widget.controller!, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _sizeAnimation!,
      child: FadeTransition(
        opacity: _opacityAnimation!,
        child: widget.child,
      ),
    );
  }
}