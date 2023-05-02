


// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:exchange/config/constantClass.dart';
import 'package:exchange/screen/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:exchange/screen/market/Search.dart';
import 'package:exchange/screen/market/TabBarBody/btc.dart';
import 'package:exchange/screen/market/TabBarBody/favorite.dart';
import 'package:flutter/material.dart';

class market extends StatefulWidget {
  final Widget child;

  market({Key key, this.child}) : super(key: key);

  _marketState createState() => _marketState();
}

class _marketState extends State<market> with SingleTickerProviderStateMixin {
  TabController _tabController;
  Map<String, dynamic> btcMarketList;
  Map<String, dynamic>  currency_data;

  @override
  void initState() {
    _tabController = new TabController(length: marketfamily.length, vsync: this, initialIndex: 1);

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: day==false?Colors.black:Colors.white,
        body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding:  EdgeInsets.only(top: screenSize.height*0.05,left: 10),
                    child: Row(
                      children: [
                        InkWell(
           onTap: (){
             Navigator.pushReplacement(
               context,
               MaterialPageRoute(builder: (context) =>bottomNavBar(index: 0,)),
             );
           },
           child: Icon(Icons.arrow_back_ios_outlined,color: day==false?Colors.white:Colors.black,)),
                        SizedBox(width: 5,),
                        Text(
         "Spot",
         style: TextStyle(
             color: day==false?Colors.white:Colors.black,
             fontFamily: "IBM Plex Sans",
             fontWeight: FontWeight.w600,
             letterSpacing: 1.5,
             fontSize: 22.5),

                        ),

                        SizedBox(width: 10,),
                        // InkWell(
                        //     onTap: (){
                        //       firsttimesearch=0;
                        //       Navigator.of(context)
                        //           .push(PageRouteBuilder(
                        //           pageBuilder: (_, __, ___) => new Search()));
                        //     },
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(right: 30),
                        //       child: Icon(Icons.search,color:day==false?Colors.white:Colors.black,),
                        //     )),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context)
         .push(PageRouteBuilder(
         pageBuilder: (_, __, ___) => new Search()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
                      child: Card(
                        shadowColor: Colors.white24,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(15.0),
         ),
         //shadowColor: Colors.black,
         color: day==false?Colors.transparent:Colors.white,
         child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: Row(
             children: [
               Icon(Icons.search,size:20,color: day==false?Colors.white:Colors.black,),
               SizedBox(width: 10,),
               Text("Search Coin Pairs",style: TextStyle(
                   color: day==false?Colors.white60:Colors.black54,fontFamily: 'IBM Plex Sans'
               ),),
             ],
           ),
         )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10,left: 10,right: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                       shadowColor: Colors.white24,
                        color: day==false?Colors.black:Colors.white,
                        child: Column(
         children: [
           TabBar(
             isScrollable: true,
             controller: _tabController,
             indicator: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 gradient: LinearGradient(
                     colors: [ Color(0xff17394f),Color(0xff17394f)])),
             labelColor: Colors.white,
             unselectedLabelColor: day==false?Colors.white38:Colors.black38,
             unselectedLabelStyle: TextStyle(fontFamily: "IBM Plex Sans",                          letterSpacing: 1.5,),
             labelStyle: TextStyle(fontFamily: "IBM Plex Sans",fontWeight: FontWeight.w800, letterSpacing: 1.5,
             ),
             indicatorPadding: EdgeInsets.all(2.0),
             tabs: <Widget>[
               for(int i=0;i<marketfamily.length;i++)
                 new Tab(
                   child: Text(
                     marketfamily[i].toString(),
                     style: TextStyle(fontFamily: "IBM Plex Sans"),
                   ),
                 ),
               // new Tab(
               //   child: Text(
               //     "BTC",
               //     style: TextStyle(fontFamily: "IBM Plex Sans"),
               //   ),
               // ),
               // new Tab(
               //   child: Text(
               //     "USDT",
               //     style: TextStyle(fontFamily: "IBM Plex Sans"),
               //   ),
               // ),
               // new Tab(
               //   child: Text(
               //     "BNB",
               //     style: TextStyle(fontFamily: "IBM Plex Sans"),
               //   ),
               // ),
               // new Tab(
               //   child: Text(
               //     "ETH",
               //     style: TextStyle(fontFamily: "IBM Plex Sans"),
               //   ),
               // ),
             ],

           ),

         ],
                        ),

                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: day==false?Colors.transparent:Colors.white,
                      child: TabBarView(
                        children: <Widget>[
         for(int i=0;i<marketfamily.length;i++)
           marketfamily[i].toString()=="FAV"?
           favorite():
           btc(familycurrency_name: marketfamily[i].toString(),)


         // , btc(), usdt(), bnb(), eth()
                        ],
                        controller: _tabController,
                      ),
                    ),
                  ),

                ],
                //   body: TabBarView(
                //     children: <Widget>[favorite(), btc(), usdt(), bnb(), eth()],
                //     controller: _tabController,
                //   ),
                // ),
              ));
  }
}