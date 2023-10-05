import 'package:flutter/cupertino.dart';

import '../constant.dart';

class CommonCircularProgressBar extends StatelessWidget {
  const CommonCircularProgressBar({super.key, this.color = AppColor.whiteColor, this.radius = 12});
  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(color: color);
  }
}
