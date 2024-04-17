import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'selectvehicle.dart';

class WelcomeECARGA extends StatefulWidget {
  const WelcomeECARGA({Key? key}) : super(key: key);

  @override
  _WelcomeECARGAState createState() => _WelcomeECARGAState();
}

class _WelcomeECARGAState extends State<WelcomeECARGA> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(14.5995, 120.9842);

  bool showMap = false;

  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds before showing the map
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        showMap = true;
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _navigateToSelectVehiclePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SelectVehiclePage()), // Navigate to SelectVehiclePage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Google Map
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            // Set visibility of the map based on showMap
            myLocationEnabled: showMap,
            mapToolbarEnabled: showMap,
            zoomControlsEnabled: showMap,
            zoomGesturesEnabled: showMap,
            scrollGesturesEnabled: showMap,
            rotateGesturesEnabled: showMap,
            tiltGesturesEnabled: showMap,
          ),
          // Positioned images
          Positioned(
            child: Image.asset(
              'assets/logos/AmbulanceIcon.png',
              width: 160,
              height: 160,
            ),
            top: 730,
            left: 265,
          ),
          Positioned(
            child: Image.asset(
              'assets/logos/circleicon.png',
              width: 70,
              height: 160,
            ),
            top: 730,
            left: 15,
          ),
          // Positioned text
          Positioned(
            top: 770,
            left: 37,
            child: Text(
              '?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          // Welcome image overlay
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: showMap ? 1 : 0,
            child: GestureDetector(
              onTap: () {
                _navigateToSelectVehiclePage(context);
              },
              child: Stack(
                children: [
                  // Dark background
                  Container(
                    color: Colors.black
                        .withOpacity(0.5), // Adjust opacity as needed
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  // Wheelchair image
                  Positioned(
                    top: 200,
                    left: 5,
                    child: GestureDetector(
                      onTap: () {
                        _navigateToSelectVehiclePage(context);
                      },
                      child: Image.asset(
                        'assets/logos/wheelchair4.png',
                        width: 400,
                        height: 400,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  // Welcome text
                  Positioned(
                    top: 520,
                    left: 40,
                    child: Text(
                      'WELCOME TO ECARGA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  // Let's get started text
                  Positioned(
                    top: 560,
                    left: 100,
                    child: Text(
                      'LET\'S GET STARTED!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
