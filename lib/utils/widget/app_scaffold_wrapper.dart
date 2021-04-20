import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppScaffoldWrapper extends StatelessWidget {
  final Color? statusColor;
  final WillPopCallback? isPopFun;
  final Widget child;
  final top;

  AppScaffoldWrapper({
    Key? key,
    this.isPopFun,
    required this.child,
    this.top = true,
    this.statusColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.statusColor ?? AppColors.statusBarColor,
      child: SafeArea(
        bottom: false,
        top: top,
        child: WillPopScope(
          onWillPop:
              isPopFun == null ? () => Future.value(true) : this.isPopFun,
          child: this.child,
        ),
      ),
    );
  }
}
