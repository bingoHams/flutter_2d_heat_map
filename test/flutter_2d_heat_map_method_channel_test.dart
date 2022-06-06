import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_2d_heat_map/flutter_2d_heat_map_method_channel.dart';

void main() {
  MethodChannelFlutter2dHeatMap platform = MethodChannelFlutter2dHeatMap();
  const MethodChannel channel = MethodChannel('flutter_2d_heat_map');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
