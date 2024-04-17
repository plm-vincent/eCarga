import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WelcomeECARGA extends StatefulWidget {
  const WelcomeECARGA({Key? key}) : super(key: key);

  @override
  _WelcomeECARGAState createState() => _WelcomeECARGAState();
}

class _WelcomeECARGAState extends State<WelcomeECARGA> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}