import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:login_screen/categaries.dart';

import 'package:login_screen/screen/profile_page.dart';
import 'package:login_screen/login_page.dart';
import 'package:login_screen/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Categary extends StatefulWidget {



  @override
  State<Categary> createState() => _CategaryState();
}

class _CategaryState extends State<Categary> with TickerProviderStateMixin {
  int cur_ind = 0;
  String email ="";

  TabController? tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_drawer();
    tabController =
        TabController(initialIndex: cur_ind, length: 3, vsync: this);
  }
  get_drawer()
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
String auth =prefs.getString("auth")!;
print(auth);
    var data = jsonDecode(auth);
    var myMap = Map<String, dynamic>.from(data);
print(myMap['email']);
setState(() {
  email =myMap['email'];
});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("images/Rectangle (2).png",
                            fit: BoxFit.cover),
                        Container(
                          margin: EdgeInsets.all(25),
                          child: Text(
                            "Hello,${email}",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 125),
                        height: 40,
                        width: 100,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Home",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Text(
                          "Offers,Top Deals,Top Brands",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.category),
                  title: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 125),
                        height: 40,
                        width: 100,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Categaries",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          "Men,Womens,Kids,Beauty",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle_outlined),
                  title: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 100),
                        height: 50,
                        width: 200,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Account",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          "Profiles,Settings,ave Cards",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 100),
                        height: 50,
                        width: 120,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Notification",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          "Offers,Order traking message..",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 125),
                        height: 50,
                        width: 100,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Language",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          "Select your Language here...",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 125),
                        height: 50,
                        width: 100,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Settings",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          "App Settings,Dark mode..",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.call),
                  title: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(),
                        height: 50,
                        width: 200,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Help/Customer Care",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          "Customer Supports ,FAQS..",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.account_circle_rounded),
                    title: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(),
                          height: 50,
                          width: 200,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Profile Settings",
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 40),
                          child: Text(
                            "Full name,Password..",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(onTap: () async {
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.remove('auth');

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return second_page();
                  },));
                },
                  child: Container(
                    height: 40,
                    width: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Logout",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "Multikart",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [Categaries(), Search_Page(), Profile_page()],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cur_ind,
              onTap: (int index) {
                cur_ind = index;
                tabController!.animateTo(cur_ind);
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    label: "",
                    icon: Icon(
                      Icons.category,
                      color: Colors.black,
                      size: 30,
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30,
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.black,
                      size: 30,
                    ))
              ]),
        ));
  }
}
