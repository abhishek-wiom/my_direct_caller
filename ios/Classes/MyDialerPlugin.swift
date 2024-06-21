import Flutter
import UIKit

public class MyDialerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "my_dialer", binaryMessenger: registrar.messenger())
    let instance = MyDialerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if call.method == "getPlatformVersion" {
          result("iOS " + UIDevice.current.systemVersion)
      } else if call.method == "callNumber" {
          guard let args = call.arguments as? [String: Any],
              let number = args["number"] as? String,
              let url = URL(string: "tel://\(number)"),
              UIApplication.shared.canOpenURL(url) else {
              return
          }
          UIApplication.shared.open(url, options: [:], completionHandler: nil)
          result(nil)
      } else {
          result(FlutterMethodNotImplemented)
      }
  }
}
