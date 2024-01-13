import 'package:flutter/material.dart';
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Shawarma","ParathaRoll","Pizza","Drink","Burger"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:20),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context,index) => buildCategory(index),
        ),
      ),
    );
  }
  Widget buildCategory (int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: selectedIndex == index ?Colors.black:Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:2),
              height: 2,
              width: 30,
              color:selectedIndex == index ? Colors.black: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
