# DiskInfo

This Flutter plugin provides an API for querying disk info.

# Usage

You can use the DiskInfo to query information about the
application package. This works both on iOS and Android.

```dart
import 'package:disk_info/disk_info.dart';

final diskInfo = await DiskInfo.diskInfo;
debugPrint(diskInfo.total.toString());
debugPrint(diskInfo.available.toString());
```

Or :

```dart
DiskInfo.fromPlatform().then((DiskInfo diskInfo) {
  debugPrint(diskInfo.total.toString());
  debugPrint(diskInfo.available.toString());
});
```

## Getting Started

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).
