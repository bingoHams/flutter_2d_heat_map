import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_2d_heat_map_platform_interface.dart';

/// An implementation of [Flutter2dHeatMapPlatform] that uses method channels.
class MethodChannelFlutter2dHeatMap extends Flutter2dHeatMapPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_2d_heat_map');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
