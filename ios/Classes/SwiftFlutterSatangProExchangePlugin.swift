import Flutter
import UIKit

public class SwiftFlutterSatangProExchangePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_satang_pro_exchange", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterSatangProExchangePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
