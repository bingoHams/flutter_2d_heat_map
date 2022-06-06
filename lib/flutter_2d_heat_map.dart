
import 'package:flutter/foundation.dart';

import 'flutter_2d_heat_map_platform_interface.dart';

export 'src/amap_2d_heat_view.dart';
export 'src/amap_2d_view.dart';
export 'src/interface/amap_2d_controller.dart';
export 'src/poi_search_model.dart';

class Flutter2dHeatMap {
  Future<String?> getPlatformVersion() {
    return Flutter2dHeatMapPlatform.instance.getPlatformVersion();
  }


  static String _webKey = '';
  static String get webKey => _webKey;

  static Future<bool?> setApiKey({String iOSKey = '', String webKey = ''}) async {
    if (kIsWeb) {
      _webKey = webKey;
    } else {
      // if (Platform.isIOS) {
      //   return _channel.invokeMethod<bool>('setKey', iOSKey);
      // }
    }
    return Future.value(true);
  }
}
