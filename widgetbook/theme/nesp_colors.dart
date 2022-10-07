import 'package:flutter/material.dart';

/// Todas as cores da aplicação estão concentradas nesta classe.
///
/// **Exemplo:**
/// ```dart
/// return Container(
///   color: NespColors.primary(100),
/// );
/// ```
class NespColors {
  /// **Sobre:**
  /// - *A paleta de cores primárias é usada em todos os elementos interativos, como CTAs, links, entradas, estados ativos, etc.*
  ///
  /// **Escalas:**
  /// - `50 | 10 | 20 | 30 | 40 | 50 | 60 | 70 | 80 | 900`
  ///
  /// **Como utilizar:**
  /// ```dart
  /// return Container(
  ///   color: NespColors.primary(100),
  /// );
  /// ```
  static Color primary([int? scale]) {
    if (scale == null) return _primary;

    switch (scale) {
      case 50:
        return _primary50;
      case 100:
        return _primary100;
      case 200:
        return _primary200;
      case 300:
        return _primary300;
      case 400:
        return _primary400;
      case 500:
        return _primary500;
      case 600:
        return _primary600;
      case 700:
        return _primary700;
      case 800:
        return _primary800;
      case 900:
        return _primary900;
      default:
        throw 'does not exists primary color with $scale scale.';
    }
  }

  static const Color primaryContainer = _primary50;
  static const Color onPrimaryContainer = _primary900;
  static const Color _primary = _primary500;
  static const Color _primary50 = Color(0xFFEDE7F8);
  static const Color _primary100 = Color(0xFFD0C4ED);
  static const Color _primary200 = Color(0xFFB09DE2);
  static const Color _primary300 = Color(0xFF9075D8);
  static const Color _primary400 = Color(0xFF7757CF);
  static const Color _primary500 = Color(0xFF5C3BC6);
  static const Color _primary600 = Color(0xFF5236C0);
  static const Color _primary700 = Color(0xFF432EB7);
  static const Color _primary800 = Color(0xFF3328AF);
  static const Color _primary900 = Color(0xFF250FA3);

  /// **Sobre:**
  /// - *Essas cores são usadas como suporte de cores secundárias em planos de fundo, cores de texto, separadores, modelos, etc.*
  ///
  /// **Escalas:**
  /// - `5 | 10 | 20 | 30 | 40 | 50 | 60 | 70 | 80 | 900`
  ///
  /// **Como utilizar:**
  /// ```dart
  /// return Container(
  ///   color: NespColors.neutral(100),
  /// );
  /// ```
  static Color neutral(int scale) {
    switch (scale) {
      case 50:
        return _neutral50;
      case 100:
        return _neutral100;
      case 200:
        return _neutral200;
      case 300:
        return _neutral300;
      case 400:
        return _neutral400;
      case 500:
        return _neutral500;
      case 600:
        return _neutral600;
      case 700:
        return _neutral700;
      case 800:
        return _neutral800;
      case 900:
        return _neutral900;
      default:
        throw 'does not exists neutral color with $scale scale.';
    }
  }

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color dividerLight = _neutral200;
  static const Color dividerDark = _neutral800;
  static const Color neutralContainer = _neutral200;
  static const Color onNeutralContainer = _neutral900;
  static const Color _neutral50 = Color(0xFFF9FAFB);
  static const Color _neutral100 = Color(0xFFF3F4F6);
  static const Color _neutral200 = Color(0xFFE5E7EB);
  static const Color _neutral300 = Color(0xFFD1D5DB);
  static const Color _neutral400 = Color(0xFF9CA3AF);
  static const Color _neutral500 = Color(0xFF6B7280);
  static const Color _neutral600 = Color(0xFF4B5563);
  static const Color _neutral700 = Color(0xFF374151);
  static const Color _neutral800 = Color(0xFF1A202E);
  static const Color _neutral900 = Color(0xFF111827);

  /// **Sobre:**
  /// - *Essas cores transmitem uma emoção de positividade. Geralmente usado em estados completos e de sucesso.*
  ///
  /// **Escalas:**
  /// - `5 | 10 | 20 | 30 | 40 | 50 | 60 | 70 | 80 | 900`
  ///
  /// **Como utilizar:**
  /// ```dart
  /// return Container(
  ///   color: NespColors.success(100),
  /// );
  /// ```
  static Color success(int scale) {
    switch (scale) {
      case 50:
        return _success50;
      case 100:
        return _success100;
      case 200:
        return _success200;
      case 300:
        return _success300;
      case 400:
        return _success400;
      case 500:
        return _success500;
      case 600:
        return _success600;
      case 700:
        return _success700;
      case 800:
        return _success800;
      case 900:
        return _success900;
      default:
        throw 'does not exists success color with $scale scale.';
    }
  }

  static const Color successContainer = _success50;
  static const Color onSuccessContainer = _success900;
  static const Color _success50 = Color(0xFFF0FDF4);
  static const Color _success100 = Color(0xFFDCFCE7);
  static const Color _success200 = Color(0xFFBBF7D0);
  static const Color _success300 = Color(0xFF86EFAC);
  static const Color _success400 = Color(0xFF4ADE80);
  static const Color _success500 = Color(0xFF22C55E);
  static const Color _success600 = Color(0xFF16A34A);
  static const Color _success700 = Color(0xFF15803D);
  static const Color _success800 = Color(0xFF166534);
  static const Color _success900 = Color(0xFF14532D);

  /// **Sobre:**
  /// - *Essas cores transmitem uma emoção de negatividade. Geralmente usado em estados de erro.*
  ///
  /// **Escalas:**
  /// - `5 | 10 | 20 | 30 | 40 | 50 | 60 | 70 | 80 | 900`
  ///
  /// **Como utilizar:**
  /// ```dart
  /// return Container(
  ///   color: NespColors.error(100),
  /// );
  /// ```
  static Color error(int scale) {
    switch (scale) {
      case 50:
        return _error50;
      case 100:
        return _error100;
      case 200:
        return _error200;
      case 300:
        return _error300;
      case 400:
        return _error400;
      case 500:
        return _error500;
      case 600:
        return _error600;
      case 700:
        return _error700;
      case 800:
        return _error800;
      case 900:
        return _error900;
      default:
        throw 'does not exists error color with $scale scale.';
    }
  }

  static const Color errorContainer = _error50;
  static const Color onErrorContainer = _error900;
  static const Color _error50 = Color(0xFFFEF2F2);
  static const Color _error100 = Color(0xFFFEE2E2);
  static const Color _error200 = Color(0xFFFECACA);
  static const Color _error300 = Color(0xFFFCA5A5);
  static const Color _error400 = Color(0xFFF87171);
  static const Color _error500 = Color(0xFFEF4444);
  static const Color _error600 = Color(0xFFDC2626);
  static const Color _error700 = Color(0xFFB91C1C);
  static const Color _error800 = Color(0xFF991B1B);
  static const Color _error900 = Color(0xFF7F1D1D);

  /// **Sobre:**
  /// - *Essas cores transmitem a sensação de cautela. Geralmente usado em estados de aviso.*
  ///
  /// **Escalas:**
  /// - `50 | 100 | 200 | 300 | 400 | 500 | 600 | 700 | 800 | 900`
  ///
  /// **Como utilizar:**
  /// ```dart
  /// return Container(
  ///   color: NespColors.warning(100),
  /// );
  /// ```
  static Color warning(int scale) {
    switch (scale) {
      case 50:
        return _warning50;
      case 100:
        return _warning100;
      case 200:
        return _warning200;
      case 300:
        return _warning300;
      case 400:
        return _warning400;
      case 500:
        return _warning500;
      case 600:
        return _warning600;
      case 700:
        return _warning700;
      case 800:
        return _warning800;
      case 900:
        return _warning900;
      default:
        throw 'does not exists warning color with $scale scale.';
    }
  }

  static const Color warningContainer = _warning50;
  static const Color onWarningContainer = _warning500;
  static const Color _warning50 = Color(0xFFFFFBEB);
  static const Color _warning100 = Color(0xFFFEF3C7);
  static const Color _warning200 = Color(0xFFFDE68A);
  static const Color _warning300 = Color(0xFFFCD34D);
  static const Color _warning400 = Color(0xFFFBBF24);
  static const Color _warning500 = Color(0xFFF59E0B);
  static const Color _warning600 = Color(0xFFD97706);
  static const Color _warning700 = Color(0xFFB45309);
  static const Color _warning800 = Color(0xFF92400E);
  static const Color _warning900 = Color(0xFF78350F);
}
