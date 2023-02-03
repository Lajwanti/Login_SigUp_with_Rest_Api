
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void register(String email, password) async{
    try{
      Response response = await post(Uri.parse("https://reqres.in/api/register"),
      body: {
        "email" : email,
        "password" : password,
      }

      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data["token"]);
        print("Account create successfully");
      }
      else{
        print("Failed");
      }
    }
    catch(e){
      print(e.toString());
    }

  }
  void login(String email, password) async{
    try{
      Response response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {
            "email" : email,
            "password" : password,
          }

      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data["token"]);
        print("Login successfully");
      }
      else{
        print("Failed");
      }
    }
    catch(e){
      print(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Rest Api"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center ,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "email"
              ),
            ),
            SizedBox(height: 30),

            TextField(
              controller: passController,
              decoration: InputDecoration(
                  hintText: "password"
              ),
            ),
            SizedBox(height: 60),
            InkWell(
              onTap: (){
                register(emailController.text.toString(), passController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(child: Text("Sign up"),),
              ),
            )

          ],
        ),
      ),
    );
  }
}
