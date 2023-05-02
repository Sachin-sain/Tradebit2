// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:convert';
import 'package:exchange/component/style.dart';
import 'package:exchange/config/APIClasses.dart';
import 'package:exchange/config/APIMainClass.dart';
import 'package:exchange/config/SharedPreferenceClass.dart';
import 'package:exchange/config/ToastClass.dart';
import 'package:exchange/library/intro_views_flutter-2.4.0/lib/Constants/constant.dart';
import 'package:exchange/screen/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../config/constantClass.dart';
import '../setting/Notificationpage.dart';
import 'login.dart';
class OTPScreen extends StatefulWidget {
  String emailid;
  bool fromlogin;

  OTPScreen({this.emailid,this.fromlogin});
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var firstController = TextEditingController();
  var secondController = TextEditingController();
  var thirdController = TextEditingController();
  var fourthController = TextEditingController();
  var fifthController = TextEditingController();
  var sixthController = TextEditingController();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();
  FocusNode fourthFocusNode = FocusNode();
  FocusNode fifthFocusNode = FocusNode();
  FocusNode sixthFocusNode = FocusNode();
bool loginstart=false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:colorStyle.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Confirm Email OTP',
          style: appBarTextStyle,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 12.0,
            color: whiteColor,
          ),
          onPressed: () =>Navigator.of(context).pushReplacement(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new login())),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(fixPadding * 2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
          color: whiteColor,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Verification',
                    style: black18MediumTextStyle,
                  ),
                  heightSpace,
                  Text(
                    'Enter the OTP code from the email we just sent you.',
                    style: black14RegularTextStyle,
                  ),
                  heightSpace,
                  heightSpace,
                  // OTP Box Start
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 1 Start
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[200].withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 0.5, color: primaryColor),
                        ),
                        child: TextField(
                          controller: firstController,
                          style: black16RegularTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (v) {
                            if(firstController.text!="")
                            FocusScope.of(context)
                                .requestFocus(secondFocusNode);
                          },
                        ),
                      ),
                      // 1 End
                      // 2 Start
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[200].withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 0.5, color: primaryColor),
                        ),
                        child: TextField(
                          focusNode: secondFocusNode,
                          controller: secondController,
                          style: black16RegularTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (v) {
                            if(secondController.text!="")
                            FocusScope.of(context).requestFocus(thirdFocusNode);
                          },
                        ),
                      ),
                      // 2 End
                      // 3 Start
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[200].withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 0.5, color: primaryColor),
                        ),
                        child: TextField(
                          focusNode: thirdFocusNode,
                          controller: thirdController,
                          style: black16RegularTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (v) {
                            if(thirdController.text!="")
                            FocusScope.of(context)
                                .requestFocus(fourthFocusNode);
                          },
                        ),
                      ),
                      // 3 End
                      // 4 Start
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[200].withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 0.5, color: primaryColor),
                        ),
                        child: TextField(
                          focusNode: fourthFocusNode,
                          controller: fourthController,
                          style: black16RegularTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (v) {
                            if(fourthController.text!="")
                            FocusScope.of(context)
                                .requestFocus(fifthFocusNode);
                          },
                        ),
                      ), Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[200].withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 0.5, color: primaryColor),
                        ),
                        child: TextField(
                          focusNode: fifthFocusNode,
                          controller: fifthController,
                          style: black16RegularTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (v) {
                            if(fifthController.text!="")
                            FocusScope.of(context)
                                .requestFocus(sixthFocusNode);
                          },
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[200].withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(width: 0.5, color: primaryColor),
                        ),
                        child: TextField(
                          focusNode: sixthFocusNode,
                          controller: sixthController,
                          style: black16RegularTextStyle,
                          keyboardType: TextInputType.number,
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.center,
                          // onChanged: (v) {
                          //   loadingDialog();
                          // },
                        ),
                      ),
                      // 4 End
                    ],
                  ),
                  // OTP Box End
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // InkWell(
                //   onTap: () {
                //   },
                //   child: Text(
                //     'Resend Otp',
                //     style: primaryColor16MediumTextStyle,
                //   ),
                // ),
                heightSpace,
                InkWell(
                  borderRadius: BorderRadius.circular(7.0),
                  onTap: () {
                    setState(() {
                      loginstart=true;
                      String otp= firstController.text+secondController.text+thirdController.text+fourthController.text+fifthController.text+sixthController.text;
                      _emailverify(otp);

                    });
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         type: PageTransitionType.rightToLeft,
                    //      ));
                  },
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      gradient: LinearGradient(
                        // begin: Alignment.centerLeft,
                        // end: Alignment.bottomRight,
                        // stops: [0.1, 0.6, 1.0],
                        colors: [Color(0xff176980),Color(0xff143047)]
                      ),
                    ),
                    child: loginstart==true?CircularProgressIndicator():Text(
                      'Continue',
                      style: white16MediumTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _emailverify(String otp) async {
    final paramDic = {
      "email":widget.emailid.toString(),
      "otp": otp.toString(),
    };
    var response;
       response = await LBMAPIMainClass(APIClasses.LBM_emailverify, paramDic, "Post");
    var data = json.decode(response.body);
    if(data["status_code"]=='1'){
      print(data.toString());
      setState(() {
        loginstart=false;
      });
       SharedPreferenceClass.SetSharedData("token", data['data']['token']);
       SharedPreferenceClass.SetSharedData("name", data['data']['user']['name']);
      SharedPreferenceClass.SetSharedData("id", data['data']['user']['id'].toString());
      SharedPreferenceClass.SetSharedData("email", data['data']['user']['email']);
       SharedPreferenceClass.SetSharedData("profile_image", data['data']['user']['profile_image']);
      SharedPreferenceClass.SetSharedData("ref_link", data['data']['user']['referral_code']);
      SharedPreferenceClass.SetSharedData("number", data['data']['user']['mobile']);
      SharedPreferenceClass.SetSharedData("kyc_status", data['data']['user']['user_kyc_status']);
      SharedPreferenceClass.SetSharedData("kyc_msg", data['data']['user']['user_kyc_status_message']);
      SharedPreferenceClass.SetSharedData("fees", (data['data']['user']['fee_by_lbm']).toString());
      SharedPreferenceClass.SetSharedData("status", (data['data']['user']['status']).toString());
        SharedPreferenceClass.SetSharedData("isLogin", "true");

        setState(() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>bottomNavBar(index: 0,)),
          );
        });
      getCryptoData();
      notification("1");


    }
    else{
      setState(() {
        loginstart=false;
      });
      ToastShowClass.toastShow(context, 'Verification failed', Colors.red);
    }
  }
}
