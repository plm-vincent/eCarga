import 'package:ecarga_v1/Pages/Auth/otp.dart';
import 'package:ecarga_v1/Pages/Auth/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController phoneController =
      TextEditingController(); // Define phoneController
  String selectedCountryCode =
      '+63'; // Initial value for the selected country code

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAEB),
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'assets/logos/IconNameCTA.png',
              width: 250,
            ),
            top: 150,
            left: 80,
          ),
          Positioned(
            child: Text(
              'Enter your valid phone number:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Metropolis',
                color: Color(0xFFAF2025),
              ),
            ),
            top: 340,
            left: 60,
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
            top: 370,
            left: 60,
            child: Container(
              width: 295, // Set the width of the combined container
              height: 60, // Set the height of the combined container
              decoration: BoxDecoration(
                color: Colors.white, // Set the color of the combined container
                borderRadius: BorderRadius.circular(
                    10), // Set the border radius of the combined container
                border: Border.all(
                    color: Color.fromARGB(255, 0, 0,
                        0)), // Set the border color and width of the combined container
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10), // Add padding to the right side of the image
                    child: Image.asset(
                      'assets/logos/phLogo.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Container(
                    width: 70, // Set the width of the country code dropdown
                    child: DropdownButton<String>(
                      value: selectedCountryCode,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          // Update the selected country code when the user selects a new value
                          selectedCountryCode = newValue;
                        }
                      },
                      items: <String>['+63'] // Add more country codes as needed
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    width: 1, // Set the width of the vertical divider
                    color: Colors.grey, // Set the color of the vertical divider
                  ),
                  SizedBox(
                      width:
                          5), // Add some spacing between the vertical divider and the phone number input field
                  Expanded(
                    child: Container(
                      height:
                          50, // Set the height of the phone number input field
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            border: InputBorder
                                .none, // Remove the border of the TextFormField
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 140,
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFAF2025),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OTPPage();
                  }));
                },
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Metropolis',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Text(
              'Don\'t have an account yet?',
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Metropolis',
                color: Color(0xFFAF2025),
                fontWeight: FontWeight.w600,
              ),
            ),
            top: 515,
            left: 70,
          ),
          Positioned(
  top: 515,
  left: 255,
  child: GestureDetector(
    onTap: () {
      // Navigate to the RegisterPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPage(),
        ),
      );
    },
    child: Text(
      'Register here!',
      style: TextStyle(
        fontSize: 13,
        fontFamily: 'Metropolis',
        color: Color(0xFFAF2025),
        fontWeight: FontWeight.w800,
      ),
    ),
  ),
),

          Positioned(
            child: Text(
              'Your mobile number will allow customer service and drivers to\ncontact you about your bookings.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontFamily: 'Metropolis',
                color: Colors.black,
              ),
            ),
            top: 810,
            left: 37,
          ),
          Positioned(
            child: Image.asset(
              'assets/logos/AmbulanceIcon.png',
              width: 150,
              height: 150,
            ),
            top: 690,
            left: 280,
          ),
        ],
      ),
    );
  }
}
