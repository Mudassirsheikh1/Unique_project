import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unique_project/main.dart';
import 'package:unique_project/pages/body.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
  AppBar buildAppBar() {
      return AppBar(
   backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            color: Colors.black,
              icon:SvgPicture.asset("assets/icons/back.svg",
                color: Colors.black,
              ),
              onPressed: () {
              FirebaseAuth.instance.signOut();
              }),
          actions:<Widget>[
            IconButton(icon:SvgPicture.asset("assets/icons/search.svg",
             color: Colors.black,
            ),
              onPressed: (){},
            ),
            IconButton(icon:SvgPicture.asset("assets/icons/cart.svg",
              color: Colors.black,
            ),
              onPressed: (){},
            ),
          ]
      );
  }

}

