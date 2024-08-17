import 'package:flutter/material.dart';
import 'package:social_feed_task/services/responsive_services/responsive_service.dart';

class KButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final double borderWidth;
  final Widget? icon;

  const KButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50.0,
    this.backgroundColor = Colors.blue,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 16),
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.all(16.0),
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveService.scaleWidth(context, width),
      height: ResponsiveService.scaleHeight(context, height),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
          padding: padding,
        ),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  const SizedBox(width: 5),
                  Text(text, style: textStyle),
                ],
              )
            : Text(text, style: textStyle),
      ),
    );
  }
}