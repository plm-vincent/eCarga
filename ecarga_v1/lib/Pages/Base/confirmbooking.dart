import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'selectvehicle.dart';
import 'findingdriver.dart'; // Import the FindingDriver page

class ConfirmBookingPage extends StatefulWidget {
  const ConfirmBookingPage({Key? key});

  @override
  State<ConfirmBookingPage> createState() => _ConfirmBookingPageState();
}

class _ConfirmBookingPageState extends State<ConfirmBookingPage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(14.5995, 120.9842);

  bool showMap = false;

  // Define a variable for the common shadow
  final BoxShadow commonShadow = BoxShadow(
    color: Colors.black.withOpacity(0.3),
    spreadRadius: 5,
    blurRadius: 7,
    offset: Offset(0, 3),
  );

  @override
  void initState() {
    super.initState();
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

  void _navigateToFindingDriverPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            FindingDriverPage(), // Navigate to FindingDriver page
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
                boxShadow: [commonShadow], // Use the common shadow here
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
                boxShadow: [commonShadow], // Use the common shadow here
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -5, // Adjust top position as needed
                    left: 15, // Adjust left position as needed
                    child: Image.asset(
                      'assets/logos/pickup.png', // Provide the path to your image asset
                      width: 40, // Adjust the width of the image
                      height: 90, // Adjust the height of the image
                      fit: BoxFit.contain, // Adjust the fit of the image
                    ),
                  ),
                  Positioned(
                    top: 50, // Adjust top position as needed
                    left: 15, // Adjust left position as needed
                    child: Image.asset(
                      'assets/logos/dropoff.png', // Provide the path to your image asset
                      width: 40, // Adjust the width of the image
                      height: 90, // Adjust the height of the image
                      fit: BoxFit.contain, // Adjust the fit of the image
                    ),
                  ),
                  Positioned(
                    top: 90, // Adjust top position as needed
                    left: 55, // Adjust left position as needed
                    child: Image.asset(
                      'assets/logos/cash.png', // Provide the path to your image asset
                      width: 30, // Adjust the width of the image
                      height: 90, // Adjust the height of the image
                      fit: BoxFit.contain, // Adjust the fit of the image
                    ),
                  ),
                  Positioned(
                    top: 130, // Adjust top position as needed
                    left: 130, // Adjust left position as needed
                    child: Text(
                      'Cash',
                      style: TextStyle(
                          color: Color(0xFFAF2025),
                          fontWeight: FontWeight.bold),
                    ), // Adjust the fit of the image
                  ),
                  Positioned(
                    top: 130, // Adjust top position as needed
                    left: 200, // Adjust left position as needed
                    child: Text(
                      '|',
                      style: TextStyle(
                          color: Color(0xFFAF2025),
                          fontWeight: FontWeight.bold),
                    ), // Adjust the fit of the image
                  ),
                  Positioned(
                    top: 96, // Adjust top position as needed
                    left: 230, // Adjust left position as needed
                    child: Image.asset(
                      'assets/logos/notestodriver.png', // Provide the path to your image asset
                      width: 20, // Adjust the width of the image
                      height: 90, // Adjust the height of the image
                      fit: BoxFit.contain, // Adjust the fit of the image
                    ),
                  ),
                  Positioned(
                    top: 130, // Adjust top position as needed
                    left: 260, // Adjust left position as needed
                    child: Text(
                      'Notes to Driver',
                      style: TextStyle(
                          color: Color(0xFFAF2025),
                          fontWeight: FontWeight.bold),
                    ), // Adjust the fit of the image
                  ), // Adjust the fit of the image
                ],
              ),
            ),
          ),
          Positioned(
            top: 210,
            left: 15,
            child: GestureDetector(
              onTap: () {
                _navigateToFindingDriverPage(
                    context); // Navigate to FindingDriverPage
              },
              child: Container(
                width: 383, // Adjust width as needed
                height: 60, // Adjust height as needed
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      15), // Adjust corner radius as needed for the outer container
                  boxShadow: [commonShadow], // Use the common shadow here
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
                        'CONFIRM BOOKING',
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

          Positioned(
            top: 50,
            left: 80,
            child: Container(
              width: 295, // Set the width of the text input field
              height: 40, // Increase the height of the container
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 234, 228,
                    228), // Set the color of the text input field
                borderRadius: BorderRadius.circular(5), // Set the border radius
                border: Border.all(
                  color: Color.fromARGB(0, 0, 0, 0), // Set the border color
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  textAlign: TextAlign.left, // Align the text to the left
                  decoration: InputDecoration(
                    hintText: '',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    border: InputBorder.none, // Remove the border
                    contentPadding:
                        EdgeInsets.all(7), // Set contentPadding to zero
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 105,
            left: 80,
            child: Container(
              width: 295, // Set the width of the text input field
              height: 40, // Increase the height of the container
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 234, 228,
                    228), // Set the color of the text input field
                borderRadius: BorderRadius.circular(5), // Set the border radius
                border: Border.all(
                  color: Color.fromARGB(0, 0, 0, 0), // Set the border color
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  textAlign: TextAlign.left, // Align the text to the left
                  decoration: InputDecoration(
                    hintText: '',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    border: InputBorder.none, // Remove the border
                    contentPadding:
                        EdgeInsets.all(7), // Set contentPadding to zero
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
