// ignore: avoid_web_libraries_in_flutter
import 'dart:convert';
import 'dart:html';
import 'dart:js_util';
import 'dart:ui' as ui;

import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_2d_heat_map/flutter_2d_heat_map.dart';
import 'package:js/js.dart';
import 'amap_2d_controller.dart';
import 'amap_2d_heat_controller.dart';
import 'amapjs.dart';
import 'loaderjs.dart';

class AMap2DHeatViewState extends State<AMap2DHeatView> {
  /// 加载的插件
  final List<String> plugins = <String>[
    'AMap.Heatmap',
    'AMap.Scale',
    // 'AMap.Geolocation',
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
          center: LngLat(121.498586, 31.239637),
          mapStyle: 'amap://styles/darkblue'
      );

      /// 无法使用id https://github.com/flutter/flutter/issues/40080
      _aMap = AMap(_element, _mapOptions);

      // List<Points> points = widget.point;

      /// 加载插件
      _aMap.plugin(plugins, allowInterop(() {
        print("开始加载");
        _aMap.addControl(Scale());
        // _aMap.addControl(ToolBar());
        // final HeatMap heatmap = HeatMap(_aMap, HeatmapOptions(radius: 10));
        // // heatmap.addDataPoint(116.389275, 39.925818, 11);
        // heatmap.setOptions(HeatmapOptions(radius: 25, opacity: [
        //   0,
        //   0.2
        // ], gradient: {
        //   0.4: 'rgb(0, 255, 255)',
        //   0.65: 'rgb(0, 110, 255)',
        //   0.85: 'rgb(100, 0, 255)',
        //   1.0: 'rgb(100, 0, 255)'
        // }));
        // heatmap.setDataSet(DataSet(data: widget.point.toList()));

        final AMap2DHeatWebController controller =
            AMap2DHeatWebController(_aMap, widget);
        if (widget.onAMap2DViewCreated != null) {
          widget.onAMap2DViewCreated!(controller);
        }
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
