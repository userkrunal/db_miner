import 'package:db_miner/db_miner/controller/db_miner_controller.dart';
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
    print('=============================================${rcategory}========');
    super.initState();
    controller.loadcat(rcategory);
    print('=========================================================================${controller.quotesList}');
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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    width: 100.w,
                    child: Column(
                      children: [
                        Text("${controller.quotesList[index]['quotes']}",style: TextStyle(fontSize: 25,color: Colors.black),),
                        SizedBox(height: 5),
                        Text("${controller.quotesList[index]['name']}",style: TextStyle(fontSize: 15,color: Colors.black),),
                      ],
                    ),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
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
