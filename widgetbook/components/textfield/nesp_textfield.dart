import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/theme.dart';

class NespTextField extends StatelessWidget {
  const NespTextField({
    super.key,
    this.label,
    this.hintText,
    this.onChanged,
    this.autovalidateMode,
    this.inputFormatters,
    this.keyboardType,
  });

  final String? label;
  final String? hintText;
  final ValueChanged? onChanged;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...{
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              label!,
              style: TextStyle(
                color: NespColors.neutral(500),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        },
        TextFormField(
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          cursorColor: NespColors.primary(),
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          style: TextStyle(
            color: NespColors.neutral(700),
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: NespColors.neutral(200),
            focusColor: NespColors.neutral(300),
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintStyle: TextStyle(
              color: NespColors.neutral(400),
              fontWeight: FontWeight.w400,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: NespColors.primary(),
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ],
    );
  }
}
