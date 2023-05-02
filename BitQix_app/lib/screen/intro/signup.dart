// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:exchange/config/APIClasses.dart';
import 'package:exchange/config/APIMainClass.dart';
import 'package:exchange/config/ToastClass.dart';
import 'package:exchange/screen/intro/Phone_Verify.dart';

import 'package:exchange/screen/intro/login.dart';
import 'package:flutter/material.dart';
import 'package:exchange/component/style.dart';

import 'Term_condition.dart';

class signUp extends StatefulWidget {

  @override
  _signUpState createState() => _signUpState();
}
const htmlData='';
var terms=[];

class _signUpState extends State<signUp> {
  final GlobalKey<FormState> _formKeys = GlobalKey<FormState>();
  bool registered=false;
  bool password=false;
  bool referal=false;
  bool agree=false;
  @override
  void initState() {
    termconditions();
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confrmpasswordController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
bool _passwordVisible=true;
bool _passwordconfirmVisible=true;


  Future<void> termconditions() async {

    final paramDic = {
      "":""
    };
    var response;
    response = await LBMAPIMainClass(APIClasses.termconditions, paramDic, "Get");
    print(response);
    var data = json.decode(response.body);
    if(data["status_code"]=="1"){
      setState(() {
        terms=data['data'];
      });
   print(terms);
    }else{
      terms="No Term Condition" as List;
    }

  }

  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Form(

      key :_formKeys,
      child: Scaffold(
        backgroundColor: colorStyle.primaryColor,
        body: Container(
          height: double.infinity,
          width: double.infinity,

          /// Set Background image in splash screen layout (Click to open code)
          decoration: BoxDecoration(color: colorStyle.primaryColor),
          child: Stack(
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

              Container(
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      /// Animation text marketplace to choose Login with Hero Animation (Click to open code)
                      Padding(
                        padding:
                            EdgeInsets.only(top: mediaQuery.padding.top + 20.0,bottom:mediaQuery.padding.bottom + 20.0 ),
                        child: Image.asset("assets/image/logo.png",  height: 100,
                          width: 100,),
                      ),

                      Column(
                        children: <Widget>[
                          Container(
                            // color: Colors.green,
                            height: screenSize.height*0.11,
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  left:  screenSize.height*0.04, right:  screenSize.height*0.04, top: screenSize.height*0.01),
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,

                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Please type an user name';
                                  }
                                  return null;
                                },
                                style: new TextStyle(color: Colors.white, fontFamily: "IBM Plex Sans",),
                                textAlign: TextAlign.start,
                                controller: _usernameController,
                                keyboardType: TextInputType.text,
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
                                        Icons.people,
                                        size: 20,
                                        color:  Colors.white,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(0.0),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    labelText: 'Username',
                                    hintStyle:
                                    TextStyle(color: Colors.white, fontFamily: "IBM Plex Sans",),
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            // color: Colors.red,
                            height:  screenSize.height*0.11,
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  left:  screenSize.height*0.04, right:  screenSize.height*0.04, top: screenSize.height*0.01),
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,

                                validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",

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
                                        color:   Colors.white,
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
                          Container(
                            height:screenSize.height*0.11,
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  left:  screenSize.height*0.04, right:  screenSize.height*0.04, top: screenSize.height*0.01),
                              child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,

                              validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Please type your password';
                                  }return null;
                                },
                                style: new TextStyle(color: Colors.white, fontFamily: "IBM Plex Sans",),
                                textAlign: TextAlign.start,
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                                autocorrect: false,
                                obscureText: _passwordVisible,
                                autofocus: false,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white,),
                                    ),
                                    icon: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10.0),
                                      child: Icon(
                                        Icons.vpn_key,
                                        size: 20,
                                        color:   Colors.white,
                                      ),
                                    ),
                                                               suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
               _passwordVisible
               ? Icons.visibility_off:Icons.visibility,
               color:  Colors.white,size: 15,
               ),
            onPressed: () {
               // Update the state i.e. toogle the state of passwordVisible variable
               setState(() {
                   _passwordVisible = !_passwordVisible;
               });
             },
            ),

                                    contentPadding: EdgeInsets.all(0.0),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    labelText: 'Password',
                                    hintStyle:
                                    TextStyle(color: Colors.white, fontFamily: "IBM Plex Sans",),
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            //color: Colors.pink,
                            height:  screenSize.height*0.11,
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  left:  screenSize.height*0.04, right:  screenSize.height*0.04, top: screenSize.height*0.01),
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,

                                validator: (input) {
                                  if (input.isEmpty) {

                                    if(_passwordController.text.isNotEmpty){
                                      return 'Please type confirm password';
                                    }return null;
                                  }else if(input!=_passwordController.text){
                                    return 'Confirm Password not Match';
                                  }
                                  else{
                                    // setState(() {
                                    //   password=true;
                                    // });
                                    return null;
                                  }
                                },
                                style: new TextStyle(color: Colors.white, fontFamily: "IBM Plex Sans",),
                                textAlign: TextAlign.start,
                                controller: _confrmpasswordController,
                                keyboardType: TextInputType.text,
                                autocorrect: false,
                                obscureText: _passwordconfirmVisible,
                                autofocus: false,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white,),
                                    ),
                                    icon: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10.0),
                                      child: Icon(
                                        Icons.vpn_key,
                                        size: 20,
                                        color:   Colors.white,
                                      ),
                                    ),
                                                               suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
               _passwordconfirmVisible
               ? Icons.visibility_off:Icons.visibility,
               color:  Colors.white,size: 15,
               ),
            onPressed: () {
               // Update the state i.e. toogle the state of passwordVisible variable
               setState(() {
                   _passwordconfirmVisible = !_passwordconfirmVisible;
               });
             },
            ),

                                    contentPadding: EdgeInsets.all(0.0),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    labelText: 'Confirm Password',
                                    hintStyle:
                                    TextStyle(color: Colors.white, fontFamily: "IBM Plex Sans",),
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Visibility(
                                visible: referal==false?true:false,
                                child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        referal=true;
                                      });
                                    },
                                    child: Center(child: Text("Referral Code",style:TextStyle(fontSize:17,fontWeight: FontWeight.w500,color: Colors.white))))),
                          ),


                          Visibility(
                            visible: referal==true?true:false,
                            child:   Column(
                              children: <Widget>[
                                Container(
                                  //   color: Colors.black,
                                  height:  screenSize.height*0.11,
                                  child: Padding(
                                    padding:  EdgeInsets.only(
                                        left:  screenSize.height*0.04, right:  screenSize.height*0.04, top: screenSize.height*0.01),
                                    child: TextFormField(
                                      style: new TextStyle(color: Colors.white, fontFamily: "IBM Plex Sans",),
                                      textAlign: TextAlign.start,
                                      controller: _referralController,
                                      keyboardType: TextInputType.text,
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
                                              Icons.code,
                                              size: 20,
                                              color:   Colors.white,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.all(0.0),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          labelText: 'Referral Code',
                                          hintStyle:
                                          TextStyle(color: Colors.white, fontFamily: "IBM Plex Sans",),
                                          labelStyle: TextStyle(
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(
                                left:  screenSize.height*0.04, right:  screenSize.height*0.04, top: screenSize.height*0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap:(){
                                    setState(() {
                                      agree=!agree;
                                    });

                                  },
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    color:agree==true? Colors.green:Colors.white,
                                    child: Icon(Icons.check,color: Colors.white,size: 15,),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).pushReplacement(PageRouteBuilder(
                                        pageBuilder: (_, __, ___) => new Terms()));
                                  },
                                  child: Padding(
                                    padding:  EdgeInsets.only(
                                      left:  screenSize.height*0.02, right: screenSize.height*0.04,),
                                    child: Text("Agree to terms and conditions.",style:TextStyle(fontSize:17,fontWeight: FontWeight.w500,color: Colors.white) ,),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      // Column(
                      //   children: <Widget>[
                      //     Container(
                      //       height:  screenSize.height*0.11,
                      //       child: Padding(
                      //         padding:  EdgeInsets.only(
                      //             left:  screenSize.height*0.04, right:  screenSize.height*0.04, top: screenSize.height*0.01),
                      //         child: TextFormField(
                      //           validator: (input) {
                      //             if (input.isEmpty) {
                      //               return 'Please type your phone no.';
                      //             }return null;
                      //           },
                      //           style: new TextStyle(color: Colors.white, fontFamily: "IBM Plex Sans",),
                      //           textAlign: TextAlign.start,
                      //           controller: _numberController,
                      //           keyboardType: TextInputType.number,
                      //           autocorrect: false,
                      //           //obscureText: true,
                      //           autofocus: false,
                      //           decoration: InputDecoration(
                      //               border: UnderlineInputBorder(
                      //                 borderSide: BorderSide(color: Colors.white,),
                      //               ),
                      //               icon: Padding(
                      //                 padding: const EdgeInsets.only(
                      //                     right: 10.0),
                      //                 child: Icon(
                      //                   Icons.call,
                      //                   size: 20,
                      //                   color:  colorStyle.background,
                      //                 ),
                      //               ),
                      //               contentPadding: EdgeInsets.all(0.0),
                      //               filled: true,
                      //               fillColor: Colors.transparent,
                      //               labelText: 'Mobile Number',
                      //               hintStyle:
                      //               TextStyle(color: Colors.white, fontFamily: "IBM Plex Sans",),
                      //               labelStyle: TextStyle(
                      //                 color: Colors.white,
                      //               )),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),


                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              registered=true;
                            });
                            final formState = _formKeys.currentState;
                            if (formState.validate()) {
                              if (_confrmpasswordController.text==_passwordController.text) {
                                 if(agree==true){
                                _registerUser(agree);
                              }

                              }else{
                                setState(() {
                                  password=true;
                                  registered=false;
                                });
                              }
                            }else{
                              setState(() {
                                registered=false;
                                password=true;
                              });
                            }
                          },
                          child: Container(
                            height: 50.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.0)),
                              color:Colors.white12,
                            ),
                            child: Center(
                              child: registered==true?CircularProgressIndicator(backgroundColor: Colors.white,):
                              Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0,bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(PageRouteBuilder(
                                pageBuilder: (_, __, ___) => new login(
                                )));
                          },
                          child: Container(
                            height: 50.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff4086f4),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.0)),
                              border: Border.all(
                                color: colorStyle.primaryColor,
                                width: 0.35,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17.5,),
                              ),
                            ),
                          ),
                        ),
                      ),
//                  Padding(
//                    padding: const EdgeInsets.only(left:20.0,right: 20.0,bottom: 15.0),
//                    child: Container(width: double.infinity,height: 0.15,color: colorStyle.primaryColor,),
//                  ),
//                  Text("Register",style: TextStyle(color: colorStyle.primaryColor,fontSize: 17.0,fontWeight: FontWeight.w800),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser(bool terms) async {
    final paramDic = {
      "name": _usernameController.text.toString(),
      "email": _emailController.text.toString(),
      "referral": _referralController.text.toString(),
      "password": _passwordController.text.toString(),
      "confirm_password": _confrmpasswordController.text.toString(),
      "terms":terms,

    };
    print(paramDic.toString());
    final uri = Uri.https(APIClasses.LBM_BaseURL, APIClasses.LBM_register);
    print(uri.toString());

    HttpClient httpClient = HttpClient();

    HttpClientRequest request = await httpClient.postUrl(uri);
    request.headers.set('content-type', 'application/json');

    request.add(utf8.encode(json.encode(paramDic)));
    HttpClientResponse response = await request.close();
    // var response = await LBMAPIMainClass(APIClasses.LBM_register, paramDic, "Post");
   String reply = await response.transform(utf8.decoder).join();
   var data = jsonDecode(reply);
   print(data);

    if(data["status_code"]=='1'){
      registered=false;
      ToastShowClass.toastShow(context, data["message"], Colors.blue);
      // SharedPreferenceClass.SetSharedData("isLogin", "true");
      Navigator.of(context)
          .pushReplacement(PageRouteBuilder(
              pageBuilder: (_, __, ___) => PhoneScreen())) ;}

    else{
      setState(() {
        registered=false;
      });
      ToastShowClass.toastShow(context, data["message"], Colors.red);
    }

  }
}
