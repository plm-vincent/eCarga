import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'selectvehicle.dart';
import 'activeride.dart'; // Import the ActiveRide page

class FindingDriverPage extends StatefulWidget {
  const FindingDriverPage({Key? key}) : super(key: key);

  @override
  State<FindingDriverPage> createState() => _FindingDriverPageState();
}

class _FindingDriverPageState extends State<FindingDriverPage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(14.5995, 120.9842);

  bool showMap = false;

  @override
  void initState() {
    super.initState();
    // Delay for 10 seconds before navigating to the ActiveRide page
    Future.delayed(Duration(seconds: 10), () {
      _navigateToActiveRidePage(context);
    });

    // Delay for 1 second before showing the map
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
            SelectVehiclePage(), // Navigate to SelectVehiclePage
      ),
    );
  }

  void _navigateToConfirmBookingPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ActiveRide(), // Navigate to ConfirmBookingPage
      ),
    );
  }

  void _navigateToActiveRidePage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ActiveRide(), // Navigate to ActiveRide page
      ),
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
          Positioned(
            top: 20,
            left: 15,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Color(0xFFAF2025)),
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
            ),
          ),
          Positioned(
            top: 30,
            left: 15,
            child: Container(
              width: 200, // Adjust width as needed
              height: 150, // Adjust height as needed
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(15), // Adjust corner radius as needed
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 15,
            child: Container(
              width: 383, // Adjust width as needed
              height: 170, // Adjust height as needed
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(15), // Adjust corner radius as needed
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 150,
                    child: Image.asset(
                      'assets/logos/findingdriver.png',
                      width: 90,
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 150,
                    child: Text(
                      'Finding Driver...',
                      style: TextStyle(
                        color: Color(0xFFAF2025),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 130,
                    child: Text(
                      'View Booking Details',
                      style: TextStyle(
                        color: Color(0xFFAF2025),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 210,
            left: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(
                    context); // Navigate back to the ConfirmBookingPage
              },
              child: Container(
                width: 383, // Adjust width as needed
                height: 60, // Adjust height as needed
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      15), // Adjust corner radius as needed for the outer container
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Offset
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width:
                        180, // Adjust width to fit within the parent container
                    height:
                        40, // Adjust height to fit within the parent container
                    decoration: BoxDecoration(
                      color: Color(0xFFAF2025), // Set the color of the button
                      borderRadius: BorderRadius.circular(
                          10), // Adjust border radius as needed for the inner container
                    ),
                    child: Center(
                      child: Text(
                        'CANCEL BOOKING',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
