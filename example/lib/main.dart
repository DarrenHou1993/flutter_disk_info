import 'package:flutter/material.dart';
import 'package:disk_info/disk_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int total;
  int available;

  @override
  void initState() {
    super.initState();
    getDisInfo();
  }

  void getDisInfo() async {
    final diskInfo = await DiskInfo.diskInfo;
    debugPrint('get diskInfo');
    debugPrint(diskInfo.total.toString());
    debugPrint(diskInfo.available.toString());
    setState(() {
      this.total = diskInfo.total;
      this.available = diskInfo.available;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Text('totol:$total'),
            Text('available:$available')
          ],
        ),
      ),
    );
  }
}
