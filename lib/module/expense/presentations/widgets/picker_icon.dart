import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PickerIcon extends StatelessWidget {
  final String assetPath;
  final double width;
  final double height;
  final Color? color;
  final EdgeInsetsGeometry padding;

  const PickerIcon({
    super.key,
    required this.assetPath,
    this.width = 24,
    this.height = 24,
    this.color,
    this.padding = const EdgeInsets.all(0),
  });

  bool get isSvg => assetPath.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    final child = isSvg
        ? SvgPicture.asset(
      assetPath,
      width: width - padding.horizontal,
      height: height - padding.vertical,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    )
        : Image.asset(
      assetPath,
      width: width - padding.horizontal,
      height: height - padding.vertical,
      color: color,
    );

    return Container(
      width: width,
      height: height,
      padding: padding,
      child: child,
    );
  }
}