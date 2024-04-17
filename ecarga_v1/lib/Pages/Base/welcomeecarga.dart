import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class WelcomeECARGA extends StatefulWidget {
  const WelcomeECARGA({Key? key}) : super(key: key);

  @override
  _WelcomeECARGAState createState() => _WelcomeECARGAState();
}

class _WelcomeECARGAState extends State<WelcomeECARGA> {
  late GoogleMapController mapController;
  LatLng? _center;
  Set<Marker> _markers = {}; // create a Set of Marker

void _requestPermissions() async {
  PermissionStatus status = await Permission.location.request();
  if (status.isDenied) {
    // The user denied the permission, you can request it again or show a message
    _requestPermissions(); // Request the permission again
  }
}

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _center = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          markerId: MarkerId(_center.toString()), // create a Marker with _center as the position
          position: _center!,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _center == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: _onMapCreated,
              markers: _markers, // pass the Set of Marker to the markers property
              initialCameraPosition: CameraPosition(
                target: _center!,
                zoom: 11.0,
              ),
            ),
    );
  }
}