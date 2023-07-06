import 'dart:convert';

import 'package:flutter/material.dart';
import 'drawer_demo.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class second_page extends StatefulWidget {
  const second_page({super.key});

  @override
  State<second_page> createState() => _second_pageState();
}

class _second_pageState extends State<second_page> {

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  bool passwordVisible = false;
  bool err_email = false, err_pass = false;


  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
   get_pref();


  }
  get_pref()
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data =prefs.getString("auth")!;

    print('hi $data');
  }

  login_api()
  async {
    final dio = Dio();
    var response = await dio.post('http://kareliya.in/api/login.php',
        data: { "email": t1.text, "password": t2.text});
    var response1 = jsonDecode(response.data);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (response1['status'] == "true") {
      await prefs.setString('auth',jsonEncode(response1['data']));
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 100,
                    width: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                      "images/logo (1).png",
                    )))),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 320),
                  child: Text(
                    "Hey,",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 18),
                  child: Text(
                    "Login Now",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(left: 18, right: 18),
                    child: TextField(
                      controller: t1,
                      decoration: InputDecoration(
                          hintText: " Email ",
                          labelText: "Username Or Email",

                          border: OutlineInputBorder(),),



                    ),
                    // child: Center(child: Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(left: 18, right: 18),
                    child: TextField(
                      obscureText: passwordVisible,
                      controller: t2,
                      decoration: InputDecoration(
                          hintText: "  Password ",
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          ),
                          border: OutlineInputBorder()),
                    ),
                    // child: Center(child: Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 250),
                  child: Text(
                    "Forget Password ?",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                InkWell(
                  onTap: () {
                    login_api();

                    String email, password;
                    email = t1.text;
                    password = t2.text;

                    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    RegExp regExp = new RegExp(patttern);

                    if (email == "") {
                      err_email = true;
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Enter Your Email")));
                      setState(() {});
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email)) {
                      err_email = true;
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Enter Your Vaild Email")));
                      setState(() {});
                    } else if (password == "") {
                      err_pass = true;
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Enter Your Password")));
                      setState(() {});
                    } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(password)) {
                      err_pass = true;
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Enter Your valid Password")));
                      setState(() {});
                    }

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Categary();
                      },
                    ));
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      "SIGN IN",
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
                  height: 35,
                ),
                Container(
                  child: Text(
                    "___________________Or sign in with_____________________",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/btns.png"))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text("If you are new."),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Create Now",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
