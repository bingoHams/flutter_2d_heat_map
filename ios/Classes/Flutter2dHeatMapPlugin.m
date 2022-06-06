#import "Flutter2dHeatMapPlugin.h"
#if __has_include(<flutter_2d_heat_map/flutter_2d_heat_map-Swift.h>)
#import <flutter_2d_heat_map/flutter_2d_heat_map-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_2d_heat_map-Swift.h"
#endif

@implementation Flutter2dHeatMapPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutter2dHeatMapPlugin registerWithRegistrar:registrar];
}
@end
