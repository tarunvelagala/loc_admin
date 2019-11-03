import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LocationScreen(),
      ),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Map<PermissionGroup, PermissionStatus> permissions;
  PermissionStatus status;
  requestPermission() async {
    permissions = await PermissionHandler().requestPermissions([
      PermissionGroup.location,
    ]);
    status = await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
    print("Permission Status "+status.toString());
    if(status == PermissionStatus.denied){
      showLocationDialog();
    }
  }
  showLocationDialog(){
    showDialog(barrierDismissible: false,context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Permission Request Denied"),
        content: Container(
          child: Text('Please enable to make sure that location permissions are enabled'),
        ),
        actions: <Widget>[
           FlatButton(onPressed: () async{
            SystemNavigator.pop();
          },child: Text("CANCEL"),)
        ],
      );
    });
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Main Screen"),
      ),
    );
  }
}
