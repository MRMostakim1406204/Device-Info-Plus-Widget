import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
 late AndroidDeviceInfo androidDeviceInfo;
 late IosDeviceInfo iosDeviceInfo;
 late WebBrowserInfo webBrowserInfo;

 getAndroidDeviceInfo()async{
  androidDeviceInfo = await deviceInfoPlugin.androidInfo;
  setState(() {});
 }

 getIOSDeviceInfo()async{
  iosDeviceInfo = await deviceInfoPlugin.iosInfo;
   setState(() {});
 }

 getWebDeviceInfo()async{
  webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
   setState(() {});
 }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAndroidDeviceInfo();
    getIOSDeviceInfo();
    getWebDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device Info plus"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Android Model:-" + androidDeviceInfo.model.toString()),
             Text("Android Menufacture:-" + androidDeviceInfo.manufacturer.toString()),
          ],
        ),
      ),
    );
  }
}