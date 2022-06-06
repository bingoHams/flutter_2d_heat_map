#ifndef FLUTTER_PLUGIN_FLUTTER2D_HEAT_MAP_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER2D_HEAT_MAP_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_2d_heat_map {

class Flutter2dHeatMapPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  Flutter2dHeatMapPlugin();

  virtual ~Flutter2dHeatMapPlugin();

  // Disallow copy and assign.
  Flutter2dHeatMapPlugin(const Flutter2dHeatMapPlugin&) = delete;
  Flutter2dHeatMapPlugin& operator=(const Flutter2dHeatMapPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_2d_heat_map

#endif  // FLUTTER_PLUGIN_FLUTTER2D_HEAT_MAP_PLUGIN_H_
