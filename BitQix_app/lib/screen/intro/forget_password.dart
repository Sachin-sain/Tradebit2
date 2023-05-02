// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';

import '../../config/APIClasses.dart';
import '../../config/APIMainClass.dart';
import '../../config/ToastClass.dart';
import 'Phone_Verify.dart';
import 'login.dart';

class forgetPassword extends StatefulWidget {
  @override
  _forgetPasswordState createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();
bool isclick=false;
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Form(
      key: _formKeys,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ///
            /// Set image in top
            ///
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/image/background.png',
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 25,right: 5,left: 5),
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Center(
                            child: Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                    'assets/image/logo.png'
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 40.0),
                          child: Container(
                            // color: Colors.yellow,
                            height: screenSize.height*0.1,
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  left:  screenSize.height*0.04, right:  screenSize.height*0.04, top: screenSize.height*0.01),
                              child: TextFormField(
                                validator: (value) => EmailValidator.validate(value) ? null : "Email cannot be empty",
                                style: new TextStyle(color: Colors.white, fontFamily: "IBM Plex Sans",),
                                textAlign: TextAlign.start,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                //obscureText: true,
                                autofocus: false,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white,),
                                    ),
                                    icon: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10.0),
                                      child: Icon(
                                        Icons.email,
                                        size: 20,
                                        color:  Colors.white,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(0.0),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    labelText: 'Email',
                                    hintStyle:
                                    TextStyle(color: Colors.white, fontFamily: "IBM Plex Sans",),
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 60.0),
                          child: InkWell(
                            onTap: (){
                              if(_formKeys.currentState.validate()){
                                setState(() {
                                  isclick=true;
                                });
                                forgetpassord(_emailController.text);
                              }else{
                                setState(() {
                                  isclick=false;
                                });
                              }


                            },
                            child: Container(
                              height: 50.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: Colors.white12,
                              ),
                              child: Center(
                                child: isclick==true?Container(height: 15,width: 15,child: CircularProgressIndicator(),):Text(
                                  "Send Verification Email",
                                  style: TextStyle( fontFamily: "IBM Plex Sans",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      letterSpacing: 1.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => new login()));
                            },
                            child: Container(
                              height: 50.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white12,
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 0.35,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Already Have an Account ? Sign In",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      letterSpacing: 1.2),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),

          ],
        ),
      ),
    );
  }

  Future<void> forgetpassord(String email) async {
    final paramDic = {
      "email": email.toString(),
    };
    var response;
    response = await LBMAPIMainClass(APIClasses.LBM_forgetpassword, paramDic, "Post");

    var data = json.decode(response.body);

    if(data["status_code"]=='1'){
      setState(() {
        isclick=false;
      });
      ToastShowClass.toastShow(context, data['message'], Colors.blue);
      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => new PhoneScreen(screen_name: "Password")));
    }
    else{
      setState(() {
        isclick=false;
      });
      ToastShowClass.toastShow(context, data['message'], Colors.blue);
    }
  }

}
