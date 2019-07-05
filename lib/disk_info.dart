import 'dart:async';

import 'package:flutter/services.dart';

class DiskInfo {
  int total;
  int available;

  DiskInfo(this.total, this.available);

  static const MethodChannel _channel = const MethodChannel('disk_info');

  static Future<DiskInfo> get diskInfo async {
    final Map<dynamic, dynamic> map =
        await _channel.invokeMethod('getDiskInfo');
    return DiskInfo(map['total'], map['available']);
  }
}
