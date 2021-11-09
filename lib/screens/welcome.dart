import 'package:flutter/material.dart';
import 'package:new_app/Authenticate/login.dart';
import 'package:new_app/Authenticate/signup.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  navigateToSignIn() async {
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
    Navigator.pushReplacementNamed(context, "SignUp");
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'get quick help in emergency situations',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),

              // the image section
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/tracking.png"),
                  ),
                ),
              ),

              Column(
                children: <Widget>[
                  //the login button
                  MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: navigateToSignIn,

                      //defining the shape
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ))
                ],
              ),

              //create the signup button
              SizedBox(height: 10),
              MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: navigateToRegister,

                //defining the shape
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ),

              // sign in with google
              
             

            ],
          ),
        ),
      ),
    );
}
}