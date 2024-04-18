import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'riderreview.dart';
import 'confirmbooking.dart';

class ActiveRide extends StatefulWidget {
  const ActiveRide({Key? key}) : super(key: key);

  @override
  _ActiveRideState createState() => _ActiveRideState();
}

class _ActiveRideState extends State<ActiveRide> {
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    // Delay for 10 seconds before navigating to the RiderReview page
    Future.delayed(Duration(seconds: 10), () {
      _navigateToRiderReviewPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map as background
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(45.521563, -122.677433),
              zoom: 11.0,
            ),
          ),
          // Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFAF2025), // Header color
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20.0)), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rider's big icon
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                        'assets/person_icon.png'), // Placeholder image
                  ),
                  SizedBox(height: 10),
                  // Rider's name
                  Text(
                    'Rodolfo Dela Cruz',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      color: Colors.white, // Font color
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  // Rider's plate number
                  Text(
                    'Plate Number: ABC 123',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      color: Colors.white, // Font color
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 5),
                  // Rider's vehicle type
                  Text(
                    'Vehicle Type: Motorcycle',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      color: Colors.white, // Font color
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 5),
                  // Rider's reviews
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.white, // Font color
                        size: 20.0,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '4.8', // Example review rating
                        style: TextStyle(
                          fontFamily: 'Metropolis',
                          color: Colors.white, // Font color
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // White container near the center of the screen
          Positioned(
            top: 250, // Adjusted position
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 40, vertical: 50), // Increased padding
              decoration: BoxDecoration(
                color: Colors.white, // White background
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Call with your driver
                      GestureDetector(
                        onTap: () {
                          // Implement call functionality
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: Color(0xFFAF2025),
                              size: 24, // Increased icon size
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Call',
                              style: TextStyle(
                                fontFamily: 'Metropolis',
                                color: Color(0xFFAF2025),
                                fontSize: 18.0, // Increased font size
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Separator line
                      Container(
                        width: 1,
                        height: 40,
                        color: Color(0xFFAF2025),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20), // Added margin
                      ),
                      // Chat with your driver
                      GestureDetector(
                        onTap: () {
                          // Implement chat functionality
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.chat,
                              color: Color(0xFFAF2025),
                              size: 24, // Increased icon size
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Chat',
                              style: TextStyle(
                                fontFamily: 'Metropolis',
                                color: Color(0xFFAF2025),
                                fontSize: 18.0, // Increased font size
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Added spacing
                  // Cancel Booking button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to ConfirmBookingPage
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Rounded corners
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Cancel Booking',
                        style: TextStyle(
                          fontFamily: 'Metropolis',
                          fontSize: 16.0,
                        ),
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

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _navigateToRiderReviewPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RiderReview(), // Navigate to RiderReview page
      ),
    );
  }
}
