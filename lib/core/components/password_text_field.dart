
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.validator, this.controller, this.textInputAction});
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isPasswordHidden,
      maxLines: 1,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: 'Type here',
        hintStyle: ts18Hint400,
        filled: true,
        fillColor: AppColors.cTextFieldbg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        suffixIcon: SuffixPasswordIcon(
          isPasswordHidden: _isPasswordHidden,
          onToggle: () {
            setState(() {
              _isPasswordHidden = !_isPasswordHidden;
            });
          },
        ),
      ),
    );
  }
}

class SuffixPasswordIcon extends StatefulWidget {
  const SuffixPasswordIcon({
    super.key,
    required this.isPasswordHidden,
    required this.onToggle,
  });

  final bool isPasswordHidden;
  final VoidCallback onToggle;

  @override
  State<SuffixPasswordIcon> createState() => _SuffixPasswordIconState();
}

class _SuffixPasswordIconState extends State<SuffixPasswordIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.isPasswordHidden ? Icons.visibility : Icons.visibility_off,
      ),
      onPressed: widget.onToggle,
    );
  }
}
