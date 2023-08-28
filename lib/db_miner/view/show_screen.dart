import 'dart:math';

import 'package:db_miner/db_miner/controller/db_miner_controller.dart';
import 'package:db_miner/db_miner/db_helper/db_miner_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({super.key});

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}



class _ShowScreenState extends State<ShowScreen> {

  String? rcategory;

  DBMinerController controller=Get.put(DBMinerController());
  @override

  void initState() {
    rcategory=Get.arguments;
    super.initState();
    controller.loadcat(rcategory);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xffFFF6E5),
      appBar: AppBar(title: Text("Quotes ",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Colors.purple.shade200,),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () =>  ListView.builder(itemBuilder: (context, index) {
                Random r =Random();
                controller.bgIndex.value=r.nextInt(controller.bgList.length);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20.h,
                    width: 100.w,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text("${controller.quotesList[index]['quotes']}",style: TextStyle(fontSize: 24,color: Colors.black),),
                        SizedBox(height: 5),
                        Text("${controller.quotesList[index]['name']}",style: TextStyle(fontSize: 15,color: Colors.black),),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(onPressed: () {
                            }, icon: Icon(Icons.delete)),
                            IconButton(onPressed: () {

                            }, icon: Icon(Icons.edit)),
                            IconButton(onPressed: () {

                            }, icon: Icon(Icons.copy)),
                            IconButton(onPressed: () {

                            }, icon: Icon(Icons.share)),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image: DecorationImage(image: AssetImage("${controller.bgList[controller.bgIndex.value]}"),fit: BoxFit.fill)),
                  ),
                );
              },itemCount: controller.quotesList.length,),
            ),
          )
        ],
      ),
    ));
  }
}
