import 'package:db_miner/db_miner/controller/db_miner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBMinerController controller=Get.put(DBMinerController());

  @override
  void initState() {
    super.initState();
    controller.load();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.purpleAccent.shade100,
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.toNamed('/add',arguments: {'l1':0,'index':null});
      },child: Icon(Icons.add_circle_outline_outlined),),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap:() {
                    Get.toNamed('/add',arguments: {'l1':0,'index':null});
                  },
                  child: Container(
                    height: 60,
                    width: 40.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white30),
                    child: Center(child: Text("Add Quotes",style: TextStyle(fontSize: 20,color: Colors.white),)),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.toNamed('/addcate',arguments: {"l1":0,"index":null});
                  },
                  child: Container(
                    height: 60,
                    width: 40.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white30),
                    child: Center(child: Text("Add Category",style: TextStyle(color: Colors.white,fontSize: 20),)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () =>  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/show',arguments: '${controller.quotesList[index]['category']}');
                    },
                    child: Container(

                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image: DecorationImage(image: AssetImage("assets/images/img_2.png"),fit: BoxFit.fill,opacity: 50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //mainAxisSize:  min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 10),
                            child: Text("${controller.quotesList[index]['category']}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },itemCount: controller.quotesList.length),
            ),
          )
        ],
      )
    ));
  }
}
//
