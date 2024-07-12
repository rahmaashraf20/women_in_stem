import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:team_quiz_app/screens/login_screen.dart';
import 'package:team_quiz_app/utils/icons.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // responsive design
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                landingBackground,
              ),
              fit: BoxFit.cover)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.2,
          // ),
          Spacer(),
          Image.asset(appLogo),
          Text(
            "Quiz App",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Spacer(),
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
                  child: Text("Go to login screen")),
            ),
          ),
        ],
      ),
    )
        // Image.asset(landingBackground),
        );
  }
}
