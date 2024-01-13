import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}): super( key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  final  _firstNamecontroller  = TextEditingController();
  final   _lastNamecontroller = TextEditingController();
  final   _agecontroller = TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    _firstNamecontroller.dispose();
    _lastNamecontroller.dispose();
    _agecontroller.dispose();
    super.dispose();
  }
  Future signUp() async{
  if(passwordConfirmed()){
    // creat  user
    await  FirebaseAuth.instance.createUserWithEmailAndPassword(
      email:_emailcontroller.text.trim(),
      password:_passwordcontroller.text.trim(),
    );
    // add user detail
   addUserDetails(
      _firstNamecontroller.text.trim(),
      _lastNamecontroller.text.trim(),
       _emailcontroller.text.trim(),
       int.parse(_agecontroller.text.trim()),
   );
  }
  }
  

  Future  addUserDetails(String fistName,String lastName,String email,int age) async{

    final  Firestore = FirebaseFirestore.instance.collection("users").add({
      'fist name': fistName,
      'last name': lastName,
      'emai': email,
      'age': age,
    });
  }
  bool passwordConfirmed() {
    if(_passwordcontroller.text.trim() == _confirmpasswordcontroller.text.trim()) {
      return true;
    }
    else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  child:Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        const SizedBox(height:40),
                        const Text(
                          "Hello There",
                          style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 46,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 30),

                        const Text(
                          "Register  below with your Detail",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        // first Name textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            controller: _firstNamecontroller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: "First Name",
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Last Name textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            controller: _lastNamecontroller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: "Last Name",
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Age textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            controller: _agecontroller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: "Age",
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
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
                        SizedBox(height: 20),
                        // confirm password  textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextField(
                            obscureText: true,
                            controller: _confirmpasswordcontroller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurple),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: " Confirm Password",
                              fillColor: Colors.white,
                              filled: true,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        // sign in button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:20.0),
                          child: GestureDetector(
                            onTap: signUp,
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
                                    "Sign Up",
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
                              " I am a member?",style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            GestureDetector(
                              onTap: widget.showLoginPage,
                              child: Text(
                                " Login now",style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
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
