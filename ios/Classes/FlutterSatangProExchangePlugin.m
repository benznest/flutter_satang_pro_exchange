#import "FlutterSatangProExchangePlugin.h"
#import <flutter_satang_pro_exchange/flutter_satang_pro_exchange-Swift.h>

@implementation FlutterSatangProExchangePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterSatangProExchangePlugin registerWithRegistrar:registrar];
}
@end
