#include "include/flutter_2d_heat_map/flutter2d_heat_map_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter2d_heat_map_plugin.h"

void Flutter2dHeatMapPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_2d_heat_map::Flutter2dHeatMapPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
