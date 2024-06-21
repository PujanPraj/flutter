import 'package:flutter/material.dart';
import 'package:musicalapp/constants/colors.dart';

class CTextField extends StatefulWidget {
  final String hint;
  final Widget preIcon;
  final bool obscureText;
  final Widget? suffIcon;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final VoidCallback? onChanged;

  const CTextField(
      {Key? key,
      required this.hint,
      required this.preIcon,
      this.obscureText = false,
      this.suffIcon,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.controller,
      this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: (_) {
        widget.onChanged?.call();
      },
      obscureText: _obscureText,
      style: const TextStyle(color: textColor),
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle:
              const TextStyle(color: textColor, fontWeight: FontWeight.w400),
          prefixIcon: widget.preIcon,
          suffixIcon: widget.suffIcon != null
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: textColor,
                  ),
                )
              : null,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: primaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: inputFocus,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: inputFocus,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          errorStyle: const TextStyle(fontSize: 18)),
    );
  }
}
