import 'package:db_miner/db_miner/view/addquote_screen.dart';
import 'package:db_miner/db_miner/view/miner_homescreen.dart';
import 'package:db_miner/db_miner/view/show_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
   Sizer(builder: (context, orientation, deviceType) {
     return  GetMaterialApp(
       debugShowCheckedModeBanner: false,
       routes: {
         '/':(p0) => HomeScreen(),
         '/add':(p0) => AddScreen(),
         '/show':(p0) => ShowScreen(),
       },
     );
   },)
  );
}
