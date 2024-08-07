import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.inputType,
    this.prefix,
    this.onSuffixTap,
  });

  final TextEditingController controller;
  final String title;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onSuffixTap;
  final TextInputType? inputType;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      readOnly: readOnly,
      onTap: onTap,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: title,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Color(0xFF828282),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE0E0E0),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE0E0E0),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        prefix: prefix,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.black,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFE0E0E0),
                    shape: BoxShape.circle,
                  ),
                  height: 20,
                  width: 20,
                  child: IconButton(
                    onPressed: onSuffixTap,
                    icon: Icon(
                      suffixIcon,
                      color: Colors.black,
                      size: 14,
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
