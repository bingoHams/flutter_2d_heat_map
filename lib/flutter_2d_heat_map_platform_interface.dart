import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_2d_heat_map_method_channel.dart';

abstract class Flutter2dHeatMapPlatform extends PlatformInterface {
  /// Constructs a Flutter2dHeatMapPlatform.
  Flutter2dHeatMapPlatform() : super(token: _token);

  static final Object _token = Object();

  static Flutter2dHeatMapPlatform _instance = MethodChannelFlutter2dHeatMap();

  /// The default instance of [Flutter2dHeatMapPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutter2dHeatMap].
  static Flutter2dHeatMapPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Flutter2dHeatMapPlatform] when
  /// they register themselves.
  static set instance(Flutter2dHeatMapPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
