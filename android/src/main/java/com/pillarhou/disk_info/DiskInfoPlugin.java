package com.pillarhou.disk_info;

import android.os.Environment;
import android.os.StatFs;
import android.text.format.Formatter;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * DiskInfoPlugin
 */
public class DiskInfoPlugin implements MethodCallHandler {
  /**
   * Plugin registration.
   */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "disk_info");
    channel.setMethodCallHandler(new DiskInfoPlugin());
  }

  /**
   * 获得SD卡总大小
   *
   * @return
   */
  private long getSDTotalSize() {
    File path = Environment.getExternalStorageDirectory();
    StatFs stat = new StatFs(path.getPath());
    long blockSize = stat.getBlockSize();
    long totalBlocks = stat.getBlockCount();
    return blockSize * totalBlocks;
  }

  /**
   * 获得sd卡剩余容量，即可用大小
   *
   * @return
   */
  private long getSDAvailableSize() {
    File path = Environment.getExternalStorageDirectory();
    StatFs stat = new StatFs(path.getPath());
    long blockSize = stat.getBlockSize();
    long availableBlocks = stat.getAvailableBlocks();
    return blockSize * availableBlocks;
  }

  /**
   * 获得机身内容总大小
   *
   * @return
   */
  private long getRomTotalSize() {
    File path = Environment.getDataDirectory();
    StatFs stat = new StatFs(path.getPath());
    long blockSize = stat.getBlockSize();
    long totalBlocks = stat.getBlockCount();
    return blockSize * totalBlocks;
  }

  /**
   * 获得机身可用内存
   *
   * @return
   */
  private long getRomAvailableSize() {
    File path = Environment.getDataDirectory();
    StatFs stat = new StatFs(path.getPath());
    long blockSize = stat.getBlockSize();
    long availableBlocks = stat.getAvailableBlocks();
    return blockSize * availableBlocks;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("getDiskInfo")) {
      Map<String, Long> map = new HashMap<String, Long>();
      long total = getRomTotalSize();
      long available = getRomAvailableSize();
      map.put("total", total);
      map.put("available", available);
      result.success(map);
    } else {
      result.notImplemented();
    }
  }
}
