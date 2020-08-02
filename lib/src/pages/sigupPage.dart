import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  void _submit() {
    setState(() {
      if (_usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _emailController.text.isNotEmpty) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor:Color(0xffF5F5F5),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black,size: 25),
      ),

      backgroundColor:Color(0xffF5F5F5),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: new Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10,right:30,),
              child: Container(
                height:250,
                width:300,
//
                child: new Image.asset("assats/imags/3.png",width: 200,height: 200,),),),
            ListView( 

              physics: BouncingScrollPhysics(),
              
              children:<Widget>[

              
              Padding(
                padding: EdgeInsets.only(top: 180,),
                child: new Container(
                  padding: EdgeInsets.only(right: 0, left: 0),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(left: 180,top: 20),
                        child: new Text(
                          "انشاء الحساب",
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),),

                      Padding(
                        padding: const EdgeInsets.only(top:20,right: 10,left: 10,bottom: 8),
                        child: TextFormField(
                          controller: _usernameController,
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(top: 12,bottom: 12),
                            prefixIcon: Padding(padding: EdgeInsets.only(right: 5.0),child: Icon(Icons.perm_identity,size: 25,),) ,
                            hintText: 'الاسم',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ), ),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:10,right: 10,left: 10,bottom: 8),
                        child: TextFormField(
                          controller: _emailController,
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.emailAddress,
                          decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(top: 12,bottom: 12),
                              prefixIcon: Padding(padding: EdgeInsets.only(right: 5.0),child: Icon(Icons.email,size: 25,),) ,
                              hintText: 'البريد الالكتروني',
                              alignLabelWithHint: true,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              )),),),

                      Padding(
                        padding: const EdgeInsets.only(top:10,right: 10,left: 10,bottom: 15),
                        child: TextFormField(
                          controller: _passwordController,
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(top: 12,bottom: 12),
                            prefixIcon: Padding(padding: EdgeInsets.only(right: 5.0),child: Icon(Icons.lock,size: 25,),) ,
                            hintText: 'كلمة السر',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ), ),),
                      ),
                      new Container(
                        height: 50,width:200,
//
                        child: new RaisedButton(
                          color: Color(0xFF1D326D),
//
                          onPressed: _submit,
                          child: new Text(
                            "تسجيل ",
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20,),), ),),
                    ],
                  ),
                ),
              ),
            ],  ),
          ],
        ),
      ),
    );

  }
}