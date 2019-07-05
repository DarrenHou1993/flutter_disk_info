import CoreTelephony
import Flutter
import UIKit

public class SwiftDiskInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "disk_info", binaryMessenger: registrar.messenger())
    let instance = SwiftDiskInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  private func blankof<T>(type _: T.Type) -> T {
    let ptr = UnsafeMutablePointer<T>.allocate(capacity: MemoryLayout<T>.size)
    let val = ptr.pointee
    return val
  }

  /// 内存总大小
  private func getTotalDiskSize() -> Int64 {
    var fs = blankof(type: statfs.self)
    if statfs("/var", &fs) >= 0 {
      return Int64(UInt64(fs.f_bsize) * fs.f_blocks)
    }
    return -1
  }

  /// 内存可用大小
  private func getAvailableDiskSize() -> Int64 {
    var fs = blankof(type: statfs.self)
    if statfs("/var", &fs) >= 0 {
      return Int64(UInt64(fs.f_bsize) * fs.f_bavail)
    }
    return -1
  }

  public func handle(_: FlutterMethodCall, result: @escaping FlutterResult) {
    let total = getTotalDiskSize()
    let available = getAvailableDiskSize()
    let diskInfo: [String: Int64] = ["total": total, "available": available]
    result(diskInfo)
  }
}
