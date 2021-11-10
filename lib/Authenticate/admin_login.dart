import 'package:flutter/material.dart';
//import 'package:form_demo_app/sign_up.dart';

// import 'home.dart';

class AdminLoginPage extends StatefulWidget {
  AdminLoginPage({Key key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLoginPage> {
  
  String email, password;
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
        child: Form(
          key: _formKey,
        child: Column(
          children: <Widget>[
          
            // login section
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Login in',
                style: TextStyle(fontSize: 20),
              ),
            ),

            //form section
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: 'abcd@email.com',
                suffixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),

              //validating email field
              //  validator: (String value){
              //         if(value.isEmpty)
              //         {
              //           return 'Please a Enter';
              //         }
              //         if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
              //           return 'Please a valid Email';
              //         }
              //         return null;
              //       },
              //       onSaved: (String value){
              //         email = value;
              //       },

              

            ),

            SizedBox(
              height: 10.0,
            ),
            TextField(
              
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                // hintText: '',
                suffixIcon: Icon(Icons.visibility_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),

            // SizedBox(
            //   height: 10.0,
            // ),
            // // ignore: deprecated_member_use
            // FlatButton(
            //   onPressed: () {
            //     //forgot password screen
            //   },
            //   textColor: Colors.blue,
            //   child: Text('Forgot Password ?'),
            // ),
            // Container(
            //   height: 50,
            //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            //   // ignore: deprecated_member_use
            //   child: RaisedButton(
            //     textColor: Colors.white,
            //     color: Colors.blue,
            //     child: Text('Login'),
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(16.0))),
            //     onPressed: () {},
            //   ),
            // ),

            // Container(
            //   child: Row(
            //     children: <Widget>[
            //       Text('Does not have account?'),
            //       // ignore: deprecated_member_use
            //       FlatButton(
            //         textColor: Colors.blue,
            //         child: Text(
            //           'Sign in',
            //           style: TextStyle(fontSize: 20),
            //         ),
            //         onPressed: () {
            //           // signup screen
            //           // Navigator.pushReplacement(
            //           //   context,
            //           //   MaterialPageRoute(
            //           //     builder: (BuildContext context) => SignUpPage(),
            //           //   ),
            //           // );
            //         },
            //       )
            //     ],
            //     mainAxisAlignment: MainAxisAlignment.center,
            //   ),
            // ),
          ],
        ),
      ),
      ),),
    );
  }
}
