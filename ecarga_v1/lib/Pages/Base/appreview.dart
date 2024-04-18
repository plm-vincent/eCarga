import 'package:ecarga_v1/Pages/Base/welcomeecarga.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppReview extends StatefulWidget {
  const AppReview({Key? key}) : super(key: key);

  @override
  _AppReviewState createState() => _AppReviewState();
}

class _AppReviewState extends State<AppReview> {
  late GoogleMapController mapController;
  int selectedStarIndex = -1; // -1 means no star is selected

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void selectStar(int index) {
    setState(() {
      selectedStarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          // Semi-transparent overlay
          IgnorePointer(
            ignoring: true,
            child: Container(
              color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
            ),
          ),
          // White container on top
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.8, // 80% of screen width
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enjoying eCarga? Rate our app',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      color: Color(0xFFAF2025),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          selectStar(index);
                        },
                        child: Icon(
                          index <= selectedStarIndex
                              ? Icons.star
                              : Icons.star_border,
                          size: 50,
                          color: index <= selectedStarIndex
                              ? Colors.yellow
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Care to tell a friend who can utilize eCarga?',
                    style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.camera_alt_outlined),
                        onPressed: () {
                          // Implement action for Camera
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.email_outlined),
                        onPressed: () {
                          // Implement action for Email
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.facebook_outlined),
                        onPressed: () {
                          // Implement action for Facebook
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WelcomeECARGA()), // Navigate to WelcomeECARGA page
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red, // White text color
                      elevation: 0, // No elevation
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Button padding
                    ),
                    child: Text('Maybe next time'),
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
