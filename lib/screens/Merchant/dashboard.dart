import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MerchantDashboardScreen extends StatelessWidget{

  const MerchantDashboardScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

 return Scaffold(
   appBar: AppBar(
     title: Text('Dashboard'),
     centerTitle: true,
   ),
   body: Padding(
     padding: EdgeInsets.all(30),
     child: SingleChildScrollView(
       child: Column(
         children: [

         ],
       ),
     ),
   ),
 );
  }


}