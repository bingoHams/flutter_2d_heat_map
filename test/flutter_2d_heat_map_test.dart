import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_2d_heat_map/flutter_2d_heat_map.dart';
import 'package:flutter_2d_heat_map/flutter_2d_heat_map_platform_interface.dart';
import 'package:flutter_2d_heat_map/flutter_2d_heat_map_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutter2dHeatMapPlatform
    with MockPlatformInterfaceMixin
    implements Flutter2dHeatMapPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final Flutter2dHeatMapPlatform initialPlatform = Flutter2dHeatMapPlatform.instance;

  test('$MethodChannelFlutter2dHeatMap is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutter2dHeatMap>());
  });

  test('getPlatformVersion', () async {
    Flutter2dHeatMap flutter2dHeatMapPlugin = Flutter2dHeatMap();
    MockFlutter2dHeatMapPlatform fakePlatform = MockFlutter2dHeatMapPlatform();
    Flutter2dHeatMapPlatform.instance = fakePlatform;

    expect(await flutter2dHeatMapPlugin.getPlatformVersion(), '42');
  });
}
