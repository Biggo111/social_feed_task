import 'package:flutter/material.dart';
import 'package:social_feed_task/services/responsive_services/responsive_service.dart';

class KDropdownButton<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final double width;
  final double height;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final double borderWidth;
  final String hint;

  const KDropdownButton({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.width = double.infinity,
    this.height = 50.0,
    this.backgroundColor = Colors.white,
    this.textStyle = const TextStyle(color: Colors.black, fontSize: 16),
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    this.hint = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveService.scaleWidth(context, width),
      height: ResponsiveService.scaleHeight(context, height),
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          style: textStyle,
          isExpanded: true,
          hint: Text(hint, style: textStyle),
          dropdownColor: backgroundColor,
        ),
      ),
    );
  }
}
