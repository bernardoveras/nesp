import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../theme/nesp_colors.dart';

class NespButton extends StatelessWidget {
  const NespButton(
    this.label, {
    super.key,
    this.onPressed,
    this.radius = 8.0,
    this.loading = false,
    this.suffixIcon,
    this.prefixIcon,
    this.outlined = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final double radius;
  final bool loading;
  final bool outlined;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  factory NespButton.outlined(
    String label, {
    Key? key,
    VoidCallback? onPressed,
    double radius = 8.0,
    bool loading = false,
    IconData? suffixIcon,
    IconData? prefixIcon,
  }) {
    return NespButton(
      label,
      key: key,
      loading: loading,
      onPressed: onPressed,
      outlined: true,
      prefixIcon: prefixIcon,
      radius: radius,
      suffixIcon: suffixIcon,
    );
  }

  final double _minHeight = 48.0;

  ButtonStyle _defaultStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 24)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: _minHeight),
      child: outlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: _defaultStyle(),
              child: _NespButtonChild(
                label: label,
                loading: loading,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                outlined: true,
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: _defaultStyle(),
              child: _NespButtonChild(
                label: label,
                loading: loading,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
              ),
            ),
    );
  }
}

class _NespButtonChild extends StatelessWidget {
  const _NespButtonChild({
    required this.label,
    required this.loading,
    required this.suffixIcon,
    required this.prefixIcon,
    this.outlined = false,
  });

  final bool loading;
  final String label;
  final bool outlined;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double gap = scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        final offsetAnimation = Tween(
          begin: const Offset(0.0, 0.5),
          end: const Offset(0.0, 0.0),
        ).animate(animation);
        final fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(animation);
        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        );
      },
      switchInCurve: Curves.linearToEaseOut,
      switchOutCurve: Curves.linearToEaseOut,
      child: loading
          ? SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                color: outlined ? NespColors.primary() : Colors.white,
                strokeWidth: 2.5,
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (prefixIcon != null) ...{
                  Icon(
                    prefixIcon,
                  ),
                  SizedBox(width: gap),
                },
                Flexible(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (suffixIcon != null) ...{
                  SizedBox(width: gap),
                  Icon(
                    suffixIcon,
                  ),
                },
              ],
            ),
    );
  }
}
