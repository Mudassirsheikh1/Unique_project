import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unique_project/pages/forgot_pw_page.dart';
class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}): super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text Controller
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future signIn()  async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailcontroller.text.trim(),
      password: _passwordcontroller.text.trim(),
    );
  }
    @override
    void dispose(){
      _emailcontroller.dispose();
      _passwordcontroller.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pic1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child:SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.android,
                        size: 130,
                        color: Colors.white,
                      ),
                      const SizedBox(height:40),
                      const Text(
                        "Hello Again",
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 46,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        "Welcome Back To My Application",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 50),
                      // Email textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          controller: _emailcontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: "Email",
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // password  textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          obscureText: true,
                          controller: _passwordcontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: "Password",
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      // forgot password
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap:(){
                                Navigator.push(context,MaterialPageRoute(builder: (context) {
                                  return  ForgotPasswordPage();
                                },
                                )
                                );
                              },
                              child: Text("Forgot password",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // sign in button
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:20.0),
                        child: GestureDetector(
                          onTap: signIn,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              border: Border.all(color: Colors.purple),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      // sign in button
                      // not a member?egister now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Not a member?  ",style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          GestureDetector(
                            onTap: widget.showRegisterPage ,
                               child: Text(
                                "Register now",style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                            ),
                            ),
                             ),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
