import 'package:ecarga_v1/Pages/Base/appreview.dart';
import 'package:flutter/material.dart';

class RiderReview extends StatefulWidget {
  @override
  _RiderReviewState createState() => _RiderReviewState();
}

class _RiderReviewState extends State<RiderReview> {
  int selectedStarIndex = -1; // -1 means no star is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAF2025),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 60,
                color: Color(0xFFAF2025),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Rodolfo Dela Cruz',
              style: TextStyle(
                fontFamily: 'Metropolis',
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'How was your experience?',
              style: TextStyle(
                fontFamily: 'Metropolis',
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedStarIndex = index;
                    });
                  },
                  child: Icon(
                    index <= selectedStarIndex ? Icons.star : Icons.star_border,
                    size: 40,
                    color: Colors.yellow,
                  ),
                );
              }),
            ),
            SizedBox(height: 40),
            SizedBox(height: 40),
            Text(
              'Total Paid: 100 PHP',
              style: TextStyle(
                fontFamily: 'Metropolis',
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppReview()),
                );
              },
              child: Text(
                'View Details',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  color: Colors.white,
                  fontSize: 16.0,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the WelcomeECARGA page
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Color(0xFFAF2025),
                backgroundColor: Colors.white,
              ),
              child: Text(
                'Go Back',
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  color: Color(0xFFAF2025),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
