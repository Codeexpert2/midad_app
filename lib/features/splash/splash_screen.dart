import 'package:flutter/material.dart';

import 'package:midad/components/loading/loading_widget.dart';
import 'package:midad/core/constants/images.dart';
import 'package:midad/core/extensions/context_ext.dart';
import 'package:midad/core/locale/generated/l10n.dart';
import 'package:midad/core/router/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.go(AppRoutes.home.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset(
              AppImages.imagesMidadLogo,
              width: context.width * 0.75,
            ),
            const SizedBox(height: 24),
            const LoadingWidget(),
            const Spacer(),
            Text(S.of(context).devlopedBy),
            Image.asset(
              AppImages.imagesCodeExpert,
              width: context.width / 3,
            ),
            const SizedBox(height: kToolbarHeight),
          ],
        ),
      ),
    );
  }
}
