import 'package:ecarga_v1/Pages/Base/welcomeecarga.dart';
import 'package:flutter/material.dart';

class OTPPage extends StatelessWidget {
  final List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  OTPPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAEB),
      body: Stack(
        children: [
          Positioned(
            top: 150,
            left: MediaQuery.of(context).size.width / 2 - 125,
            child: Image.asset(
              'assets/logos/IconNameCTA.png',
              width: 250,
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
            top: 340,
            left: 37,
            child: Text(
              'Enter OTP:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Metropolis',
                color: Color(0xFFAF2025),
              ),
            ),
          ),
          Positioned(
            top: 380,
            left: MediaQuery.of(context).size.width / 2.3 - 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: SizedBox(
                    width: 50,
                    height: 60,
                    child: TextFormField(
                      controller: otpControllers[index],
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      focusNode: focusNodes[index],
                      onChanged: (value) {
                        if (value.isEmpty) {
                          if (index > 0) {
                            FocusScope.of(context)
                                .requestFocus(focusNodes[index - 1]);
                          }
                        } else {
                          if (index < 5) {
                            FocusScope.of(context)
                                .requestFocus(focusNodes[index + 1]);
                          } else {
                            // Reached the last digit, submit or perform validation
                            // You can add your logic here
                          }
                        }
                      },
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: '',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            top: 460,
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
                    return WelcomeECARGA();
                  }));
                },
                child: Center(
                  child: Text(
                    'Confirm',
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
              'Didn\'t receive an OTP?',
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Metropolis',
                color: Color(0xFFAF2025),
                fontWeight: FontWeight.w600,
              ),
            ),
            top: 520,
            left: 85,
          ),
          Positioned(
            child: Text(
              'Resend',
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Metropolis',
                color: Color(0xFFAF2025),
                fontWeight: FontWeight.w800,
              ),
            ),
            top: 520,
            left: 240,
          ),
          Positioned(
            child: Text(
              'in 1:30',
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Metropolis',
                color: Color(0xFFAF2025),
                fontWeight: FontWeight.w600,
              ),
            ),
            top: 520,
            left: 295,
          ),
        ],
      ),
    );
  }
}
