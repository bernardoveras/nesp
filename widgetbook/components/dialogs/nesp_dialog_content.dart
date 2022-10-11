import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../buttons/button.dart';
import 'nesp_dialog_button_props.dart';

class NespDialogContent extends StatelessWidget {
  const NespDialogContent(
    this._navigatorKey, {
    super.key,
    required this.title,
    this.content,
    this.primaryButtonSettings,
    this.secondaryButtonSettings,
    this.description,
  });

  final GlobalKey<NavigatorState> _navigatorKey;

  final String title;
  final Widget? content;
  final String? description;

  final NespDialogButtonProps? primaryButtonSettings;
  final NespDialogButtonProps? secondaryButtonSettings;

  Widget? _content() {
    if (content != null) return content;
    if (description != null) {
      return Text(
        description!,
        style: TextStyle(
          color: NespColors.neutral(700),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          IconButton(
            icon: const Icon(Icons.close),
            color: NespColors.neutral(700),
            splashRadius: 24,
            hoverColor: NespColors.neutral(50),
            highlightColor: NespColors.neutral(100),
            splashColor: Colors.transparent,
            onPressed: () {
              _navigatorKey.currentState!.pop();
            },
          ),
        ],
      ),
      titleTextStyle: TextStyle(
        color: NespColors.neutral(900),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      content: _content(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      actionsPadding: const EdgeInsets.all(16),
      actions: [
        if (secondaryButtonSettings != null) ...{
          NespButton.outlined(
            secondaryButtonSettings!.label,
            loading: secondaryButtonSettings!.loading,
            onPressed: () {
              if (secondaryButtonSettings!.loading) return;

              if (secondaryButtonSettings!.closeOnTap) {
                _navigatorKey.currentState!.pop();
              }

              if (secondaryButtonSettings!.onPressed != null) {
                secondaryButtonSettings!.onPressed!.call();
              }
            },
          ),
        },
        if (primaryButtonSettings != null) ...{
          NespButton(
            primaryButtonSettings!.label,
            loading: primaryButtonSettings!.loading,
            onPressed: () {
              if (primaryButtonSettings!.loading) return;

              if (primaryButtonSettings!.closeOnTap) {
                _navigatorKey.currentState!.pop();
              }
              if (primaryButtonSettings!.onPressed != null) {
                primaryButtonSettings!.onPressed!.call();
              }
            },
          ),
        },
      ],
    );
  }
}
