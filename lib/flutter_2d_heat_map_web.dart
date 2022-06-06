// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'flutter_2d_heat_map_method_channel.dart';
import 'flutter_2d_heat_map_platform_interface.dart';

/// A web implementation of the Flutter2dHeatMapPlatform of the Flutter2dHeatMap plugin.
class Flutter2dHeatMapWeb extends Flutter2dHeatMapPlatform {
  /// Constructs a Flutter2dHeatMapWeb
  Flutter2dHeatMapWeb();

  static void registerWith(Registrar registrar) {
    // MethodChannelFlutter2dHeatMap().methodChannel== MethodChannel(
    //   'flutter_barcode_sdk',
    //   const StandardMethodCodec(),
    //   registrar,
    // );

    final MethodChannel channel = MethodChannel(
      'flutter_barcode_sdk',
      const StandardMethodCodec(),
      registrar,
    );

    // Flutter2dHeatMapPlatform.instance = Flutter2dHeatMapWeb();
    final pluginInstance = Flutter2dHeatMapWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getPlatformVersion':
        return getPlatformVersion();

    }
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }
}
