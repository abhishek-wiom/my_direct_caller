package com.example.my_dialer
import android.content.Intent
import android.net.Uri
import androidx.core.content.ContextCompat.startActivity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/** MyDialerPlugin */
class MyDialerPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val channel = MethodChannel(
      binding.binaryMessenger, "my_dialer"
    )
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "callNumber") {
      number = call.argument("number")
      Log.d("Caller", "Message")
      number = number!!.replace("#".toRegex(), "%23")
      if (!number!!.startsWith("tel:")) {
        number = String.format("tel:%s", number)
      }
      if (permissionStatus != 1) {
        requestsPermission()
      } else {
        result.success(callNumber(number))
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
