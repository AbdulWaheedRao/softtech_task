import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_softtech_task/main.dart';
import 'package:flutter_softtech_task/view/products_screen.dart';
import 'package:flutter_softtech_task/view/signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globlekey = GlobalKey<FormState>();
  GlobalKey<FormState> globlekey1 = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    clientHeight = screenHeight - kToolbarHeight;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        automaticallyImplyLeading: false,
        title: const Text('Login'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(children: [
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
              flex: 6,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ),
                    SizedBox(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.15,
                      child: Form(
                          key: globlekey,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                              decorationColor: Colors.white,
                            ),
                            controller: emailController,
                            decoration: InputDecoration(
                                prefixIconColor: Colors.white,
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                hintText: 'Enter the Address',
                                hoverColor: Colors.white,
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                fillColor: Colors.white,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                prefixIcon: const Icon(Icons.home),
                                focusColor: Colors.white,
                                iconColor: Colors.white,
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                  decorationColor: Colors.white,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                labelText: 'Address'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the adress';
                              } else if (value.isValidAlpha()) {
                                return null;
                              } else {
                                return 'invalid';
                              }
                            },
                          )),
                    ),
                    SizedBox(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.15,
                      child: Form(
                          key: globlekey1,
                          child: TextFormField(
                            obscureText: true,
                            obscuringCharacter: "*",
                            keyboardType: TextInputType.name,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                              decorationColor: Colors.white,
                            ),
                            controller: passwordController,
                            decoration: InputDecoration(
                                hintText: 'Enter the Password',
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                prefixIconColor: Colors.white,
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                hoverColor: Colors.white,
                                fillColor: Colors.white,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                prefixIcon: const Icon(Icons.remove_red_eye),
                                focusColor: Colors.white,
                                iconColor: Colors.white,
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                  decorationColor: Colors.white,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    )),
                                labelText: 'Password'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter the password';
                              } else {}
                            },
                          )),
                    ),

                    InkWell(
                      child: Container(
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.white.withOpacity(0.5),
                                    offset: const Offset(0, -5)),
                                BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.white.withOpacity(0.5),
                                    offset: const Offset(0, 5)),
                                BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.white.withOpacity(0.5),
                                    offset: const Offset(-5, 0)),
                                BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.white.withOpacity(0.5),
                                    offset: const Offset(5, 0))
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          alignment: Alignment.center,
                          child: Text("Login",
                              style: GoogleFonts.fasthand(
                                  color: Colors.white, fontSize: 20))),
                      onTap: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => const DashboardScreen(),
                          // ));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('No user found for that email.'),
                            ));
                          } else if (e.code == 'wrong-password') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  'Wrong password provided for that user.'),
                            ));
                          }
                        }

                        globlekey.currentState!.validate();
                        globlekey1.currentState!.validate();
                      },
                    ),
                  ])),
          Expanded(
              flex: 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: screenWidth * 0.6,
                        height: screenHeight * 0.07,
                        child: FittedBox(
                            child: InkWell(
                                onTap: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateScreen(),
                                    )),
                                // Navigator.of(context)
                                //         .push(MaterialPageRoute(
                                //       builder: (context) =>
                                //           const CreateScreen(),
                                //     )),
                                child: const Text(
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    'New user?Create Account')))),
                  ]))
        ]),
      ),
    );
  }
}

extension validateDigit on String {
  bool isValidAlpha() {
    var length = this.length ?? 0;
    if (length != 0) {
      for (var i = 0; i < length; i++) {
        var code = this.codeUnits[i] ?? 0;
        //this is ASCII code for Alpha(capital & small letter)
        if (!(code >= 65 && code <= 90 || code >= 97 && code <= 122)) {
          return false;
        }
      }
      return true;
    }
    return false;
  }
}
