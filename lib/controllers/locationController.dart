import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

// Utils
import 'package:users/utils/session.dart';

class LocationController extends ChangeNotifier {

  final Session _session = Session.instance;
  
  PermissionHandler _permissionHandler = PermissionHandler();

  StreamSubscription<Position> _positionStream;

  BuildContext context;

  bool permissionLocation = false;

  Position userPosition;

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }  

  checkLocation(BuildContext context) async {
    this.context = context;
    final status = await _permissionHandler.checkPermissionStatus(PermissionGroup.locationWhenInUse);
    if(status != PermissionStatus.granted) {
      this.requestPermission();
    } else {
      setPermissionLocation(true);
    }
  }

  requestPermission() async {
    final result = await _permissionHandler.requestPermissions([PermissionGroup.locationWhenInUse]);
    if(result.containsKey(PermissionGroup.locationWhenInUse)) {
      final status = result[PermissionGroup.locationWhenInUse];
      if(status == PermissionStatus.granted) {
        setPermissionLocation(true);
      } else if(status == PermissionStatus.denied){
        setPermissionLocation(false);
        await _permissionHandler.openAppSettings();
      }
    }
  }

  void setPermissionLocation(bool value) {
    permissionLocation = value;
    notifyListeners();
    if(value) {
      _startTracking();
      _verifyToken();
    }
  }

  void _startTracking() {
    var geolocator = Geolocator();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    _positionStream = geolocator.getPositionStream(locationOptions).listen(_onPositionUpdate);    
  }

  void _onPositionUpdate(Position position) {
    userPosition = position;
    notifyListeners();
  }

  void _verifyToken() {
    String token = _session.getToken();
    if(token != null) Navigator.of(context).pushReplacementNamed('home');
  }

}