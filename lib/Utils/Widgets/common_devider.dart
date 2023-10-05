import 'package:flutter/material.dart';

class CommonDivicer extends StatelessWidget {
  const CommonDivicer(
      {super.key,
      this.color = Colors.grey,
      this.startIntent = 0,
      this.endIntent = 0,
      this.thickness = 1});
  final Color color;
  final double startIntent;
  final double endIntent;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: color,
        endIndent: endIntent,
        indent: startIntent,
        thickness: thickness);
  }
}
