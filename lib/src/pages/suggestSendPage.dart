import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProblemPag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProblemPagState();
  }
}

class ProblemPagState extends State<ProblemPag> {
  TextEditingController _problemController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  void _submit() {
    setState(() {
      if (_usernameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text(
          "ابلاغ  عن مشكلة",
        ),

        actions: [
          IconButton(icon: Icon(Icons.send), onPressed: (){

          }),
        ],
      ),
      backgroundColor: Color(0xffF5F5F5),
      body: 
             ListView(
               physics: BouncingScrollPhysics(),
               children: <Widget>[
               
              Container(
                alignment: Alignment.topCenter,
                height: 174,
                width: MediaQuery.of(context).size.width,
//
                child: new Image.asset(

                  "assats/imags/feedback.jpg",
                  fit: BoxFit.cover,
                  
                  width:  MediaQuery.of(context).size.width,
                  
                ),
              ),
              
              
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 15),
                child: TextFormField(
                  controller: _usernameController,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.only(top: 12, bottom: 12),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.perm_identity,
                        size: 25,
                      ),
                    ),
                    hintText: 'الاسم',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 15),
                child: TextFormField(
                  controller: _emailController,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.only(top: 12, bottom: 12),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.email,
                        size: 25,
                      ),
                    ),
                    hintText: 'البريد الالكتروني',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 15),
                child: TextFormField(
                  
                  maxLines: 7,
                  controller: _problemController,
                  keyboardType: TextInputType.multiline,
                  textAlign: TextAlign.right,
                  obscureText: false,
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 12, bottom: 12, right: 12),
                    alignLabelWithHint: true,
                    hintText: ' اكتب المشكلة هنا',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
             
            ]));
         
    
  }
}
