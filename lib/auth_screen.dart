import 'package:flutter/material.dart';
import 'package:gassmen/constans.dart';
import 'package:gassmen/mainpage.dart';
import 'package:gassmen/try_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
      child:  Column(
          children: <Widget>[
            Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 76),
                  color: Colors.white,
                  child: Text(
                    'gassmen'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 65, fontWeight: FontWeight.bold),
                  ),
                )
            ),
            Expanded(
              flex: 1,
                child: Container(
                  child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                          child: Column(
                            children: [
                            Text(
                            'Вход',
                            textAlign: TextAlign.center,
                            style:
                            GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                          ),
                          SizedBox(height: 30),
                          _buildTextField(nameController,  'Email', false),
                          SizedBox(height: 30),
                          _buildTextField(passwordController,  'пароль', true),
                          SizedBox(height: 30),
                          MaterialButton(
                              onPressed: (){
                                Get.to(()=>TryPage());
                              },
                            color: Colors.white,
                            child: Icon(Icons.arrow_forward, color: Colors.black, size: 25,),

                              )

                            ],
                          ),
                        )
                      ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),),
                    color: mainColor,

                  ),
                )
            ),
          ]
      ),
      ),
    );
  }

  _buildTextField(
      TextEditingController controller, String labelText, bool flag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          ),
      child: TextField(
        obscureText: flag,
        controller: controller,
        style: TextStyle(color: Colors.black, fontSize: 15),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.grey),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}

