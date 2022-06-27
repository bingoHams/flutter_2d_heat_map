
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2d_heat_map/src/web/amapjs.dart';
import 'AMap2DViewCreatedCallback.dart';
import 'amap_2d_heat_view_state.dart'
if (dart.library.html) 'web/amap_2d_heat_view_state.dart'
if (dart.library.io) 'mobile/amap_2d_heat_view_state.dart';

import 'poi_search_model.dart';




class AMap2DHeatView extends StatefulWidget {
  
  const AMap2DHeatView({
    Key? key,
    this.isPoiSearch = true,
    this.onPoiSearched,
    this.onAMap2DViewCreated,
    required this.point,
  }) : super(key: key);
  
  final bool isPoiSearch;
  final AMap2DViewCreatedCallback? onAMap2DViewCreated;
  final Function(List<PoiSearch>)? onPoiSearched;
  final List<Points> point;

  @override
  AMap2DHeatViewState createState() => AMap2DHeatViewState();
}

