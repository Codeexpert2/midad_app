import 'package:flutter/material.dart';

import 'package:midad/core/constants/images.dart';
import 'package:midad/core/extensions/context_ext.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      context.isDark ? AppImages.imagesMidadLogoG : AppImages.imagesMidadLogo,
      width: width,
    );
  }
}
