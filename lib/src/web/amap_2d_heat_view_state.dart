// ignore: avoid_web_libraries_in_flutter
import 'dart:convert';
import 'dart:html';
import 'dart:js_util';
import 'dart:ui' as ui;

import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2d_heat_map/flutter_2d_heat_map.dart';
import 'package:js/js.dart';
import 'amapjs.dart';
import 'loaderjs.dart';

class AMap2DHeatViewState extends State<AMap2DHeatView> {
  /// 加载的插件
  final List<String> plugins = <String>[
    'AMap.Heatmap',
    'AMap.Scale',
    // 'AMap.ToolBar'
  ];

  late AMap _aMap;
  late String _divId;
  late DivElement _element;

  void _onPlatformViewCreated() {
    final Object promise = load(LoaderOptions(
      key: Flutter2dHeatMap.webKey,
      version: '1.4.15', // 2.0需要修改GeolocationOptions属性
      plugins: plugins,
    )) as Object;

    promiseToFuture<dynamic>(promise).then((dynamic value) {
      final MapOptions _mapOptions = MapOptions(
          zoom: 11,
          resizeEnable: true,
          center: LngLat(121.498586,31.239637),
          mapStyle: 'amap://styles/darkblue');

      /// 无法使用id https://github.com/flutter/flutter/issues/40080
      _aMap = AMap(_element, _mapOptions);

      List<Points> points = widget.point;

      /// 加载插件
      _aMap.plugin(plugins, allowInterop(() {
        print("开始加载");
        _aMap.addControl(Scale());
        // _aMap.addControl(ToolBar());
        final HeatMap heatmap = HeatMap(_aMap, HeatmapOptions(radius: 10));
        // print('${HeatMap(_aMap, HeatmapOptions(radius: 10))}');
        heatmap.addDataPoint(116.389275, 39.925818, 11);
        heatmap.setOptions(HeatmapOptions(radius: 25));
        // heatmap.addDataPoint(116.191031, 39.988585, 10);
        // heatmap.setDataSet({"data": [
        //   {"lng": 116.287444, "lat": 39.810742, "count": 12},
        //   {"lng": 116.481707, "lat": 39.940089, "count": 13},
        //   {"lng": 116.410588, "lat": 39.880172, "count": 14},
        //   {"lng": 116.394816, "lat": 39.91181, "count": 15},
        //   {"lng": 116.416002, "lat": 39.952917, "count": 16}
        // ], "max": 10});
        // heatmap.hide();
        //   heatmap.setDataSet('{"data":[{"lng":116.191031,"lat":39.988585,"count":10},{"lng":116.389275,"lat":39.925818,"count":11},{"lng":116.287444,"lat":39.810742,"count":12},{"lng":116.481707,"lat":39.940089,"count":13},{"lng":116.410588,"lat":39.880172,"count":14},{"lng":116.394816,"lat":39.91181,"count":15},{"lng":116.416002,"lat":39.952917,"count":16}],"max":100}');
        // _aMap.addControl(Scale());
        heatmap.setDataSet(DataSet(data: points.toList(), max: 100));
      }));
    }, onError: (dynamic e) {
      print('初始化错误：$e');
    });
  }

  @override
  void dispose() {
    _aMap.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _divId = DateTime.now().toIso8601String();

    /// 先创建div并注册
    // ignore: undefined_prefixed_name,avoid_dynamic_calls
    ui.platformViewRegistry.registerViewFactory(_divId, (int viewId) {
      _element = DivElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.margin = '0';

      return _element;
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      /// 创建地图
      _onPlatformViewCreated();
    });
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: _divId,
    );
  }
}
