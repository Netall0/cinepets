import 'dart:developer';

import 'package:cinepets/feature/app/widget/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

sealed class AppRunner {
  static Future<void> run({String? sentryDsn}) async {
    final bindings =
        WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

    final Stopwatch stopwatch = Stopwatch()..start();

    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      log('FlutterError', error: details.exception, stackTrace: details.stack);
    };

    PlatformDispatcher.instance.onError = (error, stackTrace) {
      log('PlatformDispatcher', error: error, stackTrace: stackTrace);
      return true;
    };

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    try {
      log('Starting app');
      log('starting app d');

      runApp(
        App()
      );
      stopwatch.stop();
      log(
        'application started in ${stopwatch.elapsedMilliseconds} ms',
      );
    } on Object catch (e) {
      log('Error', error: e);
      log(e.toString(),);
      runApp(ErrorWidget(e));
    } finally {
      bindings.addPostFrameCallback((_) {
        bindings.allowFirstFrame();
      });
    }
  }
}
