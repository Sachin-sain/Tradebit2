
// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:exchange/config/APIClasses.dart';
import 'package:exchange/config/APIMainClass.dart';
import 'package:exchange/config/SharedPreferenceClass.dart';
import 'package:exchange/config/constantClass.dart';
import 'package:exchange/screen/intro/login.dart';
import 'package:exchange/screen/setting/Authentication.dart';
import 'package:exchange/screen/setting/Fees.dart';
import 'package:exchange/screen/setting/KYC.dart';
import 'package:exchange/screen/setting/ReferralLink.dart';
import 'package:exchange/screen/setting/Report.dart';
import 'package:exchange/screen/setting/changepassword.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'Log.dart';
import 'Price_Notification.dart';
import 'Select_Currency.dart';
import 'Support.dart';

class setting extends StatefulWidget {
  ///
  /// Get data bloc from
  ///
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  ///
  /// Bloc for double theme
  ///
  bool theme = true;
  String selectedCurrency="USDT";
  String user_name;
  String user_email;
  String user_image;
  String login_status;
  String token;
  String status;
  String Number;
  String ref_link;
  String kyc_status;
  String kyc_msg;
  String fees;

  bool isDarkModeEnabled=day==true?false:true;



  @override
  void initState() {
    getdata();
    Getverification();
    super.initState();
  }
  Future<void> Getverification() async {
    final paramDic = {
      "": "",
    };
    print(paramDic);
    var response;
    response = await APIMainClassbinance(APIClasses.kyc_verify, paramDic, "Get");
    var data = json.decode(response.body);
    print(data);
    if (data["status_code"] == '1') {
      print("KYC DATA "+data.toString());
      setState(() {
        Verifiedstatus = data['data']['user_kyc_status'];
        kyc_msg = data['data']['user_kyc_status_message'];
        print("KYC STATUS ??   "+kyc_msg+Verifiedstatus.toString());
        //isSwitched=isSwitched;
      });
    } else {
     // ToastShowClass.toastShow(context, data["message"], Colors.red);
    }
  }
  // SharedPreferenceClass.SetSharedData("ref_link", data['data']['user']['referral_code']);
  // SharedPreferenceClass.SetSharedData("number", data['data']['user']['mobile']);
  // SharedPreferenceClass.SetSharedData("kyc_status", data['data']['user']['user_kyc_status']);
  // SharedPreferenceClass.SetSharedData("kyc_msg", data['data']['user']['user_kyc_status_message']);
  // SharedPreferenceClass.SetSharedData("fees", data['data']['user']['fee_by_lbm']);
  // SharedPreferenceClass.SetSharedData("status", data['data']['user']['status']);
  getdata() async {

    //selected_currency=await SharedPreferenceClass.GetSharedData('Currency');
      user_name=await SharedPreferenceClass.GetSharedData('name');
      user_email=await SharedPreferenceClass.GetSharedData('email');
      user_image=await SharedPreferenceClass.GetSharedData('profile_image');
      token=await SharedPreferenceClass.GetSharedData('token');
      status=await SharedPreferenceClass.GetSharedData('status');
      Number=await SharedPreferenceClass.GetSharedData('number');
      ref_link=await SharedPreferenceClass.GetSharedData('ref_link');
      kyc_status=await SharedPreferenceClass.GetSharedData('kyc_status');
      // kyc_msg=await SharedPreferenceClass.GetSharedData('kyc_msg');
      fees=await SharedPreferenceClass.GetSharedData('fees');
      login_status=await SharedPreferenceClass.GetSharedData("isLogin");
   print(token.toString());
      setState(() {
        user_name=user_name;
        user_email=user_email;
        user_image=user_image;
        login_status=login_status;
        status=status;
        Number=Number;
        ref_link=ref_link;
        kyc_status=kyc_status;
        // kyc_msg=kyc_msg;
        fees=fees;
        Verifiedstatus=kyc_status;




      });
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
  }
  Future<void> logout(String SingleALL) async {

    final paramDic = {
      "":""
    };
    print(paramDic.toString());
    var uri;
    if(SingleALL=="All"){
      uri =  Uri.https(APIClasses.LBM_BaseURL, APIClasses.logoutall);

    }else{
      uri = Uri.https(APIClasses.LBM_BaseURL, APIClasses.logout);

    }
    print(uri.toString());

    HttpClient httpClient = HttpClient();

    HttpClientRequest request = await httpClient.deleteUrl(uri);
    request.headers.set('Accept', 'application/json');
    request.headers.set('Authorization','Bearer '+ await SharedPreferenceClass.GetSharedData('token'));

    request.add(utf8.encode(json.encode(paramDic)));
    HttpClientResponse response = await request.close();
    // var response = await LBMAPIMainClass(APIClasses.LBM_register, paramDic, "Post");
    String reply = await response.transform(utf8.decoder).join();
    print(reply.toString());
    print(request.headers.toString());
    var data = jsonDecode(reply);
    print(data);
    if(data["status_code"]=="1"){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          login()), (Route<dynamic> route) => false);
    }
    else{
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          login()), (Route<dynamic> route) => false);

    }
  }


  @override
  Widget build(BuildContext context) {
  print("Current Status"+day.toString());
    return Scaffold(
backgroundColor: day==false?Colors.black:Colors.white,
      body: Container(
      color: day==false?Colors.black:Colors.white,
        child: SingleChildScrollView(
          child: Stack(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 50.0,left: 15),

                child: Row(
                  children: [
                    InkWell(
                        onTap:(){
                          Navigator.of(context).pop();
                          // ),
                        },
                        child: Icon(Icons.arrow_back_ios,color:day==false?Colors.white:Colors.black)),
                    Text(
                      "Settings",
                      style: TextStyle(
                          color:  day==false?Colors.white:Colors.black,
                          fontFamily: "IBM Plex Sans",
                          fontSize: 25.5,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
               padding: const EdgeInsets.only(top: 100.0, left: 15.0, right: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow:  [
                      new BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: Card(
                    color: day==false?Colors.transparent:Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        login_status=="true"? Padding(
                          padding: const EdgeInsets.only(left: 15.0,top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: Image.asset('assets/image/logo.png'),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(user_name,style: TextStyle(
                                      fontFamily: "IBM Plex Sans",
                                      fontSize: 15.5,
                                      color:  day==false?Colors.white:Colors.black,
                                      fontWeight: FontWeight.w700),),
                                  SizedBox(height: 5,),
                                  Text(user_email,style: TextStyle(
                                    fontFamily: "IBM Plex Sans",
                                    color:  day==false?Colors.white:Colors.black,
                                    fontSize: 12.5,
                                  ),),
                                  // SizedBox(height: 5,),
                                  Visibility(
                                    visible: Number==''?false:true,
                                    child: Text(Number==''?"":Number.toString(),style: TextStyle(
                                      fontFamily: "IBM Plex Sans",
                                      color:  day==false?Colors.white:Colors.black,
                                      fontSize: 12.5,
                                    ),),
                                  ),
                                  Text(status=='1'?" Status: Active":" Status: Deactive",style: TextStyle(
                                    fontFamily: "IBM Plex Sans",
                                    color:  day==false?Colors.white:Colors.black,
                                    fontSize: 12.5,
                                  ),),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 25,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: kyc_status == "completed"?Colors.green:Color(0xff173b52),
                                  borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(30.0),
                                    bottomLeft: const Radius.circular(30.0),),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Icon(kyc_status == "completed"?Icons.verified:Icons.sentiment_very_dissatisfied,size: 10,color: Colors.white,),
                                        SizedBox(width: 1,),
                                        Text(kyc_status == "completed"?"Verified":"unverified",style: TextStyle(fontSize: 10,color: Colors.white),),
                                      ],

                                    ),
                                  ),
                                ),
                              )

                            ],


                          ),
                        ): listSetting("Login", "SignIn/SignUp"),
                        SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          color: Color(0xff173b52),
                          child: listSetting("Mode", "Day/Night"),
                        ),
                           SizedBox(
                          height: 10.0,),
                        listSetting("Change Password", "Password"),
                        SizedBox(
                          height: 10.0,),
                        listSetting("Verify KYC", "Kyc"),
                        SizedBox(
                          height: 10.0,
                        ),

                        listSetting("Referral",  "Referral-Link"),

                        SizedBox(
                          height: 10.0,
                        ),
                        listSetting("Notification",  "Notifications"),

                        SizedBox(
                          height: 10.0,
                        ),
                        listSetting("Authentication", "Two Factor Authentication"),
                        SizedBox(
                          height: 10.0,
                        ),
                        listSetting("Fees", "Fees"),
                        SizedBox(
                          height: 10.0,
                        ),
                        listSetting("Log", "Activity Log"),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        // listSetting("Currency",  ''),
                        SizedBox(
                          height: 10.0,
                        ),
                        listSetting("Report",  "Download Trading Report"),
                        SizedBox(
                          height: 10.0,
                        ),

                        listSetting("Support",  "Help"),
                        SizedBox(
                          height: 10.0,
                        ),
                        Visibility(
                            visible: login_status=="true"?true:false,
                            child: listSetting("Logout", 'SignUp another A/c')),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }

  Widget listSetting(String header, String title) {
    return InkWell(
      onTap: () {
        if(header=='Verify KYC'){
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new VerifyKYC(kyc_msg: kyc_msg,kyc_Status: kyc_status,)));
        }else if(header=='Currency'){
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new SelectCurrency())).then((value) =>  initState());
        }else if(header=='Logout'){
           popupdialog();

        }else if(header=='Authentication'){
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new TwoFactorAuth()));
        }else if(header=='Fees'){
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new Fees(fees: int.parse(fees.toString()),)));
        }else if(header=='Log'){
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new ActivityLog()));
        }else if(header=='Report'){
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new Report()));
        }else if(header=='Mode'){
         /// mode change
        }else if(header=='Support'){
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new Support()));
        }else if(header=='Login'){

    Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new login()));
        }else if(header=='Change Password'){
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new ChangePassword()));
        }else if(header=='Referral'){
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new ReferralLink(link: ref_link,)));
        }else if(header=='Notification'){
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new PriceNotification()));
        }


    },

      child: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                header,
                style: TextStyle(
                    color:day==false ||header=="Mode"?Colors.white54:Colors.black54,
                    fontFamily: "IBM Plex Sans",
                    fontWeight: FontWeight.w600,
                    fontSize: 10.5),
              ),
              SizedBox(
                height: 9.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    child: Text(
                      title,
                      style: TextStyle(
                       // overflow: TextOverflow.fade,
                        color: day==false ||header=="Mode"?Colors.white54:Colors.black,
                          fontSize: 14.5,
                          fontFamily: "IBM Plex Sans",
                          fontWeight: FontWeight.w600),softWrap: true,
                    ),
                  ),
                  header=="Mode"?
                  DayNightSwitcher(
                    isDarkModeEnabled: isDarkModeEnabled,
                    onStateChanged: (isDarkModeEnabled) {
                      setState(() {
                        this.isDarkModeEnabled = isDarkModeEnabled;
                        setState(() {
                          SharedPreferenceClass.SetSharedData("day", isDarkModeEnabled==true?"dayfalse":"daytrue");
                          day=isDarkModeEnabled==true?false:true;
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (_, __, ___) => new bottomNavBar(index: 0,)));
                        });
                      });
                    },
                  ):header=="KYC"?Verifiedstatus!='new'?Icon(Icons.check_circle,color: Colors.green,):
                  Icon(Icons.keyboard_arrow_right,color: day==false?Colors.white:Colors.black,):Icon(Icons.keyboard_arrow_right,color: day==false?Colors.white:Colors.black,)
                ],
              ),
              header=="Mode"?SizedBox(): line()
            ],
          ),

      ),
    );
  }

  Widget line() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: double.infinity,
        height: 0.5,
        decoration: BoxDecoration(color:day==false?Colors.white54: Colors.black),
      ),
    );
  }


  void popupdialog() {

  showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Please Confirm'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Are you sure, you want to Logout?'),
                ],
              )],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Logout from all devices'),
              onPressed: () {

logout("All");
              },
            ),
                 TextButton(
              child: Text('Logout from this device'),
              onPressed: () {
         logout("Single");

              },
            ),
          ],
        );
      },
    );
  }
}
