import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  /// Creates a linear gradient with MaterialColor
  final MaterialColor linearGradientColor;

  /// A gradient to use filling the button
  ///
  /// if this is specified [linearGradientColor] has no effect
  final Gradient? gradient;
  final BorderRadiusGeometry borderRadius;
  final void Function()? onPressed;
  final Widget? child;

  const GradientButton({
    Key? key,
    this.linearGradientColor = Colors.blue,
    required this.onPressed,
    this.gradient,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(6.0)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient ??
            LinearGradient(
              colors: [
                linearGradientColor.shade900,
                linearGradientColor,
                linearGradientColor.shade300,
              ],
            ),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.transparent,
          ),
        ),
        child: child,
      ),
    );
  }
}
