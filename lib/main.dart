import 'dart:async';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:midad/app.dart';
import 'package:midad/core/log/app_log.dart';
import 'package:midad/initialize_app.dart';

import 'providers/observers.dart';

void main() async {
  runZonedGuarded(
    () async {
      // Initialize all necessary services and configurations
      await initializeApp();

      runApp(
        ProviderScope(
          observers: <ProviderObserver>[
            RiverpodObserver(),
          ],
          child: const App(),
        ),
      );
    },
    (error, stackTrace) {
      // Handle the error gracefully
      AppLog.error('$error');

      // You can log the error or send it to a crash reporting service
      // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}
