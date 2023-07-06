import 'package:flutter/material.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({super.key});

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Categaries>Women",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.heart_broken)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("images/category bar.png")],
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Container(
                  height: 30,
                  width: 100,
                  margin: EdgeInsets.only(right: 320),
                  child: Text(
                    "Fusion Wear",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  height: 30,
                  width: 200,
                  margin: EdgeInsets.only(right: 210),
                  child: Text(
                    "Western Wear",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  height: 30,
                  width: 200,
                  margin: EdgeInsets.only(right: 250),
                  child: Text(
                    "Lingerie & SleepWear",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  margin: EdgeInsets.only(right: 320),
                  child: Text(
                    "FootWear",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  height: 30,
                  width: 200,
                  margin: EdgeInsets.only(right: 250),
                  child: Text(
                    "Sports & Active Wear",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  height: 30,
                  width: 200,
                  margin: EdgeInsets.only(right: 210),
                  child: Text(
                    "Beauty & Personal Care",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  margin: EdgeInsets.only(right: 320),
                  child: Text(
                    "Jewellery",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  margin: EdgeInsets.only(right: 320),
                  child: Text(
                    "Gadgets",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  height: 30,
                  width: 100,
                  margin: EdgeInsets.only(right: 320),
                  child: Text(
                    "Plus Size",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("images/category (1).png")],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("images/brand section.png")],
            ),
          ],
        ),
      ),
    );
  }
}
