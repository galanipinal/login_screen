import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:login_screen/login_page.dart';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  bool passwordVisible = false;

  bool err_email = false, err_pass = false, err_name = false;
  String message = "Register successful";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = true;

  }

  get_register() async {
    final dio = Dio();
    var response = await dio.post('http://kareliya.in/api/register.php',
        data: {"firstname": t1.text, "email": t2.text, "password": t3.text});
    var response1 = jsonDecode(response.data);

    print(response);
    if (response1['status'] == "true") {
      Fluttertoast.showToast(
        msg: "${message}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      setState(() {});
    } else {
      Fluttertoast.showToast(
          msg: "Something wrong",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {});
    }
  }

  // var client = http.Client();
  // try {
  //   var response = await client.post(
  //       Uri.https('http://kareliya.in/api/register.php', 'whatsit/create'),
  //       body: {'name': 'doodle', 'color': 'blue'});
  //   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  //   var uri = Uri.parse(decodedResponse['uri'] as String);
  //   print(await client.get(uri));
  // } finally {
  //   client.close();
  // }
//     var url ="http://kareliya.in/api/register.php";
//     var data = {
//       "firstname" : t1.text,
//       "email" :t2.text,
//       "password" : t3.text
//
//     };
//     print(data);
//     print(url);
//     var bodyy = json.encode(data);
//     var urlparse = Uri.parse(url);
//     var response = await http.post(
//         urlparse,
//       body: bodyy,
//       headers: {
//         "Content Type":"application/json",

//       }
//     );
// print(response);
//     if(response.statusCode == 200){
//       var data1 = jsonDecode(response.body.toString());
//       print(data1);
//       print("Succsesfully");
//     }else{
//       print("failed");
//     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
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
            height: 50,
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
              Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: t1,
                  decoration: InputDecoration(
                      labelText: " Name",
                      hintText: " Name",
                      border: OutlineInputBorder()),
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: t2,
                  decoration: InputDecoration(
                      labelText: "Enter Email/Phone",
                      hintText: "Enter Email/Phone",
                      border: OutlineInputBorder()),
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: t3,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Enter Password",
                    labelText: "Enter Password",
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
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  get_register();
                  String name, email, password;
                  name = t1.text;
                  email = t2.text;
                  password = t3.text;

                  if (name == "") {
                    // err_name = true;
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Enter your Name")));
                    setState(() {});
                  } else if (email == "") {
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
                },
                child: Container(
                  child: Center(
                      child: Text(
                    "SIGN Up",
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
                  "___________________Or sign up with_____________________",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text("Already have an Account?"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return second_page();
                        },
                      ));
                    },
                    child: Text(
                      "Sign In",
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
    ));
  }
}
