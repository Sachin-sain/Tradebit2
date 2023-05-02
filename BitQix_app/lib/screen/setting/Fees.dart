// ignore_for_file: must_be_immutable, must_call_super

import 'dart:convert';

import 'package:exchange/config/APIClasses.dart';
import 'package:exchange/config/APIMainClass.dart';
import 'package:exchange/config/ToastClass.dart';
import 'package:flutter/material.dart';

import '../../config/constantClass.dart';

class Fees extends StatefulWidget {
  int fees;
  Fees({this.fees});
  @override
  _FeesState createState() => _FeesState();
}

class _FeesState extends State<Fees> {

  initState(){

  setState(() {
    isSwitched=widget.fees==null?false:widget.fees==1?true:false;

  });
  print("S W IT C H ?  "+widget.fees.toString());
   // Getverification();
  }

  Future<void> fees(String value) async {
    final paramDic = {
      "fee_by_lbm":value.toString(),
    };
    print(paramDic);
    var response;
    response = await LBMAPIMainClass(APIClasses.fees, paramDic, "Post");
    var data = json.decode(response.body);
    print(response);
    if(data["status_code"]=='1'){
      ToastShowClass.toastShow(context, data["message"], Colors.blue);
    }
    else{
      ToastShowClass.toastShow(context,data["message"], Colors.red);
    }
  }

  // Future<void> Getverification() async {
  //   final paramDic = {
  //     "":"",
  //   };
  //   print(paramDic);
  //   var response;
  //   response = await LBMAPIMainClass(APIClasses.authverifyget, paramDic, "Get");
  //   var data = json.decode(response.body);
  //   print(response);
  //   if(data["status_code"]=='1'){
  //     print(data.toString());
  //     setState(() {
  //       isSwitched=data['data']['fee_by_lbm']==1?true:false;
  //       print(" fesss stastysss  "+isSwitched.toString());
  //      //isSw+itched=isSwitched;
  //
  //     });
  //
  //   }
  //   else{
  //     ToastShowClass.toastShow(context,data["message"], Colors.red);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fees Detail",style: TextStyle(fontFamily: "IBM Plex Sans")),backgroundColor: Color(0xff17394f),),
               backgroundColor: day==false?Colors.black:Colors.white,
//
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           height: 300,
//           decoration: BoxDecoration(
//             border: Border.all(color:day==false?Colors.white54:Colors.black54),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Pay trading fees with BTQ",style: TextStyle(color:day==false?Colors.white:Colors.black,fontWeight: FontWeight.bold),),
//                     Transform.scale(
//                       scale: 0.7,
//                       child: CustomSwitch(
//                         value: isSwitched,
//                         activeColor: Color(0xff17394f),
//                         onChanged: (value) {
//                           print("VALUE : $value");
//                           setState(() {
//                             isSwitched = value;
//                             String fee = isSwitched==true?"1":"0";
//                               fees(fee.toString());
//
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 5,),
//                 Text('''Enable this option to pay trading fees with:
//
// 1. BTQ you buy from the exchange.
// 2. Unlocked BTQ balance reserved for trading fees.''',style: TextStyle(color:day==false?Colors.white:Colors.black),),
//                 SizedBox(height: 15,),
//                 Row(
//                   children: [
//                     Text("Note:",style: TextStyle(color:day==false?Colors.white:Colors.black,fontWeight: FontWeight.bold)),
//                     Text(" You'll get 50% discount if you pay fees via BTQ.",style: TextStyle(color:day==false?Colors.white:Colors.black)),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       )
    );
  }
}
