import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unique_project/pages/categories.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text("Burger",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Categories(),
      Expanded(child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: GridView.builder(
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.75,
          ),
            itemBuilder: (context,index) => ItemCard(),
        ),
      ),
      ),
        ]
    );
  }
}
  class ItemCard extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
             // height: 160,
             // width: 180,
              decoration: BoxDecoration(
                color:Colors.black,
                borderRadius: BorderRadius.circular(16)
              ),

              child: Image.asset("assets/images/pic3.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text('BURGER',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Text("\$25",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ],
        );
  }
}

