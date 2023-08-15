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
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Quotes ",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Colors.purple.shade200,),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 100.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.purple),
          ),
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
                        //Text("${controller.quotesList[index]['quotes']}",style: TextStyle(fontSize: 25,color: Colors.white),),
                        SizedBox(height: 5),
                        //Text("${controller.quotesList[index]['name']}",style: TextStyle(fontSize: 15,color: Colors.white),),
                      ],
                    ),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.purple.shade100),
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
