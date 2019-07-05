#import "DiskInfoPlugin.h"
#import <disk_info/disk_info-Swift.h>

@implementation DiskInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDiskInfoPlugin registerWithRegistrar:registrar];
}
@end
