import 'package:flutter/material.dart';

class TRoundedBottomContainer extends StatelessWidget {
  const TRoundedBottomContainer({
    super.key,
    this.child,
    this.width = 430,
    this.height = 289,
    this.padding = 0,
    this.centerColor = const Color(0xFF4254B5),
    this.outerColor,
  });

  final Widget? child;
  final double width;
  final double height;
  final double padding;
  final Color centerColor;
  final Color? outerColor;

  @override
  Widget build(BuildContext context) {
    final effectiveOuterColor = outerColor ?? centerColor.withOpacity(0.1);

    final double radius = width * 0.15;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
        gradient: RadialGradient(
          colors: [centerColor, effectiveOuterColor],
          center: Alignment.center,
          radius: 0.8,
        ),
      ),
      child: child,
    );
  }
}
