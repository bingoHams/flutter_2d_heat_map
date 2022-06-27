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
    var json=[
      {
        "longitude": 122.122334,
        "latitude": 37.504527
      },
      {
        "longitude": 121.305678,
        "latitude": 31.304861
      },
      {
        "longitude": 118.781358,
        "latitude": 34.124955
      },
      {
        "longitude": 114.409491,
        "latitude": 30.465035
      },
      {
        "longitude": 113.925891,
        "latitude": 34.672754
      },
      {
        "longitude": 121.410478,
        "latitude": 37.45727
      },
      {
        "longitude": 126.723171,
        "latitude": 45.748764
      },
      {
        "longitude": 108.373653,
        "latitude": 22.731468
      },
      {
        "longitude": 106.497253,
        "latitude": 29.598462
      },
      {
        "longitude": 114.194036,
        "latitude": 30.508757
      },
      {
        "longitude": 120.358821,
        "latitude": 30.327176
      },
      {
        "longitude": 118.798133,
        "latitude": 31.970839
      },
      {
        "longitude": 108.86787,
        "latitude": 34.170942
      },
      {
        "longitude": 104.67872,
        "latitude": 31.03304
      },
      {
        "longitude": 115.175577,
        "latitude": 33.709975
      },
      {
        "longitude": 120.414476,
        "latitude": 36.307124
      },
      {
        "longitude": 120.696027,
        "latitude": 28.037828
      },
      {
        "longitude": 118.89766,
        "latitude": 32.054257
      },
      {
        "longitude": 113.243065,
        "latitude": 22.322827
      },
      {
        "longitude": 102.434798,
        "latitude": 24.563385
      },
      {
        "longitude": 104.000427,
        "latitude": 30.567336
      },
      {
        "longitude": 114.89998,
        "latitude": 40.792839
      },
      {
        "longitude": 116.40717,
        "latitude": 39.90469
      },
      {
        "longitude": 112.553876,
        "latitude": 26.878368
      },
      {
        "longitude": 113.459041,
        "latitude": 22.56718
      },
      {
        "longitude": 114.011608,
        "latitude": 22.641226
      },
      {
        "longitude": 116.36611,
        "latitude": 39.91231
      },
      {
        "longitude": 118.89077,
        "latitude": 31.925851
      },
      {
        "longitude": 113.263342,
        "latitude": 23.173221
      },
      {
        "longitude": 116.333189,
        "latitude": 40.030127
      },
      {
        "longitude": 113.66072,
        "latitude": 34.79977
      },
      {
        "longitude": 110.883668,
        "latitude": 34.534808
      },
      {
        "longitude": 117.022685,
        "latitude": 36.663539
      },
      {
        "longitude": 121.45591,
        "latitude": 31.22352
      },
      {
        "longitude": 119.57006,
        "latitude": 32.43458
      },
      {
        "longitude": 116.09584,
        "latitude": 35.8024
      },
      {
        "longitude": 126.54944,
        "latitude": 43.83784
      },
      {
        "longitude": 106.576012,
        "latitude": 31.083402
      },
      {
        "longitude": 98.85804,
        "latitude": 25.82306
      },
      {
        "longitude": 104.230368,
        "latitude": 30.75741
      },
      {
        "longitude": 106.830198,
        "latitude": 27.540713
      },
      {
        "longitude": 113.863733,
        "latitude": 22.575257
      },
      {
        "longitude": 118.529394,
        "latitude": 31.710193
      },
      {
        "longitude": 117.66992,
        "latitude": 49.51054
      },
      {
        "longitude": 120.58319,
        "latitude": 31.29834
      },
      {
        "longitude": 121.490599,
        "latitude": 45.060535
      },
      {
        "longitude": 117.183453,
        "latitude": 35.09856
      },
      {
        "longitude": 114.05454,
        "latitude": 22.52291
      },
      {
        "longitude": 116.453768,
        "latitude": 39.935119
      },
      {
        "longitude": 121.418433,
        "latitude": 31.240437
      },
      {
        "longitude": 119.97365,
        "latitude": 31.81072
      },
      {
        "longitude": 113.338952,
        "latitude": 23.142312
      },
      {
        "longitude": 126.643492,
        "latitude": 45.760791
      },
      {
        "longitude": 117.38375,
        "latitude": 35.47441
      },
      {
        "longitude": 123.81695,
        "latitude": 41.30877
      },
      {
        "longitude": 108.3669,
        "latitude": 22.81673
      },
      {
        "longitude": 112.15478,
        "latitude": 37.55165
      },
      {
        "longitude": 120.919827,
        "latitude": 30.819863
      },
      {
        "longitude": 111.713503,
        "latitude": 29.045065
      },
      {
        "longitude": 113.467892,
        "latitude": 23.171201
      },
      {
        "longitude": 109.814544,
        "latitude": 40.658849
      },
      {
        "longitude": 120.073826,
        "latitude": 29.310101
      },
      {
        "longitude": 103.15679,
        "latitude": 23.363142
      },
      {
        "longitude": 120.981915,
        "latitude": 31.996905
      },
      {
        "longitude": 112.893558,
        "latitude": 22.882351
      },
      {
        "longitude": 119.538414,
        "latitude": 35.388905
      },
      {
        "longitude": 114.255418,
        "latitude": 30.617745
      },
      {
        "longitude": 120.605754,
        "latitude": 31.363461
      },
      {
        "longitude": 119.954995,
        "latitude": 31.778736
      },
      {
        "longitude": 120.39563,
        "latitude": 31.58276
      },
      {
        "longitude": 121.546634,
        "latitude": 31.245766
      },
      {
        "longitude": 116.168677,
        "latitude": 23.334689
      },
      {
        "longitude": 121.11391,
        "latitude": 30.008155
      },
      {
        "longitude": 114.53918,
        "latitude": 36.62556
      },
      {
        "longitude": 117.327877,
        "latitude": 31.827846
      },
      {
        "longitude": 116.894348,
        "latitude": 32.031236
      },
      {
        "longitude": 118.011101,
        "latitude": 36.718365
      },
      {
        "longitude": 104.254092,
        "latitude": 30.641464
      },
      {
        "longitude": 120.747362,
        "latitude": 31.261384
      },
      {
        "longitude": 118.196514,
        "latitude": 24.486541
      },
      {
        "longitude": 104.946516,
        "latitude": 25.78762
      },
      {
        "longitude": 104.11371,
        "latitude": 30.647355
      },
      {
        "longitude": 109.66437,
        "latitude": 19.458766
      },
      {
        "longitude": 120.163053,
        "latitude": 30.260105
      },
      {
        "longitude": 100.102411,
        "latitude": 23.878426
      },
      {
        "longitude": 109.371664,
        "latitude": 24.316336
      },
      {
        "longitude": 121.434215,
        "latitude": 31.217872
      },
      {
        "longitude": 106.532799,
        "latitude": 29.573437
      },
      {
        "longitude": 114.317187,
        "latitude": 34.813491
      },
      {
        "longitude": 82.89417,
        "latitude": 44.60055
      },
      {
        "longitude": 116.568015,
        "latitude": 35.40647
      },
      {
        "longitude": 82.084713,
        "latitude": 44.888072
      },
      {
        "longitude": 114.06656,
        "latitude": 32.139699
      },
      {
        "longitude": 116.173981,
        "latitude": 39.734764
      },
      {
        "longitude": 102.844062,
        "latitude": 23.598488
      },
      {
        "longitude": 111.18747,
        "latitude": 34.77141
      },
      {
        "longitude": 104.071783,
        "latitude": 30.68556
      },
      {
        "longitude": 123.400859,
        "latitude": 41.747167
      },
      {
        "longitude": 111.250458,
        "latitude": 39.855408
      },
      {
        "longitude": 114.484061,
        "latitude": 37.097632
      }
    ];
    var list =<Points>[];
   for(int i=0;i<json.length;i++){
     list.add(Points(lat: json[i]["latitude"]  as num,lng: json[i]["longitude"] as num,count: i));
   }
   setState((){
     listPoint.addAll(list);
   });
    // print("length=${json.length}");
    // print(json[0]["longitude"]);

  }
  var listPoint=<Points>[];
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
                  point: listPoint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
