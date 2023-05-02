// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../config/APIClasses.dart';
import '../../../config/APIMainClass.dart';
import '../../../config/SharedPreferenceClass.dart';
import '../../../config/constantClass.dart';

class deposit_history extends StatefulWidget {


  @override
  State<deposit_history> createState() => _deposit_history();
}

class _deposit_history extends State<deposit_history> {
List History_data=[];
bool dataload=false;
  @override
  void initState() {
    DepositHistory();
setState(() {
  dataload=true;
});
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  Future<void> DepositHistory() async {
    final paramDic = {
      "":"",


    };
    var response = await LBMAPIMainClass(APIClasses.Deposithistory +"/"+await SharedPreferenceClass.GetSharedData("id"), paramDic, "Get");
    var data = json.decode(response.body);
    History_data.clear();
    if(data["status_code"]=="1"){
      setState(() {
        History_data=data["data"];
        print("Historydata"+History_data.toString());
        dataload=false;
      });

    }
    else{
      setState(() {
        dataload=false;
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Deposit History",style: TextStyle(fontFamily: "IBM Plex Sans")), backgroundColor: Color(0xff17394f),),backgroundColor: day==false?Colors.black:Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: dataload?Center(child: Container(height: 20,width: 20, child: CircularProgressIndicator())):Container(
          height: MediaQuery.of(context).size.height,
          child: History_data.length>0?ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: History_data.length,
              itemBuilder: (context, index) {
                //return CartItem(index: index, products: cartList.cartItems[index]);
                return CardData(context,index);
                //return cartItems(index, products);
              }):Center(child: Text("No Data",style: TextStyle(color: day==false?Colors.white:Colors.black),)),
        ),
      ),);
  }

  Widget CardData(BuildContext context, int index) {
    return     Padding(
      padding: const EdgeInsets.only(top:8.0,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  // Text("Symbole : ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: day==false? Colors.white:Colors.black)),
                  Text(History_data[index]["symbol"].toString(),style: TextStyle(fontSize: 13,color: day==false? Colors.white:Colors.black)),
                ],
              ),
              // Row(
              //   children: [
              //     Text("Token Type : ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: day==false? Colors.white:Colors.black)),
              //     Text(History_data[index]["token_type"].toString(),style: TextStyle(fontSize: 10,color: day==false? Colors.white:Colors.black)),
              //   ],
              // ),
              Row(
                children: [
                  // Text("Amount : ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: day==false? Colors.white:Colors.black)),
                  Text(History_data[index]["amount"].toString(),style: TextStyle(fontSize: 13,color: day==false? Colors.white:Colors.black)),
                ],
              ),

            ],),
SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  // Text("Created At : ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: day==false? Colors.white:Colors.black)),
                  Text(DateFormat("dd/MM/yyyy, hh:mm:ss").format( DateTime.parse(History_data[index]["created_at"].toString()).toLocal()),style: TextStyle(fontSize: 10,color: day==false? Colors.white:Colors.black)),
                ],
              ),
              Row(
                children: [
                  // Text("Status : ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: day==false? Colors.white:Colors.black)),
                  Icon(Icons.circle,color: Colors.green,size: 10,),
                  SizedBox(width: 10,),
                  Text(History_data[index]["status"].toString(),style: TextStyle(fontSize: 13,color: day==false? Colors.white:Colors.black)),
                ],
              ),

            ],),
    //       SizedBox(height: 10,),
    //       Row(
    //         children: [
    //           Text("Token Address : ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: day==false? Colors.white:Colors.black)),
    //           InkWell(
    //             onTap: (){
    //               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WebviewScreen(url:History_data[index]["transfer_detail"]["transactionHash"].toString() ,)));
    //
    //
    //             },
    //             child: History_data[index]["token_type"].toString()=="SELF"?Container(
    // width: MediaQuery.of(context).size.width * 0.6,
    //               child: SingleChildScrollView(
    //                   scrollDirection: Axis.horizontal,
    //                   child: Text(History_data[index]["user_wallet_address"]!=null?History_data[index]["user_wallet_address"].toString():"----",style: TextStyle(fontSize: 10,color: day==false? Colors.white:Colors.black))),
    //             ):Container(
    //               width: MediaQuery.of(context).size.width * 0.6,
    //   child: SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Text(History_data[index]["token_address"]!=null?History_data[index]["token_address"].toString():"----",style: TextStyle(fontSize: 10,color: day==false? Colors.white:Colors.black))),
    // ),
    //           ),
    //         ],
    //       ),


          Divider(color: day==false?Colors.white54:Colors.black54,)
        ],
      ),
    );

  }
}
