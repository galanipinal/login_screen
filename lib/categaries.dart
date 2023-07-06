import 'package:flutter/material.dart';
import 'package:login_screen/image_list.dart';

class Categaries extends StatefulWidget {

  @override
  State<Categaries> createState() => _CategariesState();
}

class _CategariesState extends State<Categaries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,
        title: Text(
          "Categaries",
          style: TextStyle(fontSize: 20,color: Colors.black),
        ),actions: [IconButton(onPressed: () {

        }, icon: Icon(Icons.heart_broken)),IconButton(onPressed: () {

        }, icon: Icon(Icons.shopping_cart))],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset("images/${product.im[index]}",
                      height: 80, width: double.infinity, fit: BoxFit.cover),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
