import 'package:ecarga_v1/Pages/Base/confirmbooking.dart'; // Import your ConfirmBookingPage
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'selectvehicle.dart';

class BookingOptionsPage extends StatefulWidget {
  const BookingOptionsPage({super.key});

  @override
  State<BookingOptionsPage> createState() => _BookingOptionsPageState();
}

class _BookingOptionsPageState extends State<BookingOptionsPage> {
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

  void _navigateToConfirmBookingPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ConfirmBookingPage(), // Navigate to ConfirmBookingPage
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
          // Welcome container overlay
          AnimatedOpacity(
            duration: Duration(seconds: 0),
            opacity: showMap ? 1 : 0,
            child: GestureDetector(
              onTap: () {
                _navigateToSelectVehiclePage(context);
              },
              child: Container(
                color: Colors.black.withOpacity(0.5),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 350, // Adjust width as needed
              height: 300, // Adjust height as needed
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BOOKING OPTIONS:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Metropolis',
                      color: Color(0xFFAF2025),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      _navigateToConfirmBookingPage(context);
                    },
                    child: Container(
                      width: 400,
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFE9EAEB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image
                          Image.asset(
                            'assets/logos/realtime.png',
                            width: 50, // Increased width of the image
                            height: 100, // Increased height of the image
                          ),
                          // Text
                          SizedBox(
                            width: 20,
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'REAL-TIME',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFAF2025),
                                  ),
                                ),
                                Text(
                                  'Can book at any time',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFAF2025),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      _navigateToConfirmBookingPage(context);
                    },
                    child: Container(
                      width: 400,
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFE9EAEB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image
                          Image.asset(
                            'assets/logos/scheduled.png',
                            width: 50, // Increased width of the image
                            height: 120, // Increased height of the image
                          ),
                          // Text
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'SCHEDULED',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFAF2025),
                                  ),
                                ),
                                Text(
                                  'Can be scheduled in advance',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFAF2025),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
        ],
      ),
    );
  }
}
