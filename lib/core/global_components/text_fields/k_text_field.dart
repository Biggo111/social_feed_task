import 'package:flutter/material.dart';
import 'package:social_feed_task/core/constants/asset_path.dart';
import 'package:social_feed_task/services/responsive_services/responsive_service.dart';

class KTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Color borderColor;
  final TextStyle textStyle;
  final double width;
  final double height;
  final Widget? icon;
  final bool showPassword;
  final VoidCallback? onTogglePasswordVisibility;

  const KTextField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.borderColor = Colors.grey,
    this.textStyle = const TextStyle(),
    this.width = double.infinity,
    this.height = 56.0,
    this.icon,
    this.showPassword = false,
    this.onTogglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != double.infinity
          ? ResponsiveService.scaleWidth(context, width)
          : double.infinity,
      height: ResponsiveService.scaleHeight(context, height),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          icon != null ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: icon,
          ) : Container(),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              validator: validator,
              style: textStyle,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: textStyle.copyWith(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: ResponsiveService.scaleWidth(context, 10.0),
                  vertical: ResponsiveService.scaleHeight(context, 11.0),
                ),
              ),
            ),
          ),
          if(showPassword) ...[
            GestureDetector(
              onTap: onTogglePasswordVisibility,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  !obscureText
                      ? AssetPath.showPasswordIcon
                      : AssetPath.hidePasswordIcon,
                  width: 16,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
