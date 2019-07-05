import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:disk_info/disk_info.dart';

void main() {
  const MethodChannel channel = MethodChannel('disk_info');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return {'total': 1, 'available': 2};
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getDiskInfo', () async {
    final diskInfo = await DiskInfo.diskInfo;
    expect(diskInfo.total, 1);
    expect(diskInfo.available, 2);
  });
}
