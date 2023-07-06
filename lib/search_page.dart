import 'package:flutter/material.dart';

class Search_Page extends StatefulWidget {
  const Search_Page({super.key});

  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,
        title: Text(
          "Women Collection",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),actions: [IconButton(onPressed: () {

        }, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {

        }, icon: Icon(Icons.heart_broken)),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/search panel.png")
            ],
          ),
          SizedBox(height: 10,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/product section.png")
                ],
              ),
            ],
          )
        ],),
      ),
    );
  }
}
