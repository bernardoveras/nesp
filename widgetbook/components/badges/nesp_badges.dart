import 'package:flutter/material.dart';

import '../../theme/nesp_colors.dart';

// Tarefas:
// 1. Criar suffixIcon
// 2. Criar preffixIcon

enum BadgeType {
  neutral,
  primary,
  success,
  error,
  warning,
  custom,
}

/// Este componente serve como um *indicador*, utilizado frequentemente para informar *status*, etc...
/// 
/// Exemplo:
/// ```dart
/// return NespBadges.success(
///   'Enviado',
/// );
/// ```
class NespBadges extends StatelessWidget {
  const NespBadges(
    this.label, {
    super.key,
    this.type = BadgeType.custom,
    this.radius = 4,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
  });

  final String label;
  final BadgeType type;
  final double radius;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  factory NespBadges.neutral(
    String label, {
    double radius = 4,
    VoidCallback? onPressed,
  }) =>
      NespBadges(
        label,
        type: BadgeType.neutral,
        onPressed: onPressed,
        radius: radius,
      );

  factory NespBadges.primary(
    String label, {
    double radius = 4,
    VoidCallback? onPressed,
  }) =>
      NespBadges(
        label,
        type: BadgeType.primary,
        onPressed: onPressed,
        radius: radius,
      );

  factory NespBadges.success(
    String label, {
    double radius = 4,
    VoidCallback? onPressed,
  }) =>
      NespBadges(
        label,
        type: BadgeType.success,
        onPressed: onPressed,
        radius: radius,
      );

  factory NespBadges.error(
    String label, {
    double radius = 4,
    VoidCallback? onPressed,
  }) =>
      NespBadges(
        label,
        type: BadgeType.error,
        onPressed: onPressed,
        radius: radius,
      );

  factory NespBadges.warning(
    String label, {
    double radius = 4,
    VoidCallback? onPressed,
  }) =>
      NespBadges(
        label,
        type: BadgeType.warning,
        onPressed: onPressed,
        radius: radius,
      );

  Color handleBackgroundColor(BadgeType type) {
    if (backgroundColor != null) return backgroundColor!;
    if (foregroundColor != null) return foregroundColor!.withOpacity(0.10);

    switch (type) {
      case BadgeType.primary:
        return NespColors.primaryContainer;
      case BadgeType.success:
        return NespColors.successContainer;
      case BadgeType.error:
        return NespColors.errorContainer;
      case BadgeType.warning:
        return NespColors.warningContainer;
      case BadgeType.neutral:
        return NespColors.neutralContainer;
      default:
        return NespColors.neutralContainer;
    }
  }

  Color handleForegroundColor(BadgeType type) {
    if (foregroundColor != null) return foregroundColor!;
    switch (type) {
      case BadgeType.primary:
        return NespColors.onPrimaryContainer;
      case BadgeType.success:
        return NespColors.onSuccessContainer;
      case BadgeType.error:
        return NespColors.onErrorContainer;
      case BadgeType.warning:
        return NespColors.onWarningContainer;
      case BadgeType.neutral:
        return NespColors.onNeutralContainer;
      default:
        return NespColors.onNeutralContainer;
    }
  }

  Color handleBackgroundHoverColor(BadgeType type) {
    return handleForegroundColor(type).withOpacity(0.10);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: handleBackgroundColor(type),
      borderRadius: BorderRadius.circular(radius),
      type: MaterialType.button,
      child: InkWell(
        hoverColor: handleBackgroundHoverColor(type),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(radius),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            label,
            style: TextStyle(
              color: handleForegroundColor(type),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
