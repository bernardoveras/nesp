import 'package:flutter/material.dart';

import 'nesp_dialog_button_props.dart';
import 'nesp_dialog_content.dart';

/// Serviço para exibir dialog's sem precisar informar o contexto.
///
/// **Como utilizar:**
/// Para utilizar o `NespDialog` você deve primeiramente inicializar o serviço no arquivo de inicialização informando
/// o `navigatorKey` da aplicação.
///
/// ```dart
/// class AppName extends StatefulWidget {
///   const AppName({super.key});
///   @override
///   State<AppName> createState() => _AppNameState();
/// }
///
/// class _AppNameState extends State<AppName> {
///   final _navigatorKey = GlobalKey<NavigatorState>();
///
///   @override
///   void initState() {
///     super.initState();
///     NespDialog.init(_navigatorKey);
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(navigatorKey: _navigatorKey);
///   }
/// }
/// ```
class NespDialog {
  static late final GlobalKey<NavigatorState> _navigatorKey;

  static init(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  static Future<T?> show<T>({
    required String title,
    String? description,
    Widget? content,
    NespDialogButtonProps? primaryButtonSettings,
    NespDialogButtonProps? secondaryButtonSettings,
  }) async {
    if (_navigatorKey.currentState == null) return null;

    return showDialog(
      context: _navigatorKey.currentState!.context,
      builder: (context) {
        return NespDialogContent(
          _navigatorKey,
          title: title,
          description: description,
          content: content,
          primaryButtonSettings: primaryButtonSettings,
          secondaryButtonSettings: secondaryButtonSettings,
        );
      },
    );
  }
}
