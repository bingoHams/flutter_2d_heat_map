import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_2d_heat_map/flutter_2d_heat_map.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Flutter2dHeatMap.updatePrivacy(true);
  Flutter2dHeatMap.setApiKey(
    webKey: '553745b28444afcc3362468fc2aeda22',
  ).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<PoiSearch> _list = [];
  int _index = 0;
  final ScrollController _controller = ScrollController();
  late AMap2DController _aMap2DController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_2d_amap'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: AMap2DHeatView(
                  onPoiSearched: (result) {
                    print(result);
                    if (result.isEmpty) {
                      print('无搜索结果返回');
                      return;
                    }
                    _controller.animateTo(0.0,
                        duration: const Duration(milliseconds: 10),
                        curve: Curves.ease);
                    setState(() {
                      _index = 0;
                      _list = result;
                    });
                  },
                  onAMap2DViewCreated: (controller) {
                    _aMap2DController = controller;
                  },
                  point: [
                    Points(lng: 116.191031, lat: 39.988585, count: 10),
                    Points(lng: 116.389275, lat: 39.925818, count: 11),
                    Points(lng: 116.287444, lat: 39.810742, count: 12),
                    Points(lng: 116.481707, lat: 39.940089, count: 13),
                    Points(lng: 116.410588, lat: 39.880172, count: 14),
                    Points(lng: 116.394816, lat: 39.91181, count: 15),
                    Points(lng: 116.416002, lat: 39.952917, count: 16)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
