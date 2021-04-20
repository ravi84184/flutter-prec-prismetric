import 'package:flutter/cupertino.dart';

class AppGestureDetector extends StatelessWidget {
  final Widget child;
  final Function()? onTap;

  const AppGestureDetector({Key? key, required this.child, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: onTap,
    );
  }
}
