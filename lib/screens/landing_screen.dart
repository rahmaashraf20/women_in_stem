import 'package:flutter/material.dart';
import 'package:team_quiz_app/screens/login_screen.dart';
import 'package:team_quiz_app/utils/icons.dart'; 

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Responsive design
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              background, 
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Image.asset(home_page),
            Text(
              "ITI Quiz App",
              style: TextStyle(
                color: Color.fromARGB(255, 235, 213, 19),
                  fontFamily: 'Pacifico',
                fontSize: 24,
                fontWeight: FontWeight.normal,
                 fontStyle: FontStyle.normal,
              
              ),
            ),
            SizedBox(
              height: 14,
            ),
            const Text(
              "We Are Creative Enjoy Our App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
              ),
            ),
            SizedBox(
              height: 200,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => LoginScreen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 63, 199, 68)), // Set the background color
                    foregroundColor: MaterialStateProperty.all(Colors.white), // Set the text color
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Rectangular shape
                      ),
                    ),
                  ),
                  child: Text("Start"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
