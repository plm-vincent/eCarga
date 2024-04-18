import 'package:ecarga_v1/Pages/Base/welcomeecarga.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
            child: Text(
              'First Name:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Metropolis',
                color: Color(0xFFAF2025),
              ),
            ),
            top: 150,
            left: 60,
          ),
          Positioned(
            top: 180,
            left: 60,
            child: Container(
              width: 295, // Set the width of the text input field
              height: 50, // Set the height of the text input field
              decoration: BoxDecoration(
                color: Colors.white, // Set the color of the text input field
                borderRadius:
                    BorderRadius.circular(10), // Set the border radius
                border: Border.all(
                  color: Color.fromARGB(255, 0, 0, 0), // Set the border color
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    border: InputBorder.none, // Remove the border
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Text(
              'Middle Name (Optional):',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Metropolis',
                color: Color(0xFFAF2025),
              ),
            ),
            top: 250,
            left: 60,
          ),
          Positioned(
            top: 280,
            left: 60,
            child: Container(
              width: 295, // Set the width of the text input field
              height: 50, // Set the height of the text input field
              decoration: BoxDecoration(
                color: Colors.white, // Set the color of the text input field
                borderRadius:
                    BorderRadius.circular(10), // Set the border radius
                border: Border.all(
                  color: Color.fromARGB(255, 0, 0, 0), // Set the border color
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    border: InputBorder.none, // Remove the border
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Text(
              'Last Name:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Metropolis',
                color: Color(0xFFAF2025),
              ),
            ),
            top: 350,
            left: 60,
          ),
          Positioned(
            top: 380,
            left: 60,
            child: Container(
              width: 295, // Set the width of the text input field
              height: 50, // Set the height of the text input field
              decoration: BoxDecoration(
                color: Colors.white, // Set the color of the text input field
                borderRadius:
                    BorderRadius.circular(10), // Set the border radius
                border: Border.all(
                  color: Color.fromARGB(255, 0, 0, 0), // Set the border color
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    border: InputBorder.none, // Remove the border
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Text(
              'Motor Disability:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Metropolis',
                color: Color(0xFFAF2025),
              ),
            ),
            top: 450,
            left: 60,
          ),
          Positioned(
            top: 480,
            left: 60,
            child: Container(
              width: 295, // Set the width of the text input field
              height: 50, // Set the height of the text input field
              decoration: BoxDecoration(
                color: Colors.white, // Set the color of the text input field
                borderRadius: BorderRadius.circular(10), // Set the border radius
                border: Border.all(
                  color: Color.fromARGB(255, 0, 0, 0), // Set the border color
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    border: InputBorder.none, // Remove the border
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 560,
            left: 135,
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
                    return WelcomeECARGA();
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
        ],
      ),
    );
  }
}
