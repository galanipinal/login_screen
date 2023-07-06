import 'package:flutter/material.dart';
import 'package:login_screen/login_page.dart';
import 'package:login_screen/sign_up.dart';


void main() {
  runApp(MaterialApp(
    home: Dashboard(),
    debugShowCheckedModeBanner: false,
  ));
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  "images/logo (1).png",
                )))),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Sign_up();
              },));
            },
              child: Container(
                height: 40,
                width: 60,
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(left: 120),
                child: Text(
                  "SKIP",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            )

            // Image.asset("images/logo (1).png",fit: BoxFit.fill,),
          ],
        ),
        // SizedBox(
        //   height: 100,
        // ),
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/splash_screen.png")))),
        ),
        SizedBox(
          height: 70,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return second_page();
              },
            ));
          },
          child: Container(
            child: Center(
                child: Text(
              "START SHOPPING",
              style: TextStyle(color: Colors.white),
            )),
            height: 50,
            width: 370,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    ));
  }
}
