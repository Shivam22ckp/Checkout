import 'package:checkoutapp/pages/signin.dart';
import 'package:checkoutapp/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Password Reset Email has been sent !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No user found for that email.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 70.0,
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text(
              'Password Recovery',
              style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  "Enter the email associated with your account",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14.0),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    "and we shall send an email with instructions",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 14.0),
                  ),
                ),
                Text(
                  "to reset your password",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 14.0),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: Form(
          //     key: _formKey,
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          //       child: ListView(
          //         children: [
          //           Container(
          //             margin: EdgeInsets.symmetric(vertical: 10.0),
          //             padding: EdgeInsets.all(10),
          //             decoration: BoxDecoration(color: Colors.grey[200]),
          //             child: TextFormField(
          //               autofocus: false,
          //               decoration: InputDecoration(
          //                 labelText: 'EmaiL(Optional)',
          //                 labelStyle: TextStyle(fontSize: 16.0),
          //                 errorStyle:
          //                     TextStyle(color: Colors.redAccent, fontSize: 15),
          //               ),
          //               controller: emailController,
          //               validator: (value) {
          //                 if (value == null || value.isEmpty) {
          //                   return 'Please Enter Email';
          //                 } else if (!value.contains('@')) {
          //                   return 'Please Enter Valid Email';
          //                 }
          //                 return null;
          //               },
          //             ),
          //           ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            width: MediaQuery.of(context).size.width,
            height: 55,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                "Email(Optional)",
                style: TextStyle(color: Colors.grey, fontSize: 18.0),
              ),
            ),
          ),

          // Container(
          //   margin: EdgeInsets.only(left: 60.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {
          //           // Validate returns true if the form is valid, otherwise false.
          //           if (_formKey.currentState!.validate()) {
          //             setState(() {
          //               email = emailController.text;
          //             });
          //             resetPassword();
          //           }
          //         },
          //         child: Text(
          //           'Send Email',
          //           style: TextStyle(fontSize: 18.0),
          //         ),
          //       ),
          //       TextButton(
          //         onPressed: () => {
          //           Navigator.pushAndRemoveUntil(
          //               context,
          //               PageRouteBuilder(
          //                 pageBuilder: (context, a, b) => SignIn(),
          //                 transitionDuration: Duration(seconds: 0),
          //               ),
          //               (route) => false)
          //         },
          //         child: Text(
          //           'Login',
          //           style: TextStyle(fontSize: 14.0),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text("Don't have an Account? "),
          //       TextButton(
          //           onPressed: () => {
          //                 Navigator.pushAndRemoveUntil(
          //                     context,
          //                     PageRouteBuilder(
          //                       pageBuilder: (context, a, b) => SignUp(),
          //                       transitionDuration: Duration(seconds: 0),
          //                     ),
          //                     (route) => false)
          //               },
          //           child: Text('Signup'))
          //     ],
          //   ),
          // )
          SizedBox(
            height: 40.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                "Send Instructions",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
