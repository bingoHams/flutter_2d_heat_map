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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
